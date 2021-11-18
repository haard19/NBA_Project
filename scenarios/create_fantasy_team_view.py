from mysql_conn import exec_sql
import json


def get_info(conn):
    query = f"""
    SELECT p_id, Player, Team, CAST(Points AS unsigned) AS Points FROM NBA_Project.create_new_ft_view;
    """
    data = exec_sql(query, conn, True)
    return data
