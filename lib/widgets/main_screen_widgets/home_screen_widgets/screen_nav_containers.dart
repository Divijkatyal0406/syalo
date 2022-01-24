import 'package:flutter/material.dart';


class ScreenNavContainers extends StatelessWidget {
  const ScreenNavContainers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.only(bottom: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: GridTile(
              child:
              ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network("https://images.unsplash.com/photo-1527525443983-6e6"
                      "0c75fff46?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=385&q=80")),
            ),
          );
  }
}
