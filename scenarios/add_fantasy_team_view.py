# SJSU CMPE 138 Fall 2021 TEAM8
from mysql_conn import exec_sql
import json
from flask import render_template, redirect


player_ids = []


def get_info(conn, fan_id, player_id, team_name):
    player_ids.append(player_id)
    if len(player_ids) == 6:
        query = f"""
        CALL create_fantasy_team({fan_id}, '{team_name}', {player_ids[0]}, {player_ids[1]}, {player_ids[2]}, {player_ids[3]}, {player_ids[4]}, {player_ids[5]});
        """
        exec_sql(query, conn)
        return True
    return False

