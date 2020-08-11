import 'package:expense_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransaction;
  final Function deleteTransaction;

  TransactionList(this.userTransaction, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: double.infinity,
        child: userTransaction.isEmpty
            ? Column(
                children: <Widget>[
                  Text('No Transaction available'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 6,
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                                child: Text(
                                    '\$${userTransaction[index].amount}'))),
                      ),
                      title: Text(
                        userTransaction[index].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(DateFormat.yMMMd()
                          .format(userTransaction[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () =>
                            deleteTransaction(userTransaction[index].id),
                      ),
                    ),
                  );

                  /*Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor)),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '\$${userTransaction[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              userTransaction[index].title,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            Text(
                                DateFormat()
                                    .add_yMMMd()
                                    .format(userTransaction[index].date),
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey))
                          ],
                        )
                      ],
                    ),
                  );*/
                },
                itemCount: userTransaction.length,
              ));
  }
}
