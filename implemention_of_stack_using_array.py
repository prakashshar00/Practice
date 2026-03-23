# Stack using array (OOP form)

class Stack:
    def __init__(self, size):
        self.size = size
        self.stack = []

    def push(self, item):
        if len(self.stack) == self.size:
            print("Stack Overflow")
        else:
            self.stack.append(item)
            print(item, "pushed into stack")

    def pop(self):
        if len(self.stack) == 0:
            print("Stack Underflow")
        else:
            print(self.stack.pop(), "popped from stack")

    def peek(self):
        if len(self.stack) == 0:
            print("Stack is empty")
        else:
            print("Top element is:", self.stack[-1])

    def display(self):
        if len(self.stack) == 0:
            print("Stack is empty")
        else:
            print("Stack elements are:", self.stack)

s = Stack(5)
s.push(10)
s.push(20)
s.push(30)
s.display()
s.peek()
s.pop()
s.display()