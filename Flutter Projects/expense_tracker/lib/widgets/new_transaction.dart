import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef TxCallback = void Function(String title, double amount);

class NewTransaction extends StatefulWidget {
  final TxCallback addTransactionHandler;

  NewTransaction({super.key, required this.addTransactionHandler});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void dataEntered() {
    final titleEntered = titleController.text;
    final amountEntered = double.parse(amountController.text);

    if (titleEntered.isEmpty || amountEntered <= 0) {
      return;
    }

    widget.addTransactionHandler(titleEntered, amountEntered);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            autocorrect: true,
            decoration: const InputDecoration(labelText: 'Title'),
            controller: titleController,
            onSubmitted: (_) => dataEntered(),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.digitsOnly
            // ], // Only numbers can be entered
            controller: amountController,
            onSubmitted: (_) => dataEntered(),
          ),
          TextButton(
              onPressed: dataEntered,
              child: const Text(
                'Add Transaction',
                style: TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.bold),
              ))
        ]),
      ),
    );
  }
}
