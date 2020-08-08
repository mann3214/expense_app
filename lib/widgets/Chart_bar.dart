import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentageTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPercentageTotal);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      Text('\$${spendingAmount.toStringAsFixed(0)}'),
      SizedBox(
        height: 4,
      ),
      Container(
        height: 60,
        width: 10,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0)),
                  color: Colors.amberAccent,

            ),
             FractionallySizedBox(
              heightFactor: spendingPercentageTotal,
              child: Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
        /*  SizedBox(
        height: 4,
      )*/
      )
    ]);
  }
}
