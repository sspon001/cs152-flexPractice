digit	[0-9]
alpha	[a-fA-F]
hextail	({digit}|{alpha}){1,8}
hex	0[xX]{hextail}
plus	[+]
minus	[-]
mult	[*]
div	[/]
L_paren	[(]
R_paren	[)]
equal	[=]

%%
{digit}	printf("NUMBER [%s]\n", yytext) ;
{plus}	printf("+\n") ;
{minus}	printf("-\n") ;
{mult}	printf("*\n") ;
{L_paren} printf("L_PAREN\n") ;
{R_paren} printf("R_PAREN\n") ;
{alpha} printf("ERROR\n") ;
.	printf("") ;
%%

main() {
	printf("Give me your input:\n") ;
	yylex() ;
}
