from mysql_conn import exec_sql
import json


def get_info(conn, fan_id):
    query = f"""
    SELECT mg_id from Manager
    """
    data = exec_sql(query, conn, True)
    return json.dumps(data)

       # CALL view_fantasy_team({fan_id})
