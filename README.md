# TheBankApp
This project is created as a code Challenge for Async/ Await Course - [Unit 2.1 - How to use Actor.](https://coda.io/d/_dkx_nXWeciu/Unit-2-1-Meet-Actors_suEwk)


## Getting started
1. Clone this project
2. Checkout a new branch with your name
3. Finish the code challenge 
4. Submit an MR and assign that to me

## About
This project is written using closure based API. It's a great opportunity for you to practice applying Async/ Await. It replicates 3 essential functions of a BankApp: list accounts, add new account and transfer funds. You're going to protect the central bank and specifically the transfer funds capability by turning it into an Actor. Thereby, protect your bank service in a scenario of concurrent calls from thousand of users.
### Challenge ###
1. Open `AccountService` 
2. Refactor all 3 functions here to async/ Await compatible 
3. You could either wrap them with what you learn on Continuation or use dedicated async/ await variety of URLSession
4. Do the same thing for `AccountSummaryViewModel`, `AddAccountViewModel` and `TranferFundsViewModel`
5. Finally, Turn `AccountService` into a global actor

Good Luck!
