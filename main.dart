import 'dart:io';
import 'atmEntity.dart';
import 'atmLogic.dart';

void main() {
  // Initialization of the balance
  Atmentity atmentity = Atmentity(2000);

  // ATM Logic
  Atmlogic atmlogic = Atmlogic(atmentity);

  bool isRunning = true;

  // Function for validating input amount
  double getValidAmount(String prompt) {
    double amount;
    do {
      stdout.write(prompt);
      String? input = stdin.readLineSync();
      amount = double.tryParse(input ?? '') ?? -1;
      if (amount <= 0) {
        print("Invalid input. Please enter a positive amount.");
      }
    } while (amount <= 0);
    return amount;
  }

  while (isRunning) {
    print("\n=== Command Line Bank===");
    print("1. Deposit");
    print("2. Balance");
    print("3. Withdraw");
    print("4. Exit");

    // Menu options
    stdout.write("Choose an option: ");
    String? option = stdin.readLineSync();

    // Check if the input is null or empty
    if (option == null || option.isEmpty) {
      print("Invalid input. Please select a valid option.");
      continue; 
    }

    switch (option) {
      case '1':
        double depositAmount = getValidAmount("Enter deposit amount: ");
        print("\n${atmlogic.depositMoney(depositAmount)}");
        break;

      case '2':
        print("\nCurrent Balance: Rp${atmlogic.getBalance()}");
        break;

      case '3':
        double withdrawAmount = getValidAmount("Enter withdrawal amount: ");
        print("\n${atmlogic.withdrawMoney(withdrawAmount)}");
        break;

      case '4':
        print("Thank you for using the ATM. Goodbye!");
        isRunning = false;
        break;

      default:
        print("Invalid option. Please select a valid choice.");
    }

    if (isRunning) {
      // Ask if the user wants to continue using the ATM
      stdout.write("\nDo you want to perform another transaction? (y/n): ");
      String? response = stdin.readLineSync();
      if (response?.toLowerCase() == 'n') {
        isRunning = false;
        print("\nThank you for using the ATM.");
      }
    }
  }
}
