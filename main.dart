import 'package:flutter/material.dart';

void main() {
  runApp(toDoList());
}

class toDoList extends StatelessWidget {
  const toDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      title: 'To Do List',
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  List<String> items = [];
  late String item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do App'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 9,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: 'To do'),
                          onChanged: (input) {
                            setState(() {
                              item=input;
                            });
                          },
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                 setState(() {
                                   items.add(item);
                                 });
                                },
                                child: Text('Add')),
                          )),
                    ],
                  )),
              Expanded(
                  flex: 9,
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Card(
                            color: Colors.white70,
                            child: Row(
                              children: [
                                Expanded(flex: 9, child: Text(items[index])),
                                Expanded(
                                    flex: 1,
                                    child: TextButton(
                                      child: Icon(Icons.delete),
                                      onPressed: () {
                                        setState(() {
                                          items.removeAt(index);
                                        });
                                      },
                                    ))
                              ],
                            ));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
