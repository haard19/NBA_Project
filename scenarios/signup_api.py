from mysql_conn import exec_sql
import json


def success(request_data, conn):
    pwd = request_data.get('password')
    last_name = request_data.get('lastname')
    first_name = request_data.get('firstname')
    phone = request_data.get('phone')
    email = request_data.get('email')
    fav_team = request_data.get('fav_team')
    query = f"SELECT t_id from Team WHERE t_name = '{fav_team}';"
    fan_data = exec_sql(query, conn)[0][0]
    query = f"CALL NBA_Project.signup('{first_name}', '{last_name}', '{phone}', '{email}', '{pwd}', {fan_data});"
    data = exec_sql(query, conn)[0][0]
    if data == 1:
        return True
    return False


def give_data(conn):
    query = "SELECT t_id, t_name FROM Team;"
    data = exec_sql(query, conn, True)
    return json.dumps(data)