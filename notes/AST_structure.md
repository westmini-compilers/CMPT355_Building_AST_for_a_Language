# AST Structure

## Node types

| Node class              | Superclass          | Relevant grammar rule | Children
|-------------------------|---------------------|-----------------------|:---------------------------------------------:
| `AstNode` (A)           |                     |                       | —
| `Statement` (A)         | `AstNode`           | `statement`           | —
| `Expression` (A)        | `AstNode`           | `expression`          | —
| `Program`               |                     | `program`             | `statements: List<Statement>`
| `Assignment`            |                     |                       | `id: String; value: Expression`
| `FunctionDefinition`    |                     | `functionDefinition`  |
| `PrintStatement`        |                     | `print`               |
| `InputStatement`        |                     | `input`               |
| `IfStatement`           |                     | `ifStatement`         |
| `WhileLoop`             |                     | `whileLoop`           |
| `NumberExpression`      |                     | `#numberExpr`         |
| `VariableExpression`    |                     | `#variableExpr`       |
| `BinaryOpExpression`    |                     | `#binaryOpExpr`       |
| `NegateExpression`      |                     | `#negateExpr`         |
| `FunctionCallExpression`|                     | `#funcCallExpr`       |
| `BooleanExpression` (A) |                     | `booleanExpression`   | —
