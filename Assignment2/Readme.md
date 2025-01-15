In the contract MetaCoin

1. mapping creates a hashmap like mspping between address as key and balance as value,meanwhile constructor allocates 100K to the owner of contract.[returns balance of the address entered]
2.Event named transfer is declared which logs account from where tokens are sent and where they are sent along with the amount sent.
3.Function SendCoins first checks if transaction is possible by comparing amount asked by the amount present in owner's account and performs the transaction if allowed returning true otherwise false.[takes reciever's and sender's address alongeith amount of balance to be transferred and doe it if possible other wise not]
4.Function GetBalance takes the address of an account and returns the value of amount present.[takes address as input and returns the amount present]

In the contract Loan inherited from Metacoin
1.mapping of address with amount of loans pending on them is named loans[takes address of account and returns loans pending]
2.Event named loan is declared which logs account from where tokens are sent and where they are sent along with the amount sent.
3.constructor sets the sddress of owner meanwhile modifier named isOwner allows the function to be calaled only when owner is calling it(bay aomparing address of owner and message caller).
4.muldiv is just a utility function{taken from internet} which smmothens out calculating compound interest.getCompoundIinterest is a function which returns the final principal amount.[takes principal amount,time,and interest rates as input and returns final amount after calculatiing]
5.reqLoan checks if interest rate is positive ot nrgative along with checcking igf amount demanded exceeds amount available in owner's account.[takes interest rates, time and principle amount and approves it and increments loan[peerson_asking_for_loan] by the amount demanded].
6.GetOwnerBalance returns the balance of owner and viewdues takes an address as input and returns the loan pending on them.[GetOwnerBalance simply returns balance of owner's account][viewdues takes an address as input and return loans pending]
7.SettleDues takes an address and directly settles it with owner[takes an address as input and withdraws that account for amount equalling loan[address] and increments owner's account by same.]
