grammar Hinky;

program
    : statement*
    ;

statement
    : assignment
    | functionDefinition
    | print
    | input
    | ifStatement
    | whileLoop
    ;

assignment
    : IDENTIFIER '=' expression ';'
    ;

functionDefinition
    : IDENTIFIER '(' (IDENTIFIER (',' IDENTIFIER)*) ')' '=' expression ';'
    ;

print
    : 'print' itemList ';'
    ;

input
    : 'input' itemList '->' IDENTIFIER ';'
    ;

ifStatement
    : 'if' booleanExpression 'then' statement
        ('elif' booleanExpression 'then' statement)*
        ('else' statement)? 'fi'
    ;

whileLoop
    : 'while' booleanExpression 'do' statement 'done'
    ;

itemList
    : (item (',' item)*)?
    ;

item
    : STRING
    | expression
    ;

expression
    : NUMBER                                        #numberExpression
    | IDENTIFIER                                    #variableExpression
    | '(' expression ')'                            #parenExpression
    | <assoc=right> expression '^' expression       #binaryOpExpression
    | expression ('*' | '/') expression             #binaryOpExpression
    | '-' expression                                #negateExpression
    | expression ('+' | '-') expression             #binaryOpExpression
    | IDENTIFIER arguments                          #funcCallExpression
    ;

booleanExpression
    : 'not' booleanExpression
    | booleanExpression 'and' booleanExpression
    | booleanExpression 'or' booleanExpression
    | expression ('=' | '<>' | '<' | '>' | '<=' | '>=') expression
    ;

arguments
    : '(' (expression (',' expression)*)? ')'
    ;

IDENTIFIER
    : [a-zA-Z_$] [a-zA-Z_$0-9]*
    ;

NUMBER
    : [0-9]+ ('.' [0-9]*)?
    ;

STRING
    : '"' ~'"'* '"'
    ;

WHITESPACE
    : [ \r\n\t]+ -> skip
    ;
