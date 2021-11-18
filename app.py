#SJSU CMPE 138 Fall 2021 TEAM8
import logging
from os import abort
import hashlib
from flask import Flask, flash, render_template, request, make_response, redirect, url_for, Markup 
from flask_mysqldb import MySQL
import datetime 

from werkzeug.utils import redirect
from flask_table import Table, Col, LinkCol, ButtonCol
from mysql_conn import sql_conn
import json
from scenarios import login_api, signup_api, index_api, fan_home_api, view_fantasy_team_api
from scenarios import create_fantasy_team_view, add_fantasy_team_view, view_all_messages_api
from scenarios import add_message_api, manager_home_view, contracts_api, update_contract, create_contract_api



app = Flask(__name__)
logging.basicConfig(filename='record.log', level=logging.INFO, format=f'%(asctime)s %(levelname)s %(name)s %(threadName)s : %(message)s')
 

app.secret_key = "Super Secret Key"
USER_ID = -1
conn = sql_conn(app)

@app.route('/', methods=['GET'])
def index():
    data = index_api.get_info(conn)
    return render_template('bootstrap_table.html', data = data['team'], data_two = data['player'])


@app.route('/logout', methods=['GET'])
def logout():
    resp = redirect('/')
    resp.set_cookie('user_id', '')
    resp.set_cookie('username', '') 
    resp.set_cookie('usertype', '')
    resp.set_cookie('login', '')
    return resp


@app.route('/login', methods=['POST', 'GET'])
def login():
    if request.method == 'GET':
        return render_template('login.html')
    else:
        request_data = json.loads(json.dumps(request.form))
        print(request_data)
        username = request_data.get('email')
        usertype = request_data.get('type')
        pwd = hashlib.md5(request_data.get('password').encode()).hexdigest()
        if not username or not pwd:
            abort()
        else:
            data = login_api.success(username, pwd, conn)
            if data:
                if request_data['type'] == 'Fan':
                    resp =  redirect(url_for('fan_home'))
                else:
                    resp =   redirect('/manager-home')
                resp.set_cookie('user_id', str(data))
                resp.set_cookie('username', username) 
                resp.set_cookie('usertype', usertype)
                resp.set_cookie('login', 'True')
                return resp
            else:
                return abort()


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
    USER_ID = request.cookies.get('user_id')
    data = fan_home_api.get_info(conn, USER_ID)
    return render_template('bootstrap_dupli.html', data=data['team'], data_two=data['player'])


@app.route('/view-fantasy-team', methods=['POST', 'GET'])
def view_fantasy_team():
    USER_ID = request.cookies.get('user_id')
    data = view_fantasy_team_api.get_info(conn, USER_ID)
    if request.method == 'POST':
        if request.form['action'] == "Back":
            return redirect('/fan_home')
    if len(data) == 0:
        return redirect('/create-fantasy-team')
    return render_template('fantasyteam.html', data=data)


@app.route('/create-fantasy-team', methods=['GET', 'POST'])
def create_fantasy_team():
    USER_ID = request.cookies.get('user_id')
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


# @app.route('/add_fantasy_team', methods=['POST'])
# def add_fantasy_team():
#     player_ids = request.get_json()['player_ids']
#     team_name = request.get_json()['team_name']
#     data = add_fantasy_team_view.get_info(conn, USER_ID, player_ids, team_name)
#     return data


# @app.route('/message-board', methods=['GET', 'POST'])
# def view_messages():
#     if request.method == 'POST':
#         if request.form['action'] == "Back":
#             return redirect('/fan_home')
#         message = request.form['message']
#         add_message_api.get_info(conn, USER_ID, message)
#     data = view_all_messages_api.get_info(conn)
#     return render_template('messageboard.html', data=data)


## Create a linked column to delete a message
class Form_delete_message(Table):
    Date = Col('Date')
    Message_Content = Col('Message_Content')
    create_contract = LinkCol('Delete', 'deletemessage',
                                        url_kwargs = dict(f_id = 'f_id', Date = 'Date'))

class Item_delete_message(object):
    def __init__(self, f_id, Date, Message_Content):
        self.f_id = f_id
        self.Date = Date
        self.Message_Content = Message_Content


# Manager page
@app.route("/message-board", methods=['POST', 'GET'])
def messageboard(): 
    # visitor_name = request.cookies.get('u_id')
    # resp = redirect(url_for('ownermsp'))
     # resp.set_cookie('u_id', f_id)
    USER_ID = request.cookies.get('user_id')
    USER_ID = request.cookies.get('user_id')
    USER_ID = request.cookies.get('user_id')
    USER_ID = request.cookies.get('user_id')

    print(USER_ID)
    f_id = str(USER_ID)
    cur = conn.cursor()
    all_message_query = ("""Select msg_timestamp as Date, msg_content as Content
                            from nba_project.message
                            Order by Date DESC;""")
    cur.execute(all_message_query)
    message_table =  cur.fetchall()
    

    my_message_query = ("""Select f_id, msg_timestamp as Date, msg_content as Message_Content
                            from nba_project.message
                            where f_id = """ + f_id +"""
                            Order by msg_timestamp DESC;""")
    cur.execute(my_message_query)
    result_messageboard = cur.fetchall()

    ls_message = []
    for obj in result_messageboard:
        f_id = obj[0]
        Date = obj[1]
        Message_Content = obj[2]
        cur_obj = Item_delete_message(
            f_id = f_id,
            Date = Date,
            Message_Content= Message_Content,
        )

        ls_message.append(cur_obj)

    my_message = Form_delete_message(ls_message)
    cur.close()

    if request.method == 'POST':
        if request.form['action'] == "Back":
            return  redirect('/fan_home')
        elif request.form['action'] == "Post":
            cur = conn.cursor()

            new_message_content = str(request.form.get('message'))
            
            if "'" in new_message_content:
                list_string = new_message_content.split("'")
                message_content = "\\'".join(list_string)
            else:
                message_content = new_message_content
            
            d = datetime.datetime.now()
            date_posted = str(d.year) + "-" + str(d.month) + "-" + str(d.day)+ " "+ str(d.hour)+":"+str(d.minute)+":" + str(d.second)
            print(date_posted)
            insert_new_message = ("""Insert into message (f_id, msg_timestamp, msg_content)
                                    values ('"""+ str(f_id) +"""', '"""+date_posted+"""', '"""+message_content+"""');""")
            print(insert_new_message)
            cur.execute(insert_new_message)
            conn.commit()
            cur.close()
            post_success = Markup("<h3> Posted! </h3>")
            flash(post_success)
            return redirect('/message-board')
    else: # get
        
        return render_template('messageboard.html',data1 = message_table, data2 = my_message)

@app.route("/deletemessage/<f_id>/<Date>", methods=['POST', 'GET'])
def deletemessage(f_id, Date):
    
    cur = conn.cursor()
    deletemessage_query = ("""DELETE FROM message
                            where msg_timestamp = '"""+Date+"""' and f_id = '"""+f_id+"""';""")
    cur.execute(deletemessage_query)
    conn.commit()
    cur.close()
    return redirect('/message-board')

@app.route('/manager-home', methods=['GET', 'POST'])
def manager_home():
    USER_ID = request.cookies.get('user_id')
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
    USER_ID = request.cookies.get('user_id')
    data = contracts_api.get_info(conn, USER_ID, request)
    if request.method == 'POST':
        if request.form['action'] == "Back":
            return redirect('/manager-home')
    return render_template('contract.html', data1=data.get("data1"), data2=data.get("data2"), team_name=data.get("team_name"))


@app.route("/update_current_contract/<p_id>", methods=['POST', 'GET'])
def update_current_contract(p_id):
    USER_ID = request.cookies.get('user_id')
    data = update_contract.update_current_contract(conn, USER_ID, p_id, request)
    if not data:
        return redirect('/contracts')
    return data


@app.route("/create_contract/<p_id>", methods=['POST', 'GET'])
def create_contract(p_id):
    USER_ID = request.cookies.get('user_id')
    data = create_contract_api.create_contract(conn, USER_ID, p_id, request)
    if not data:
        return redirect('/contracts')
    return data


if __name__ == '__main__':
    app.run(debug=True, port=5000)
