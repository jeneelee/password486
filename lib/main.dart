import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PassWord486',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PassWord486(),
    );
  }
}

class PassWord486 extends StatefulWidget {
  const PassWord486({Key? key}) : super(key: key);

  @override
  State<PassWord486> createState() => _PassWord486State();
}

class _PassWord486State extends State<PassWord486> {
  final List<String> entries = [];
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    entries.sort();

    return Scaffold(
      appBar: AppBar(
        // title: Text('Password486'),
        //
        title: TextField(
          controller: textController,
        ),
      ),
      body: entries.length > 0
          ? ListView.separated(
              itemCount: entries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.local_grocery_store),
                  title: Text('${entries[index]}'),
                  onLongPress: () {
                    setState(() {
                      entries.removeAt(index);
                    });
                  },
                  trailing: Icon(Icons.remove_circle_outline),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Colors.black,
              ),
            )
          : Center(
              child: Text('No groceries in your list.'),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          setState(() {
            entries.add(textController.text);
            textController.clear();
          });
        },
      ),
    );
  }
}
