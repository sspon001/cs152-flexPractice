digit	[0-9]
char	[a-zA-Z]
alpha   {a-fA-F]
hextail	({digit}|{alpha}){1,8}
hex	0[xX]{hextail}
plus	[+]
minus	[-]
mult	[*]
div	[/]
L_paren	[(]
R_paren	[)]
equal	[=]

%{
int opCount, parenCount, eqCount, intCount ;
%}

%%
{digit}	printf("NUMBER [%s]\n", yytext) ; intCount++ ;
{plus}	printf("+\n") ; opCount++ ;
{minus}	printf("-\n") ; opCount++ ;
{mult}	printf("*\n") ; opCount++ ;
{div}	printf("/\n") ; opCount++ ;
{L_paren} printf("L_PAREN\n") ; parenCount++ ;
{R_paren} printf("R_PAREN\n") ; parenCount++ ;
{equal} {
		printf("EQUAL\n") ; 
		eqCount++ ; 
		printf("INTS: [%d]\nOPS: [%d]\nPARENS: [%d]\nEQUALS: [%d]\n", intCount, opCount, parenCount, eqCount) ;
		return 0 ;
	}
{char} printf("ERROR\n") ; return 0 ;
.	printf("") ;
%%

main() {
	printf("Give me your input:\n") ;
	yylex() ;
}
