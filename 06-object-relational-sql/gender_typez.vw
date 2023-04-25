create view GENDER_TYPEZ of GENDER_TYPE 
with object identifier (id) as
select id, code, description, active_date, inactive_date
from OPS.GENDER_TYPES;