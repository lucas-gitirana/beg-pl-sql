create or replace package DEBUGGER as

-- disable debug logging for the specified program unit
PROCEDURE disable(
    aiv_program_unit in varchar2
);

-- enable debug logging for the specified program unit
PROCEDURE enable(
    aiv_program_unit in varchar2
);

-- conditionally log the debug information for the specified program unit if is enabled
PROCEDURE set_text(
    aiv_program_unit in varchar2,
    aiv_text in DEBUGS.text%TYPE
);

end DEBUGGER;
/

