import 'package:expense_app/widgets/Chart.dart';
import 'package:expense_app/widgets/NewTransaction.dart';
import 'package:expense_app/widgets/Transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.amberAccent,
        fontFamily: 'roboto',
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'lato',
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> transaction = [
    Transaction(id: '0', title: 'shoes', amount: 12.32, date: DateTime.now()),
    Transaction(id: '1', title: 'cloths', amount: 200.10, date: DateTime.now()),
  ];

  void _addTransaction(String title, double amount) {
    var newTx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      transaction.add(newTx);
    });
  }

  List<Transaction> get _recentTransaction {
    return transaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

//    String titleInput;
//    String amountInput;
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    void _startAddTransaction(BuildContext bContext) {
      showModalBottomSheet(
          context: context,
          builder: (bContext) {
            return GestureDetector(
              onTap: () {},
              child: NewTransaction(_addTransaction),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense App',
          style: TextStyle(fontFamily: 'lato'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddTransaction(context),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddTransaction(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
//            width: double.infinity,
                width: double.infinity,
                child: Chart(_recentTransaction)),
            TransactionList(transaction)
          ],
        ),
      ),
    );
  }
}
