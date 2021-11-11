from mysql_conn import exec_sql
import json

def get_info(conn):
    query = f"""
    SELECT p_id, Player, Team, CAST(Points AS unsigned) AS Points FROM NBA_Project.create_new_fantasy_team_view;
    """
    data = exec_sql(query, conn, True)
    return json.dumps(data)