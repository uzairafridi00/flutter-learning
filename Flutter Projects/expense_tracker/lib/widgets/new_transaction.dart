import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../adaptive_custom_widgets/adaptive_flat_button.dart';

typedef TxCallback = void Function(String title, double amount, DateTime date);

class NewTransaction extends StatefulWidget {
  final TxCallback addTransactionHandler;

  NewTransaction({super.key, required this.addTransactionHandler});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectDate;

  void _dataEntered() {
    final titleEntered = _titleController.text;
    final amountEntered = double.parse(_amountController.text);

    if (titleEntered.isEmpty || amountEntered <= 0 || _selectDate == null) {
      return;
    }

    widget.addTransactionHandler(titleEntered, amountEntered, _selectDate!);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      _selectDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              autocorrect: true,
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _dataEntered(),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              // inputFormatters: <TextInputFormatter>[
              //   FilteringTextInputFormatter.digitsOnly
              // ], // Only numbers can be entered 
              controller: _amountController,
              onSubmitted: (_) => _dataEntered(),
            ),
            Container(
              height: 75,
              child: Row(children: [
                Expanded(
                  child: Text(_selectDate == null
                      ? 'No Date Choosen!'
                      : 'Picked Date: ${DateFormat().add_yMd().format(_selectDate as DateTime)}'),
                ),
                AdaptiveFlatButton(text: 'Choose Date', handler: _presentDatePicker),
              ]),
            ),
            ElevatedButton(
                onPressed: _dataEntered,
                child: const Text(
                  'Add Transaction',
                ))
          ]),
        ),
      ),
    );
  }
}
