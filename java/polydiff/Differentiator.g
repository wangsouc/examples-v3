tree grammar Differentiator;
options {
	tokenVocab=Poly;
	ASTLabelType=CommonTree;
	output=AST;
//	rewrite=true;
}

poly:	^('+' poly term)
	|	term
	;

term
	:	^(MULT INT ID)		-> INT
	|	^(MULT c=INT ^('^' ID e=INT))
		{
		String c2 = String.valueOf($c.int*$e.int);
		String e2 = String.valueOf($e.int-1);
		}
							-> ^(MULT INT[c2] ^('^' ID INT[e2]))
	|	^('^' ID e=INT)
		{
		String c2 = String.valueOf($e.int);
		String e2 = String.valueOf($e.int-1);
		}
							-> ^(MULT INT[c2] ^('^' ID INT[e2]))
	|	INT					-> INT["0"]
	|	ID					-> INT["1"]
	;
