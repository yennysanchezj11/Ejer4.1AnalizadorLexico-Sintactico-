/**Secciòn de definiciones**/
%{
#include "ejer.tab.h"
%}
ARTICULO        (Los|Las|El|La|Lo|Un|Una|Unos|Unas)
SUJETO          [A-Z]{1}[a-z]{2,8}
VERBO           [A-Z]{2,10}
PREPOSICION     [a-z]{3,8}[A-Z]{1}
ADJETIVOS       [a-z]{4,12}

%%
{ARTICULO}                     {return ART;}
{SUJETO}                       {return SUJ;}
{VERBO}                        {return VER;}
{PREPOSICION}                  {return PRE;}
{ADJETIVOS}                    {return ADJ;}
[\n]                           {return EOL;}
[ \t]                          {/*Ignorar espacios*/}
.                              {printf ("Error Lèxico: %s\n", yytext);}
%%
/** Secciòn de còdigo de usuario**/

