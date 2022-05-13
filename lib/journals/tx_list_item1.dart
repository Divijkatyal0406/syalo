import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models1/expense1.dart';

class TxListItem extends StatelessWidget {
  const TxListItem(this.txItem, this.handler);

  final Expense txItem;
  final Function handler;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Column(
      children: [
        Container(
          child: Text(
            DateFormat.yMMMEd().format(txItem.date),
          ),
        ),
        Container(
          // height: 150,
          alignment: Alignment.center,
          width: double.infinity,
          child: Card(
            color: Colors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                width: 0.5,
                color: Colors.grey[300]!.withOpacity(0.7),
              ),
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 10,
            ),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 8,
                left: 8,
                right: 6,
              ),
              child: Flexible(
                child: Container(
                  child: Text(
                    txItem.title,
                    // overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
