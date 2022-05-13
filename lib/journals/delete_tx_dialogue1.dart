import 'package:flutter/material.dart';

class DeleteTx {
  const DeleteTx(this.id, this.handler);

  final int id;
  final Function handler;

  void openDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Habbit Completed for the day'),
          actions: <Widget>[
            FlatButton(
              child: const Text('Yes'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            const SizedBox(width: 1),
            FlatButton(
              child: const Text('Delete'),
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
                side: const BorderSide(
                  color: Colors.redAccent,
                  width: 1,
                ),
              ),
              onPressed: () {
                handler(id);
                Navigator.of(context).pop();
              },
            ),
          ],
          actionsPadding: const EdgeInsets.only(right: 10, bottom: 5),
        );
      },
    );
  }
}
