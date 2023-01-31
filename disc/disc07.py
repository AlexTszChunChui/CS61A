class MinList:
    def __init__(self):
        self.items = []
        self.size = 0

    def append(self, item):
        self.items = self.items + [item]
        self.size = self.size + 1

    def pop(self):
        throw = min(self.items)
        self.items.remove(throw)
        self.size = self.size - 1
        return throw

class Email:
    def __init__(self, msg, sender_name, recipient_name):
        self.msg = msg
        self.sender = sender_name
        self.recipient = recipient_name

class Server:
    def __init__(self):
        self.clients = {}

    def send(self, email):
        self.clients[email.recipient_name].receive(email)

    def register_client(self, client, client_name):
        self.client[client_name] = client

class Client:
    def __init__(self, server, name):
        self.inbox = []
        self.name = name
        self.server = server
        self.server.register_client(self, self.name)

    def compose(self, msg, recipient_name):
        self.server.send(Email(msg, self.name, recipient_name))

    def receive(self, email):
        self.inbox.append(email)

class Pet():
    def __init__(self, name, owner):
        self.is_alive = True
        self.name = name
        self.owner = owner
    
    def eat(self, thing):
        print(self.name + ' ate a ' + str(thing) + '!')

    def talk(self):
        print(self.name)

class Cat(Pet):
    def __init__(self, name, owner, lives=9):
        Pet.__init__(self, name, owner)
        self.lives = lives

    def talk(self):
        print(self.name + ' say meow!')

    def lose_life(self):
        self.lives = self.lives - 1
        if self.live == 0:
            self.is_alive = False
        if self.live < 0:
            print('the cat has no more lives to lose')

class NoisyCat(Cat):
    def talk(self):
        Cat.talk(self)
        Cat.talk(self)

    def __repr__(self):
        return "NoisyCat({}, {})".format(self.name, self.owner)

