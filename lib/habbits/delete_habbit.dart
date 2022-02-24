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
          title: Text('Habbit Completed for the day'),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1,
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            SizedBox(width: 1),
            FlatButton(
              child: Text('Delete'),
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
                side: BorderSide(
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
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        );
      },
    );
  }
}
