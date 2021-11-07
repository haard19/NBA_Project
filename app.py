from flask import Flask, request, jsonify
from mysql_conn import sql_conn, exec_sql

app = Flask(__name__)

conn = sql_conn(app)

@app.route('/all-teams', methods=['POST'])
def all_teams():
    request_data = request.get_json()['name']
    data = exec_sql(f"SELECT * FROM Team WHERE t_name = '{request_data}'", conn)
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=False, port=5000)