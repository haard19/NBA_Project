# SJSU CMPE 138 Fall 2021 TEAM8
from mysql_conn import exec_sql
import hashlib


def success(username, pwd, conn):
    query = f"CALL NBA_Project.login('{username}', '{pwd}')"
    data = exec_sql(query, conn)
    if len(data) > 0:
        return data[0][0]
    return None
