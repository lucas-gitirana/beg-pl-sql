create or replace package NUMBER_ as    
    FUNCTION to_number_or_null(aiv_number in varchar2) return number is 
        begin
            return to_number(aiv_number);
        exception
            when OTHERS then
                return null;        
    end to_number_or_null;
end NUMBER_;
/ 