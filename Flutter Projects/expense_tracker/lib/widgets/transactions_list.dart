import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions = [];

  TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 490,
      width: 330,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.purple.shade100,
                ),
                borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
              ),
              elevation: 5,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                      color: Theme.of(context).primaryColorLight,
                      width: 2,
                    )),
                    child: Text(
                      'Rs ' + transactions[index].amount.toStringAsFixed(2),
                      // '\$${tx.amount}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transactions[index].title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ));
        },
        itemCount: transactions.length,
      ),
    );
  }
}
