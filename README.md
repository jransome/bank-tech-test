# Bank Tech Test

## Approach

In approaching this test I began by converting the given requirements and acceptance criteria:

##### Requirements
* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

##### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
...into the following user stories:

##### User stories
```
As a client
So I can keep my money safe
I want to be able to deposit it into my bank account

As a client
So I can retrieve my deposited money
I want to be able to make a withdrawal from my bank account

As a client
So I can keep track of my deposits and withdrawals
I want to be able to print out a bank statement for my account
```

I then mapped a domain model to guide my architecture and ensure my solution was object oriented, beginning with the following classes:

```
Account
Deposit
Withdrawal
Statement
```
