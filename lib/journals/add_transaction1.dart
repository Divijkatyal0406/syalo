import 'package:emoji_feedback/emoji_feedback.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddTransaction extends StatefulWidget {
  const AddTransaction(this.handler);

  final Function handler;

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  var titleController = TextEditingController();
  var amountController = TextEditingController();
  DateTime selectedDate=DateTime.now();

  InputDecoration addTxField(String fieldHintText) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(width: 0.9),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(
          width: 0.8,
          color: Colors.grey[300]!.withOpacity(0.4),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(width: 1.1, color: Colors.grey),
      ),
      filled: true,
      fillColor: Colors.grey[200]!.withOpacity(0.6),
      hintText: fieldHintText,
      hintStyle: const TextStyle(
        fontFamily: 'Quicksand',
        color: Colors.black38,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
      ),
    );
  }

  void addTx() {
    var enteredText = titleController.text;
    var enteredAmount = amountController.text;

    if (enteredText.isEmpty) {
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
            EmojiFeedback(
              onChange: (index) {
                print(index);
              },
            ),
            TextField(
              decoration: addTxField('Title'),
              controller: titleController,
              onSubmitted: (_) => addTx(),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: addTxField('Write More...'),
              keyboardType: TextInputType.multiline,
              controller: amountController,
              onSubmitted: (_) => addTx(),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                child: const Text(
                  'Add New Journal',
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
