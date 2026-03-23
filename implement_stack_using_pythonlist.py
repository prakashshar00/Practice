# Stack using Python list (OOP form)

class StackList:
    def __init__(self):
        self.stack = []

    def push(self, item):
        self.stack.append(item)

    def pop(self):
        if len(self.stack) == 0:
            return "Stack is empty"
        return self.stack.pop()

    def peek(self):
        if len(self.stack) == 0:
            return "Stack is empty"
        return self.stack[-1]

    def display(self):
        return self.stack

s = StackList()
s.push(15)
s.push(25)
s.push(35)

print("Stack after push:", s.display())
print("Top element is:", s.peek())
print("Popped element is:", s.pop())
print("Stack after pop:", s.display())