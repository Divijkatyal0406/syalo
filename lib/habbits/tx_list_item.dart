import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:intl/intl.dart';

import 'models/habbitModel.dart';
import 'delete_habbit.dart';

class TxListItem extends StatelessWidget {
  const TxListItem(this.txItem, this.handler);

  final Habbit txItem;
  final Function handler;

  Future<void> share() async {
    String formatDate(DateTime date) =>
        DateFormat("MMMM d").format(txItem.date);
    await FlutterShare.share(
        title: 'Share on..',
        text:
            'I am excited to start up ${txItem.title} from ${formatDate(txItem.date)}',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
          side: BorderSide(
            width: 1,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 52,
                      height: 52,
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: FittedBox(
                        child: Text(
                          txItem.amount.toStringAsFixed(0),
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            txItem.title,
                            style: Theme.of(context).textTheme.headline5,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            DateFormat.yMMMEd().format(txItem.date),
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 13,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w700,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              mediaQuery.size.width > 450
                  ? Row(
                      children: [
                        FlatButton.icon(
                          icon: const Icon(Icons.delete, size: 22),
                          label: const Text(
                            'Delete',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          textColor: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            DeleteTx(
                              txItem.id,
                              handler,
                            ).openDialogue(context);
                          },
                        ),
                        FlatButton.icon(
                            icon: const Icon(Icons.share_outlined, size: 22),
                            label: const Text(
                              'Share',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            textColor: Theme.of(context).colorScheme.secondary,
                            onPressed: share),
                      ],
                    )
                  : Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          iconSize: 22,
                          color: Theme.of(context).colorScheme.secondary,
                          onPressed: () {
                            DeleteTx(
                              txItem.id,
                              handler,
                            ).openDialogue(context);
                          },
                        ),
                        FlatButton.icon(
                            icon: const Icon(Icons.share_outlined, size: 22),
                            label: const Text(
                              'Share',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Quicksand',
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            textColor: Theme.of(context).colorScheme.secondary,
                            onPressed: share),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
