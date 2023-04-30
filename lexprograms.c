%{
#include <stdio.h>
%}

%%
"abc[0-9]+" { printf("Matched: %s\n", yytext); }
.           { /* ignore all other characters */ }
%%

int main(void) {
  yylex();
  return 0;
}

/*
    %{
#include <stdio.h>
%}

%%
"for"       { printf("Keyword: for\n"); }
"while"     { printf("Keyword: while\n"); }
"switch"    { printf("Keyword: switch\n"); }
"else\s*if" { printf("Keyword: else if\n"); }
"else"      { printf("Keyword: else\n"); }
.           { /* ignore all other characters */ }
// %%

// You can also write 
// (for|while|switch)   { printf("Keyword: %s\n", yytext); }

// for exact comparison emmbed the expression into the double quotes.

// %%
// "=="|">="|"<="|"!="|">"|"<"|"+"|"-"|"*"|"/"|"%"|"++"|"--"|"="   { printf("Operator: %s\n", yytext); }
// .                                                               { /* ignore all other characters */ }
// %%

// int main(void) {
//   yylex();
//   return 0;
// }
