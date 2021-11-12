from mysql_conn import exec_sql
import json


def get_info(conn, fan_id, message):
    query = f"""
    INSERT INTO NBA_Project.Message VALUES ({fan_id}, NOW(), {json.dumps(message)});
    """
    data = exec_sql(query, conn, True)
    return json.dumps(data)