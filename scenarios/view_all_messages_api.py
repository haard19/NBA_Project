from mysql_conn import exec_sql
import json
from flask_table import Table, Col, LinkCol, ButtonCol


class Form_delete_message(Table):
    Date = Col('Date')
    Message_Content = Col('Message_Content')
    create_contract = LinkCol('Delete', 'delete_message', url_kwargs=dict(f_id='f_id', Date='Date'))


class Item_delete_message(object):
    def __init__(self, f_id, Date, Message_Content):
        self.f_id = f_id
        self.Date = Date
        self.Message_Content = Message_Content


def get_info(conn, f_id):
    query = f"""
        SELECT CONCAT(U.u_fname, " ", U.u_lname) AS uname, CAST(msg_timestamp AS CHAR) AS msg_timestamp, msg_content 
        FROM Message AS M
        JOIN User AS U
        ON M.f_id = U.u_id 
        ORDER BY msg_timestamp DESC;"""
    data = exec_sql(query, conn, True)

    my_message_query = (f"""Select f_id, msg_timestamp as Date, msg_content as Message_Content
                            from Message as m
                            where m.f_id = {f_id}
                            Order by m.msg_timestamp DESC;""")
    result_messageboard = exec_sql(my_message_query, conn)

    ls_message = []
    for obj in result_messageboard:
        f_id = obj[0]
        Date = obj[1]
        Message_Content = obj[2]
        cur_obj = Item_delete_message(
            f_id=f_id,
            Date=Date,
            Message_Content=Message_Content,
        )

        ls_message.append(cur_obj)

    my_message = Form_delete_message(ls_message)
    return data, my_message


def delete_message(conn, f_id, Date):
    delete_message_query = f"""DELETE FROM Message as m
                            where m.msg_timestamp = '{Date}' and m.f_id = {f_id};"""
    exec_sql(delete_message_query, conn)
    return

