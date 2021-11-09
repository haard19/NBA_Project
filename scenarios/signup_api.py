from mysql_conn import exec_sql

def success(request_data, conn):
    pwd = request_data['pwd']
    last_name = request_data['last_name']
    first_name = request_data['first_name']
    phone = request_data['phone']
    email = request_data['email']
    query = f"SELECT NBA_Project.signup('{first_name}', '{last_name}', '{phone}', '{email}', '{pwd}');"
    print(query)
    data = exec_sql(query, conn)[0][0]
    if data==1:
        print("In 1")
        return True
    return False