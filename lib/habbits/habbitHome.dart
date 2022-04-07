import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:syalo/habbits/habbit_list.dart';

import 'models/habbitModel.dart';
import 'add_habbit.dart';
import 'no_habbit_image.dart';


class HabbitScreen extends StatefulWidget {

  String? title;

  @override
  State<StatefulWidget> createState() => _HabbitScreenState();
}

class _HabbitScreenState extends State<HabbitScreen> {
  List<Habbit> txList = <Habbit>[];
  bool showChart = false;

  Future<Database> _getDatabase() async {
    Database database = await openDatabase(
      join(await getDatabasesPath(), 'expenses.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE expenses (id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'title TEXT, amount REAL, date TEXT)',
        );
      },
      version: 1,
    );

    return database;
  }

  Future<List<Habbit>> _getTransactions() async {
    Database db = await _getDatabase();
    List<Map<String, dynamic>> transactions = await db.rawQuery(
      'SELECT * FROM expenses',
    );

    return List.generate(transactions.length, (index) {
      return Habbit(
        id: transactions[index]['id'],
        title: transactions[index]['title'],
        amount: double.parse(transactions[index]['amount']),
        date: DateTime.parse(transactions[index]['date']),
      );
    }).toList();
  }

  Future<void> _loadTransactions() async {
    List<Habbit> getTxList = await _getTransactions();

    setState(() => txList = getTxList);
  }

  Future<void> _addNewTx(String title, double amount, DateTime date) async {
    Database db = await _getDatabase();

    await db.transaction((txn) async {
      await txn.rawInsert(
        'INSERT INTO expenses (title, amount, date) VALUES (?, ?, ?)',
        [title, amount, date.toString()],
      );
    });

    _loadTransactions();
  }

  void _startAddTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => AddTransaction(_addNewTx),
    );
  }

  Future<void> _deleteTransaction(int id) async {
    Database db = await _getDatabase();
    db.rawDelete('DELETE FROM expenses WHERE id = ?', [id]);

    _loadTransactions();
  }

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    AppBar appBar = AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Habit\'s',
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );

    double bodySize = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    List<Widget> _buildPortrait() {
      return <Widget>[
        Container(
          padding: EdgeInsets.only(top: 50),
          height: bodySize * 0.7 + 20,
          child: txList.isEmpty
              ? NoTransactionImage(isLandscape)
              : TransactionList(txList, _deleteTransaction),
        ),
      ];
    }

    List<Widget> _buildLandscape() {
      return <Widget>[
        Container(
          height: bodySize * 0.1 + 10,
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Show Chart',
                style: Theme.of(context).textTheme.headline5,
              ),
              Switch.adaptive(
                value: showChart,
                onChanged: (value) => setState(() => showChart = value),
              ),
            ],
          ),
        ),
      ];
    }

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
          if (!isLandscape) ..._buildPortrait(),
          if (isLandscape) ..._buildLandscape(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddTransaction(context),
        backgroundColor: Colors.black,
      ),
    );
  }
}
