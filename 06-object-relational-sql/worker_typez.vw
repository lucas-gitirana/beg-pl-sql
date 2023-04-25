create view WORKER_TYPEZ of WORKER_TYPE
with object identifier (id) as
select id, code, description, active_date, inactive_date
from WORKER_TYPES;