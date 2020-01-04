import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTX;

  TransactionList(this.transactions, this.deleteTX);

  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(
      builder: (ctx, constrains) {
        return Container(
          height: constrains.maxHeight,
          child: transactions.isEmpty
              ? Column(
                  children: <Widget>[
                    Text(
                      'No tienes gastos todavía!... continúa asi! jaja',
                      style: Theme.of(context).textTheme.title,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constrains.maxHeight * 0.7,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        )),
                  ],
                )
              : ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                      child: ListTile(
                        leading: CircleAvatar(
                            radius: 35,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: FittedBox(
                                child: Text(
                                    "\$${transactions[index].amount.toStringAsFixed(2)}"),
                              ),
                            )),
                        title: Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        subtitle: Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                        trailing: IconButton(
                          onPressed: () => deleteTX(transactions[index].id),
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                        ),
                      ),
                    );
                  },
                  itemCount: transactions.length,
                ),
        );
      },
    );
  }
}
