import 'atmEntity.dart';

class Atmlogic {
  final Atmentity _atmEntity;

  //constructor
  Atmlogic(this._atmEntity);

  //Check balance
  String getBalance() {
    return "Your Balance: Rp${_atmEntity.balance}";
  }

  //Withdraw money
  String withdrawMoney(double amount) {
    if (amount <= 0) {
      return 'Invalid amount. Please enter a positive value.';
    } else if (amount > _atmEntity.balance) {
      return 'Insufficient balance. Please check your balance.';
    } else {
      _atmEntity.balance -= amount;
      return 'Withdrawal successful. Your new balance is: Rp${_atmEntity.balance}';
    }
  }

  //deposit money
  String depositMoney(double amount) {
    if (amount <= 0) {
      return 'Invalid amount. Please enter a positive value.';
    } else {
      _atmEntity.balance += amount;
      return 'Deposit successful. Your new balance is: Rp${_atmEntity.balance}';
    }
  }
}
