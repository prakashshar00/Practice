# Bracket Matching using stack (OOP form)

class BracketMatcher:
    def __init__(self):
        self.stack = []

    def is_balanced(self, expression):
        pairs = {')': '(', '}': '{', ']': '['}

        for ch in expression:
            if ch in "({[":
                self.stack.append(ch)
            elif ch in ")}]":
                if len(self.stack) == 0:
                    return False
                top = self.stack.pop()
                if pairs[ch] != top:
                    return False

        return len(self.stack) == 0

bm = BracketMatcher()
expr = "{[(]}"
if bm.is_balanced(expr):
    print("Brackets are balanced")
else:
    print("Brackets are not balanced")