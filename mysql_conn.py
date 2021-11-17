from flaskext.mysql import MySQL
from flask import jsonify
import json


def sql_conn(app):
    mySQL = MySQL()
    app.config['MYSQL_DATABASE_USER'] = 'root'
    app.config['MYSQL_DATABASE_PASSWORD'] = 'password'
    app.config['MYSQL_DATABASE_DB'] = 'NBA_Project'
    app.config['MYSQL_DATABASE_HOST'] = 'localhost'
    mySQL.init_app(app)
    return mySQL.connect()


def exec_sql(query, conn, force_json=False):
    cursor = conn.cursor()
    cursor.execute(query)
    if not force_json:
        data = cursor.fetchall()
    else:
        data = [dict((cursor.description[i][0], value) for i, value in enumerate(row)) for row in cursor.fetchall()]
    conn.commit()
    cursor.close()
    return data
