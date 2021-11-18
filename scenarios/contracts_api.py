# SJSU CMPE 138 Fall 2021 TEAM8
from mysql_conn import exec_sql
from flask_table import Table, Col, LinkCol, ButtonCol
from werkzeug.utils import redirect


class Form_update_current_contract(Table):
    Player = Col('Player')
    Start_date = Col('Start_date')
    End_date = Col('End_date')
    Duration = Col('Duration')
    Wage = Col('Wage')
    update_current_contract = LinkCol('Update', 'update_current_contract', url_kwargs=dict(p_id='p_id'))


class Item_update_current_contract(object):
    def __init__(self, p_id, Player, Start_date,
     End_date, Duration, Wage  ):
        self.p_id = p_id
        self.Player = Player
        self.Start_date = Start_date
        self.End_date = End_date
        self.Duration = Duration
        self.Wage = Wage


class Form_new_contract(Table):
    Player = Col('Player')
    Performance = Col('Performance')
    Height = Col('Height')
    Weight = Col('Weight')
    Team_Name = Col('Team_Name')
    End_Date = Col('End_Date')
    Wage = Col('Wage')
    create_contract = LinkCol('Edit', 'create_contract', url_kwargs=dict(p_id='p_id'))


class Item_create_contract(object):
    def __init__(self, p_id, Player, Performance, Height, Weight, Team_Name, End_Date, Wage):
        self.p_id = p_id
        self.Player = Player
        self.Performance = Performance
        self.Height = Height
        self.Weight = Weight
        self.Team_Name = Team_Name
        self.End_Date = End_Date
        self.Wage = Wage


def get_info(conn, id, request):
    mg_id = id
    cur = conn.cursor()
    team_query = ("""select t_name from Team T join Manager m on T.mg_id = m.mg_id
                    where m.mg_id = %s""")
    cur.execute(team_query, mg_id)
    team_name = cur.fetchall()[0][0]
    tid_query = ("""select t_id from Team T join Manager m on T.mg_id = m.mg_id
                    where m.mg_id = %s""")
    cur.execute(tid_query, mg_id)
    tid = str(cur.fetchall()[0][0])

    contract_mg_id_table_query = ("""
                                    SELECT c.mg_id, 
                                    p.p_id, 
                                    p.p_name as Player,
                                    c.start_date AS Start_date, 
                                    c.end_date AS End_date, 
                                    c.duration AS Duration, 
                                    c.wage AS Wage
                                    FROM Contract c
                                    NATURAL JOIN Player p
                                    WHERE c.mg_id =%s and c.is_active = TRUE;
                                    """)

    cur.execute(contract_mg_id_table_query, mg_id)
    result = cur.fetchall()

    ls_items = []
    for obj in result:
        mg_id = obj[0]
        p_id = obj[1]
        Player = obj[2]
        Start_date = obj[3]
        End_date = obj[4]
        Duration = obj[5]
        Wage = obj[6]
        cur_obj = Item_update_current_contract(
            p_id=p_id,
            Player=Player,
            Start_date=Start_date,
            End_date=End_date,
            Duration=Duration,
            Wage=Wage,
        )

        ls_items.append(cur_obj)

    table1 = Form_update_current_contract(ls_items)
    if request.method == 'POST':
        if request.form['action'] == "Back":
            return redirect('/manager-home')
        elif request.form['action'] == "Search":
            player_name = request.form['searchplayer']
            player_id_query = ("""SELECT p_id
                                    FROM Player
                                    WHERE p_name like ('%"""+player_name +"""%');""")
            cur.execute(player_id_query)
            player_id = cur.fetchall()
            if len(player_id) == 0:
                return {
                    "data1": table1,
                    "data2": "",
                    "team_name": team_name
                }
            ls_str_player_id = []
            for x in player_id:
                ls_str_player_id.append(str(x[0]))
            str_player_id = ",".join(ls_str_player_id)
            str_player_id = "(" + str_player_id + ")"
            contract_p_id_table_query = ("""
                                    SELECT p.p_id, 
                                    p.p_name as Player, 
                                    SUM(s.tot_points)/COUNT(*) AS Performance, 
                                    p.p_height AS Height, 
                                    p.p_weight AS Weight, 
                                    t.t_name AS Team_Name, 
                                    c.end_date AS End_Date, 
                                    c.wage AS Wage
                                    FROM Player p
                                    NATURAL JOIN Team t 
                                    NATURAL JOIN Contract c
                                    NATURAL JOIN Stats s 
                                    WHERE p.p_id IN """ + str_player_id + """ and c.is_active = TRUE
                                    GROUP BY p.p_id, c.end_date, c.wage;
                                    """)
            cur.execute(contract_p_id_table_query)
            result2 = cur.fetchall()

            ls_items2 = []
            for obj in result2:
                p_id = obj[0]
                Player = obj[1]
                Performance = obj[2]
                Height = obj[3]
                Weight = obj[4]
                Team_Name = obj[5]
                End_Date = obj[6]
                Wage = obj[7]
                cur_obj = Item_create_contract(
                    p_id=p_id,
                    Player=Player,
                    Performance=Performance,
                    Height=Height,
                    Weight=Weight,
                    Team_Name=Team_Name,
                    End_Date=End_Date,
                    Wage=Wage,
                )

                ls_items2.append(cur_obj)
                
            table2 = Form_new_contract(ls_items2)
        return {
            "data1": table1,
            "data2": table2,
            "team_name": team_name
        }
    else:
        return {
            "data1": table1,
            "data2": "",
            "team_name": team_name
        }
