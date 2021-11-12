from mysql_conn import exec_sql
import json


def get_info(conn):
    query = f"""
    SELECT f_id, CAST(msg_timestamp AS CHAR) AS msg_timestamp, msg_content FROM Message
    ORDER BY msg_timestamp DESC;
    """
    data = exec_sql(query, conn, True)
    print(data)
    return json.dumps(data)