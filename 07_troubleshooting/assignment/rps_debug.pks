create or replace package DEBUG as

n_id number := 0;

FUNCTION get_id return DEBUGS.id%TYPE;

PROCEDURE enable(
    aiv_program_unit in varchar2
);

PROCEDURE disable(
    aiv_program_unit in varchar2
);

PROCEDURE set_text(
    aiv_program_unit in varchar2,
    aiv_text in DEBUGS.text%TYPE
);

end DEBUG;
/