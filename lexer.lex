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
{digit}	printf("NUMBER [%d]\n", yytext) ;
{plus}	printf("+\n") ;
{minus}	printf("-\n") ;
{mult}	printf("*\n") ;
{L_paren} printf("L_PAREN\n") ;
{hex}	printf("This is a hexadecimal number [%s].\n", yytext) ;
-	printf("ERROR\n") ;
%%

main() {
	printf("Give me your input:\n") ;
	yylex() ;
}
