from flask import Markup, flash, url_for, redirect, render_template
from mysql_conn import exec_sql


def create_contract(conn, mg_id, p_id, request):
    cur = conn.cursor()
    if request.method == 'POST':
        if request.form['action'] == "Submit":
            sign_new_contract = f"""CALL sign_new_contract({mg_id}, {p_id}, '{request.form['start_date']}', '{request.form['end_date']}', {request.form['salary']})"""
            if exec_sql(sign_new_contract, conn):
                status = Markup("<h3> Completed! </h3>")
            else:
                status = Markup("<h3> Internal Server Error! Please try again after sometime. </h3>")
            flash(status)
            return redirect('/contracts')
    else:
        player_query = ("""SELECT p.p_name as Player, c.start_date AS Start_date, c.end_date AS End_date, c.duration AS Duration, c.wage AS Wage
                            FROM Contract c
                            NATURAL JOIN Player p 
                            WHERE p.p_id =  %s;""")
        cur.execute(player_query, [p_id])
        data1 = cur.fetchone()
        return render_template('create_contract.html', x=data1)
