// Importing the 'uuid' package which helps generate unique IDs for each expense.
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
// Creating a constant instance of the Uuid class.
// We'll use this to create unique IDs for every Expense object.
const uuid = Uuid();

// Defining an 'enum' called Category.
// Enums are used to define a set of fixed constant values.
// Here, each value represents a category that an expense can belong to.
enum Category { food, leisure, travel, work }

const categoryIcons = {
  Category.food: Icons.restaurant,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight,
  Category.work: Icons.work,
};

// Defining a class called 'Expense'.
// A class is a blueprint for creating objects that hold data and functionality.
class Expense {
  // The constructor of the class.
  // 'required' means these values must be provided when creating an Expense object.
  // After the colon (:), we initialize 'id' with a new unique value using 'uuid.v4()'.
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  })
    // The colon (:) starts an initializer list.
    // Here we assign a unique ID to 'id' by calling 'uuid.v4()'
    // before the object is fully created.
    // So every Expense object automatically gets a random unique identifier.
    : id = uuid.v4();

  // 'final' means these variables cannot be changed once they are assigned.
  // Each Expense object will store:
  // - a unique ID,
  // - a title (description of the expense),
  // - an amount spent,
  // - the date when it occurred,
  // - and the category it belongs to.

  final String id; // Unique identifier for this expense.
  final String title; // Title or description of the expense.
  final double amount; // Amount of money spent.
  final DateTime date; // Date when the expense happened.
  final Category
  category; // The type/category of the expense (from the enum above).
  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses = allExpenses
          .where((expense) => expense.category == category)
          .toList();
  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
