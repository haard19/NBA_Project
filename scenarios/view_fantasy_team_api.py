from mysql_conn import exec_sql
import json


def get_info(conn, fan_id):
    query = f"""
    CALL view_fantasy_team({fan_id})
    """
    data = exec_sql(query, conn, True)
    return json.dumps(data)