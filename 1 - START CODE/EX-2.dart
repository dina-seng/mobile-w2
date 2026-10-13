class BankAccount {
  // TODO
  final int _accountId;
  final String _accountOwner;
  double _balance;

  BankAccount({
    required int accountId,
    required String accountOwner,
    double initialBalance = 0.0,
  }) : _accountId = accountId,
       _accountOwner = accountOwner,
       _balance = initialBalance >= 0 ? initialBalance : 0.0;

  double get balance => _balance;
  int get accountId => _accountId;
  String get accountOwner => _accountOwner;

  void credit(double amount) {
    if (amount <= 0) {
      throw Exception("Credit amount must be greater than 0");
    }
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception("Credit amount must be greater than 0");
    }
    if (_balance - amount < 0) {
      throw Exception("Your balance is not enough");
    }
    _balance -= amount;
  }

  @override
  String toString() {
    return 'BankAccount(ID: $_accountId, Owner: $_accountOwner, Balance: \$$_balance)';
  }
}

class Bank {
  // TODO
  final String _name;
  List<BankAccount> _accounts = [];

  String get name => _name;
  List<BankAccount> get accounts => _accounts;

  Bank({required String name}) : _name = name;

  BankAccount createAccount(int accountId, String accountOwner) {
    for (var acc in _accounts) {
      if (acc._accountId == accountId) {
        throw Exception("Account ID alreawdy exist");
      }
    }

    var newAccount = BankAccount(
      accountId: accountId,
      accountOwner: accountOwner,
    );

    _accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Hongly'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
