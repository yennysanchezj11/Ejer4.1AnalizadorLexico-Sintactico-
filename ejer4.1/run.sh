bison -d ejer.y
flex ejer.l
gcc ejer.tab.c lex.yy.c -lfl -o ejer.exe 

