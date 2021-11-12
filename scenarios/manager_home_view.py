from app import USER_ID
from mysql_conn import exec_sql
import json


def get_my_team(conn, USER_ID):
    query_0 = f"""SELECT t.t_id, t.t_name FROM Team t WHERE t.mg_id = {USER_ID};"""
    return exec_sql(query_0, conn, True)[0]


def get_info(conn, team_info):
    query = f"""
    SELECT CAST(pm.m_timestamp AS CHAR) AS `Timestamp`, t.t_name AS Opponent, t2.t_name AS Winner
    From
    ((SELECT m.m_timestamp, (CASE WHEN p.t_id1 = {team_info.get('t_id')} THEN p.t_id2 ELSE p.t_id1 END) AS t_id, winner FROM
    Participates p
    NATURAL JOIN `Match` m
    WHERE p.t_id1 = {team_info.get('t_id')} OR p.t_id2 = {team_info.get('t_id')}) AS pm
    NATURAL JOIN Team t
    JOIN Team t2
    ON pm.winner = t2.t_id
    );
    """
    return exec_sql(query, conn)


def get_match_stats(conn, team_info, timestamp):
    query = f"""
    SELECT p.p_name, s.tot_points, s.FGA, s.FGM, s.`3P%`, s.`3PA`, s.`3PM`
    FROM Stats s
    NATURAL JOIN Player p
    NATURAL JOIN `Match` m
    WHERE p.t_id = {team_info.get('t_id')} AND m.m_timestamp = '{timestamp}'
    ORDER BY p.p_name ASC;
    """
    data = exec_sql(query, conn)
    return data
