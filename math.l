%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>

int a, b;
char op;
%}

%%

[0-9]+ {
    if(a == 0)
        a = atoi(yytext);
    else
        b = atoi(yytext);
}

[+\-*/] {
    op = yytext[0];
}

\n {
    switch(op)
    {
        case '+':
            printf("Result = %d\n", a + b);
            break;

        case '-':
            printf("Result = %d\n", a - b);
            break;

        case '*':
            printf("Result = %d\n", a * b);
            break;

        case '/':
            if(b != 0)
                printf("Result = %d\n", a / b);
            else
                printf("Division by zero is not possible\n");
            break;
    }
    a = b = 0;
    op = 0;
}

[ \t]+ ;

. ;

%%

int main()
{
    printf("Enter expression: ");
    yylex();
    return 0;
}