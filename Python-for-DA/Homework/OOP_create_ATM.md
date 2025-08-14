## 🏡 Homework - OOP create ATM

```py
## Homework
# OOP create ATM
# create 4-5 method
class ATM:
    def __init__(self, name, bank, balance):
        self.name = name
        self.bank = bank
        self.balance = balance
    
    def check_balance(self):
        print(f"Current Balance: {self.balance} $")

    def deposit(self, amount):
        self.balance += amount

    def withdraw(self, amount):
        if amount > self.balance:
            raise ValueError("Insufficient funds")
        self.balance -= amount
        print(f"Withdrawal successful. Please collect your cash ({amount})$.")
    
    def transfer(self, recipient_atm, amount):
        if amount > self.balance:
            raise ValueError("Insufficient funds")
        self.balance -= amount
        recipient_atm.balance += amount
        print(f"Transfer successful. {amount} $ has been sent to {recipient_atm.name}.")
```
