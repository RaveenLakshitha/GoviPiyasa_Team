import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class expert extends StatefulWidget {
  @override
  _expertState createState() => _expertState();
}

class _expertState extends State<expert> {
  bool isGrid = false;
  List<String> items = ['Anna', 'Brandon', 'Emma', 'Ashen','nilura'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ExpertList'),
          centerTitle: true,
          actions: [
            Switch(
                value: isGrid,
                onChanged: (val) {
                  setState(() {
                    isGrid = val;
                  });
                }),
          ]),
        body: buildList());
  }

  void selectItem(String item) {
    final snackBar = SnackBar(
      content: Text(
        'Selected $item..',
        style: TextStyle(fontSize: 24),
      ),
      backgroundColor: Colors.lightGreen,
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  Widget buildList() => isGrid
      ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return GridTile(
              child:InkWell(
                child: Ink.image(
                  image: NetworkImage(
                      'https://source.unsplash.com/random?sig=$index'),
                  fit: BoxFit.cover,
                ),
                onTap: ()=>selectItem(item),
              ),

              footer: Container(
                padding: EdgeInsets.all(12),
                alignment: Alignment.center,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        )
      : ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(
                    'https://source.unsplash.com/random?sig=$index'),
              ),
              title: Text(item),
              subtitle: Text('Subtitle $index'),
              onTap: () => selectItem(item),
            );
          });
}
