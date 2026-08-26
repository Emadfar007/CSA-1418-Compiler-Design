%option noyywrap

%{
#include <stdio.h>
#include <string.h>

FILE *out;
char oldword[50], newword[50];
%}

%%

[a-zA-Z]+ {
    if(strcmp(yytext, oldword) == 0)
        fprintf(out, "%s", newword);
    else
        fprintf(out, "%s", yytext);
}

\n      { fprintf(out, "\n"); }
.       { fprintf(out, "%s", yytext); }

%%

int main()
{
    yyin = fopen("input.txt", "r");
    out = fopen("output.txt", "w");

    if(yyin == NULL || out == NULL)
    {
        printf("File error!\n");
        return 1;
    }

    printf("Enter word to replace: ");
    scanf("%s", oldword);

    printf("Enter new word: ");
    scanf("%s", newword);

    yylex();

    fclose(yyin);
    fclose(out);

    printf("Word replaced successfully.\n");
    printf("Modified content is stored in output.txt\n");

    return 0;
}
