import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef TxCallback = void Function(String title, double amount);

class NewTransaction extends StatelessWidget {
  final TxCallback addTransactionHandler;

  NewTransaction({super.key, required this.addTransactionHandler});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            autocorrect: true,
            decoration: InputDecoration(labelText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
            controller: amountController,
          ),
          TextButton(
              onPressed: () {
                addTransactionHandler(
                    titleController.text, double.parse(amountController.text));
              },
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
