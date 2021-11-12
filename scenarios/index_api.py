from mysql_conn import exec_sql
import json


def get_info(conn):
    query = """
    SELECT tm.t_name AS Team, M AS P, W AS W, (M-W) AS L, W*3 AS Points
    FROM (
    SELECT T.t_id AS T, COUNT(DISTINCT T.m_id) AS M, IFNULL(WN.W, 0) AS W
    FROM
    (SELECT p.m_id, p.t_id1 AS t_id, p.winner FROM Participates p
    UNION ALL
    SELECT p.m_id, p.t_id2 AS t_id, p.winner FROM Participates p) T
    LEFT JOIN
    (SELECT winner AS t_id, COUNT(winner) AS W FROM Participates p GROUP BY winner) WN
    ON T.t_id = WN.t_id
    GROUP BY T.t_id) AS TMW
    JOIN Team AS tm
    ON TMW.T=tm.t_id;
    """
    data_0 = exec_sql(query, conn, True)

    query = """
    SELECT p.p_name as Player, CAST(st.total_points AS unsigned) as Total_Points, CAST(st.FGA AS unsigned) as FGA, 
    CAST(st.FGM AS unsigned) as FGM, cast((CASE WHEN `3PA`=0 THEN 0 ELSE `3PM`/`3PA`* 100 END) AS unsigned) AS `3P%`,
    CAST(st.`3PA` as unsigned) AS 3PA, CAST(st.`3PM` AS unsigned) as 3PM FROM
    ((SELECT s.p_id, SUM(tot_points) as total_points, SUM(FGA) as FGA, SUM(FGM) AS FGM, SUM(`3PA`) AS `3PA`, SUM(`3PM`) AS `3PM`
    FROM Stats s
    GROUP BY s.p_id) AS st
    NATURAL JOIN
    Player p)
    ORDER BY st.Total_Points DESC;
    """
    data_1 = exec_sql(query, conn, True)
    final = {
        "team": data_0,
        "player": data_1
    }
    return json.dumps(final)
