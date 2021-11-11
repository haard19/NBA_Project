from os import abort
from flask import Flask, request
from werkzeug.utils import redirect
from mysql_conn import sql_conn
from scenarios import login_api, signup_api, index_api, fan_home_api, view_fantasy_team_api
from scenarios import create_fantasy_team_view, add_fantasy_team_view, view_all_messages_api
from scenarios import add_message_api

app = Flask(__name__)

USER_ID = -1

conn = sql_conn(app)

@app.route('/index', methods=['GET'])
def index():
    data = index_api.get_info(conn)
    redirect('/login')
    return data

@app.route('/login', methods=['POST'])
def login():
    request_data = request.get_json()
    username = request_data['username']
    pwd = request_data['password']
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
                return redirect('/manager_home')
        else:
            return abort()

@app.route('/signup', methods=['POST'])
def signup():
    request_data = request.get_json()
    if signup_api.success(request_data, conn):
        return redirect('/login')
    else:
        abort()

@app.route('/fan_home', methods=['POST', 'GET'])
def fan_home():
    data = fan_home_api.get_info(conn, USER_ID)
    return data

@app.route('/view_fantasy_team', methods=['POST', 'GET'])
def view_fantasy_team():
    data = view_fantasy_team_api.get_info(conn, USER_ID)
    return data

@app.route('/create_fantasy_team', methods=['GET'])
def create_fantasy_team():
    data = create_fantasy_team_view.get_info(conn)
    return data

@app.route('/add_fantasy_team', methods=['POST'])
def add_fantasy_team():
    player_ids = request.get_json()['player_ids']
    team_name = request.get_json()['team_name']
    data = add_fantasy_team_view.get_info(conn, USER_ID, player_ids, team_name)
    return data

@app.route('/message-board', methods=['GET'])
def view_messages():
    data = view_all_messages_api.get_info(conn)
    return data

@app.route('/add-message', methods=['POST'])
def add_message():
    message = request.get_json()['message']
    data = add_message_api.get_info(conn, USER_ID, message)
    return redirect('/message-board')
    


if __name__ == '__main__':
    app.run(debug=False, port=5000)