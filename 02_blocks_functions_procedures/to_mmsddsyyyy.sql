CREATE OR REPLACE FUNCTION to_mmsddsyyyy_or_null(
aiv_date IN varchar2)
return date is

begin 
    return to_date(aiv_date,'MM/DD/YYYY');
exception
  when others then
    return NULL;
end to_mmsddsyyyy_or_null;
/