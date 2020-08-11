import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  DateTime _selectedDate;
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(titleController.text, double.parse(amountController.text),
        _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
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
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No Date picked!'
                          : 'Picked Date is : ${DateFormat.yMd().format(_selectedDate)}'),
                    ),
                    FlatButton(
                      child: Text(
                        'Pick Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _presentDatePicker,
                      textColor: Colors.purple,
                    )
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Add Transaction'),
                onPressed: submitData,
                textColor: Colors.white,
                color: Colors.purple,
              )
            ],
          ),
        ),
      ),
    );
  }
}
