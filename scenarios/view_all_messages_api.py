from mysql_conn import exec_sql
import json


def get_info(conn):
    query = f"""
        SELECT CONCAT(U.u_fname, " ", U.u_lname) AS uname, CAST(msg_timestamp AS CHAR) AS msg_timestamp, msg_content 
        FROM Message AS M
        JOIN User AS U
        ON M.f_id = U.u_id 
        ORDER BY msg_timestamp DESC;"""
    data = exec_sql(query, conn, True)
    return data
