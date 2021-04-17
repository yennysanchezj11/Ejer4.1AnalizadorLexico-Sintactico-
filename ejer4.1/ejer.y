%{
#include <stdio.h>   
#include <stdlib.h>
extern int yylex(void);
extern char *yytext;
void yyerror(char *s); 
extern FILE * yyin;

%}

%token ART VER PRE SUJ ADJ EOL 
%start Input

%%

Input: /* empty */
    | Input Line

Line: Expresion EOL { printf("Correct sentence \n"); }
    | error EOL { printf("Parsing error\n");};

Expresion: ART SUJ VER ADJ          // 
         | SUJ VER ADJ 
         | PRE ART SUJ ADJ 
         | PRE ART SUJ VER ADJ ;
%%

void yyerror(char *s){
  //  printf("Error: %s\n", s);
}

int main(int argc, char **argv) {
    // si hay argumentos cargue el archivo como entrada
    yyin = (argc > 1) ? fopen(argv[1],"r") : stdin;  
    yyparse();
    return 0;
}
