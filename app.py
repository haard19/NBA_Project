from os import abort
from flask import Flask, request, jsonify
from werkzeug.utils import redirect
from mysql_conn import sql_conn, exec_sql
from scenarios import login_api, signup_api

app = Flask(__name__)

conn = sql_conn(app)

# @app.route('/all-teams', methods=['POST'])
# def all_teams():
#     request_data = request.get_json()['name']
#     data = exec_sql(f"SELECT * FROM Team WHERE t_name = '{request_data}'", conn)
#     return jsonify(data)

@app.route('/index', methods=['GET'])
def index():
    index.get_info(conn)

@app.route('/login', methods=['POST'])
def login():
    request_data = request.get_json()
    username = request_data['username']
    pwd = request_data['password']
    if not username or not pwd:
        abort(400)
    else:
        if login_api.success(username, pwd, conn):
            if request_data['type'] == 'Fan':
                redirect('/fan_home')
            else:
                redirect('/manager_home')
        else:
            return abort(404)

@app.route('/signup', methods=['POST'])
def signup():
    request_data = request.get_json()
    if signup_api.success(request_data, conn):
        # redirect('/fan_home')
        print("blah")
        return "blah"
    else:
        abort()

if __name__ == '__main__':
    app.run(debug=False, port=5000)