import 'package:flutter/material.dart';

class SearchSongs extends StatefulWidget {
  const SearchSongs({Key? key}) : super(key: key);

  @override
  _SearchSongsState createState() => _SearchSongsState();
}

class _SearchSongsState extends State<SearchSongs> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  Future<List<String>> getListofSOngs(String name) async {
    return await Future.delayed(Duration(seconds: 1), () {
      return ["SOme songs Name"];
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: TextFormField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: "Search for your Favourite song",
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          onChanged: (newVal) {
            setState(() {
              getListofSOngs(newVal);
            });
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: FutureBuilder(
            future: getListofSOngs("hello"),
            builder: (context, AsyncSnapshot<List<String>> snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => customTile(75, width,
                          "https://s18670.pcdn.co/wp-content/uploads/WAT-Relaxing-Music.png"))
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      ),
    );
  }

  Widget customTile(double height, double width, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Container(
        color: Colors.red,
        height: height,
        width: width,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: SizedBox(
                  height: height,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                  ),
                )),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Song Name"),
                  Text("Artist"),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child:
                    IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
