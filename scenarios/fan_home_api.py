from mysql_conn import exec_sql
import json

def get_info(conn, fan_id):
    query = f"""
    SELECT p.p_name, CAST(st.total_points AS unsigned) AS Total_Points, CAST(st.FGA AS unsigned) as FGA, 
    CAST(st.FGM as unsigned) AS FGM, CAST((CASE WHEN `3PA`=0 THEN 0 ELSE `3PM`/`3PA`* 100 END) AS unsigned) AS `3P%`, 
    CAST(st.`3PA` AS unsigned) AS 3PA, CAST(st.`3PM` as unsigned) AS 3PM
    FROM
    ((SELECT s.p_id, SUM(tot_points) as total_points, SUM(FGA) as FGA, SUM(FGM) AS FGM, SUM(`3PA`) AS `3PA`, SUM(`3PM`) AS `3PM`
    FROM Stats s
    GROUP BY s.p_id) AS st
    NATURAL JOIN
    Player p)
    WHERE p.t_id = (SELECT f.fav_team FROM Fan as f WHERE f.f_id={fan_id})
    ORDER BY st.total_points DESC;
    """
    data = exec_sql(query, conn, True)
    return json.dumps(data)