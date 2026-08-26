%option noyywrap

%{
#include <stdio.h>
#include <string.h>

char word[50];
int count = 0;
%}

%%

[a-zA-Z]+ {
    if(strcmp(yytext, word) == 0)
        count++;
}

[ \t\n]+ ;

. ;

%%

int main()
{
    printf("Enter word to search: ");
    scanf("%s", word);

    printf("Enter sentence:\n");
    getchar();

    yylex();

    printf("Frequency of %s = %d\n", word, count);

    return 0;
}
