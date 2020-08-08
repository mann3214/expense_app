import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(titleController.text, double.parse(amountController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: (InputDecoration(labelText: "Title")),
            controller: titleController,
            onSubmitted: (_) => submitData(),
            /*  onChanged: (val) {
                      titleInput = val;
                    },*/
          ),
          TextField(
            decoration: (InputDecoration(labelText: "amount")),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
            /*onChanged: (val) {
                      amountInput = val;
                    },*/
          ),
          FlatButton(
            child: Text('Add Transaction'),
            onPressed: submitData,
            textColor: Colors.purple,
          )
        ],
      ),
    );
  }
}
