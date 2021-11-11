from mysql_conn import exec_sql
import json
import pandas as pd

def get_info(conn, fan_id, player_ids, team_name):
    query = f"""
    CALL create_fantasy_team({fan_id}, '{team_name}', {player_ids[0]}, {player_ids[1]}, {player_ids[2]}, {player_ids[3]}, {player_ids[4]}, {player_ids[5]});
    """
    data = exec_sql(query, conn, True)
    return json.dumps(data)