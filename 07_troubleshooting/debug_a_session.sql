define unique_session_id = &1;

select id, text
from DEBUGS
where unique_session_id = upper('&unique_session_id')
and insert_date > SYSDATE - 10/(24*60)
order by id;