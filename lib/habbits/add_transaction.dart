import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'global.dart';


class AddTransaction extends StatefulWidget {
  const AddTransaction(this.handler);

  final Function handler;

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  var titleController = TextEditingController();
  var amountController = TextEditingController();
  DateTime? selectedDate;

  void startDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2040),
      initialDate: DateTime.now(),
    ).then((date) {
      if (date == null)
        return;
      else
        setState(() => selectedDate = date);
    });
  }

  void addTx() {
    var enteredText = titleController.text;
    var enteredAmount = double.parse(amountController.text);

    if (enteredText.isEmpty ||
        enteredAmount.isNaN ||
        enteredAmount <= 0 ||
        selectedDate == null) {
      return;
    }

    widget.handler(enteredText, enteredAmount, selectedDate);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 25,
          right: 25,
          bottom: MediaQuery.of(context).viewInsets.bottom + 60,
        ),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: addTxField('Habbit Name'),
              controller: titleController,
              onSubmitted: (_) => addTx(),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: addTxField('Score'),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => addTx(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'No Date Chosen'
                        : 'Picked Date: ${DateFormat('dd/MM/yy').format(selectedDate!)}',
                    style: Theme.of(context).textTheme.headline6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                FlatButton(
                  child: Text(
                    'Choose Date of Start',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Quicksand',
                      color: Theme.of(context).primaryColor,
                      letterSpacing: 0.4,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () => startDatePicker(context),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                child: const Text(
                  'Add Habbit',
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: addTx,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
