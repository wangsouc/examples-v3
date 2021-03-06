/** Not really useful by itself; a library of rules to import into
 *  another grammar.
 */
lexer grammar CommonLexer;

options {
    language=CSharp2;
}

ID : ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')* ;

INT : '0'..'9'+ ;

FLOAT:	INT '.' INT?
	|	'.' INT
	;

CHAR:   '\'' ( ESC | ~('\''|'\\') ) '\''
    ;

STRING
    :  '"' ( ESC | ~('\\'|'"') )* '"'
    ;

fragment
ESC :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    ;

COMMENT
    :   '/*' ( options {greedy=false;} : . )* '*/' {$channel=Hidden;}
    ;

LINE_COMMENT
    : '//' ~('\n'|'\r')* '\r'? '\n' {$channel=Hidden;}
    ;

WS : (' '|'\t'|'\r'|'\n')+ {$channel=Hidden;} ;
