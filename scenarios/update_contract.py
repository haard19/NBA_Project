from flask import Markup, flash, url_for, redirect, render_template

def update_current_contract(conn, p_id, request):
    cur = conn.cursor()
    player_query = ("""SELECT p.p_name as Player, c.start_date AS Start_date, c.end_date AS End_date, c.duration AS Duration, c.wage AS Wage
                        FROM Contract c
                        NATURAL JOIN Player p 
                        WHERE p.p_id = %s;""" )
    cur.execute(player_query, [p_id])
    data1 = cur.fetchone()
    print(request.method)
    if request.method == 'POST':
        if request.form['action'] == "Back":
            return None
        elif request.form['action'] == "Submit":
            start_date = request.form['start_date']
            end_date = request.form['end_date']
            salary = request.form['salary']
            success = Markup("<h3> Completed! </h3>")
            flash(success)
            resp = redirect(url_for('update_current_contract',p_id = p_id))
            return resp

    else:
        return render_template('update_current_contract.html', x = data1)