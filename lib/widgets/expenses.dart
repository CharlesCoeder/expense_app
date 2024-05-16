import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  final List<Expense> _registeredExpenses = [
    Expense(
        title: "KFC",
        amount: 10.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Knicks vs Pacers Game 1",
        amount: 300,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
              icon: const Icon(Icons.add), onPressed: _openAddExpenseOverlay),
        ],
      ),
      body: Column(
        children: [
          const Text("Chart"),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ),
          )
        ],
      ),
    );
  }
}
