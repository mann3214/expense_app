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
    return LayoutBuilder(builder: (context, constrains) {
      return Column(children: <Widget>[
        Container(
            height: constrains.maxHeight * .15,
            child: FittedBox(
                child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: constrains.maxHeight*.1,
        ),
        Container(
          height: constrains.maxHeight * .5,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(220, 220, 220, 1),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentageTotal,
                child: Container(
                  decoration:
                  BoxDecoration(color: Theme
                      .of(context)
                      .primaryColor),
                ),
              ),
              SizedBox(
                height: constrains.maxHeight*.1
              ),
            ],
          ),

          /*  SizedBox(
        height: 4,
      )*/
        ),
        Container(margin: EdgeInsets.all(5),
            child: Container(
                height: constrains.maxHeight * .15, child: Text(label)))
      ]);

    },)

    ;
  }
}
