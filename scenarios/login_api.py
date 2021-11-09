from mysql_conn import exec_sql

def success(username, pwd, conn):
    query = f"SELECT NBA_Project.login({username}, {pwd})"
    if exec_sql(query, conn)[0][0]:
        return True
    return False