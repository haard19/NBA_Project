from os import abort
from flask import Flask, request, render_template, flash, Markup
from werkzeug.utils import redirect
from mysql_conn import sql_conn
import json
from scenarios import login_api, signup_api, index_api, fan_home_api, view_fantasy_team_api
from scenarios import create_fantasy_team_view, add_fantasy_team_view, view_all_messages_api
from scenarios import add_message_api, manager_home_view, contracts_api, update_contract, create_contract_api
import hashlib
import time

app = Flask(__name__)
app.secret_key = "Super Secret Key"
USER_ID = -1
conn = sql_conn(app)


@app.route('/', methods=['GET'])
def index():
    data = index_api.get_info(conn)
    return render_template('bootstrap_table.html', data = data['team'], data_two = data['player'])


@app.route('/logout', methods=['GET'])
def logout():
    global USER_ID
    USER_ID = -1
    return redirect('/login')


@app.route('/login', methods=['POST', 'GET'])
def login():
    if request.method == 'GET':
        return render_template('login.html')
    else:
        request_data = json.loads(json.dumps(request.form))
        username = request_data.get('email')
        pwd = hashlib.md5(request_data.get('password').encode()).hexdigest()
        if not username or not pwd:
            abort()
        else:
            data = login_api.success(username, pwd, conn)
            if data:
                global USER_ID
                USER_ID = data
                if request_data['type'] == 'Fan':
                    return redirect('/fan_home')
                else:
                    return redirect('/manager-home')
            else:
                flash(Markup("<h3> Invalid Credentials </h3>"))
                return render_template('login.html')


@app.route('/signup', methods=['POST', 'GET'])
def signup():
    if request.method == 'GET':
        data = json.loads(signup_api.give_data(conn))
        return render_template('register.html', data=data)
    else:
        request_data = json.loads(json.dumps(request.form))
        if signup_api.success(request_data, conn):
            return render_template('login.html')
        else:
            abort()


@app.route('/fan_home', methods=['POST', 'GET'])
def fan_home():
    data = fan_home_api.get_info(conn, USER_ID)
    return render_template('bootstrap_dupli.html', data=data['team'], data_two=data['player'])


@app.route('/view-fantasy-team', methods=['POST', 'GET'])
def view_fantasy_team():
    data = view_fantasy_team_api.get_info(conn, USER_ID)
    if request.method == 'POST':
        if request.form['action'] == "Back":
            return redirect('/fan_home')
    if len(data) == 0:
        return redirect('/create-fantasy-team')
    return render_template('fantasyteam.html', data=data)


@app.route('/create-fantasy-team', methods=['GET', 'POST'])
def create_fantasy_team():
    data = create_fantasy_team_view.get_info(conn)
    if request.method == 'POST':
        p_id = str(str(request.form.keys()).split(' ')[1]).split("'")[1]
        team_name = request.form['team_name']
        if len(team_name) == 0:
            team_name = "myTeam"+p_id
        if add_fantasy_team_view.get_info(conn, USER_ID, p_id, team_name):
            return redirect('/view-fantasy-team')
        return render_template('create_fantasy_team.html', data=data, team_name=team_name)
    else:
        return render_template('create_fantasy_team.html', data=data, team_name="Team Name")


@app.route('/message-board', methods=['GET', 'POST'])
def view_messages():
    if request.method == 'POST':
        if request.form['action'] == "Back":
            return redirect('/fan_home')
        if request.form['action'] == "Post":
            message = request.form['message']
            add_message_api.get_info(conn, USER_ID, message)
    data, data2 = view_all_messages_api.get_info(conn, USER_ID)
    return render_template('messageboard.html', data=data, data2=data2)


@app.route("/delete-message/<f_id>/<Date>", methods=['POST', 'GET'])
def delete_message(f_id, Date):
    view_all_messages_api.delete_message(conn, f_id, Date)
    return redirect('/message-board')


@app.route('/manager-home', methods=['GET', 'POST'])
def manager_home():
    data = manager_home_view.get_my_team(conn, USER_ID)
    data1 = manager_home_view.get_info(conn, data)
    if request.method == 'GET':
        return render_template('manager.html', data=data, data1=data1)
    else:
        if request.form['action'] == "Contract":
            return redirect('/contracts')
        elif request.form['action'] == ">>":
            selected_option = str(request.form.get('match'))
            data2 = manager_home_view.get_match_stats(conn, data, selected_option)
            return render_template('manager.html', data=data, data1=data1, data2=data2, selected_option=selected_option, team_name=data['t_name'])


@app.route('/contracts', methods=['GET', 'POST'])
def contracts():
    data = contracts_api.get_info(conn, USER_ID, request)
    if request.method == 'POST':
        if request.form['action'] == "Back":
            return redirect('/manager-home')
    return render_template('contract.html', data1=data.get("data1"), data2=data.get("data2"), team_name=data.get("team_name"))


@app.route("/update_current_contract/<p_id>", methods=['POST', 'GET'])
def update_current_contract(p_id):
    data = update_contract.update_current_contract(conn, USER_ID, p_id, request)
    if not data:
        return redirect('/contracts')
    return data


@app.route("/create_contract/<p_id>", methods=['POST', 'GET'])
def create_contract(p_id):
    data = create_contract_api.create_contract(conn, USER_ID, p_id, request)
    if not data:
        return redirect('/contracts')
    return data


if __name__ == '__main__':
    app.run(debug=False, port=5000)
