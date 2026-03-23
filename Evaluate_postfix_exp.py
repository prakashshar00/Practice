# Evaluate Postfix Expression (OOP form)

class PostfixEvaluator:
    def __init__(self):
        self.stack = []

    def evaluate(self, expression):
        for ch in expression:
            if ch.isdigit():
                self.stack.append(int(ch))
            else:
                b = self.stack.pop()
                a = self.stack.pop()

                if ch == '+':
                    self.stack.append(a + b)
                elif ch == '-':
                    self.stack.append(a - b)
                elif ch == '*':
                    self.stack.append(a * b)
                elif ch == '/':
                    self.stack.append(a / b)

        return self.stack.pop()

obj = PostfixEvaluator()
expr = "23*5+"
print("Postfix expression:", expr)
print("Result:", obj.evaluate(expr))