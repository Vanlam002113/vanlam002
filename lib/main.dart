import 'package:flutter/material.dart';
import 'package:hello_word/data/items.dart';
import 'package:hello_word/widget/Madal_Bottom_Widget.dart';
import 'package:hello_word/widget/car_body_widget.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  final List<DataItems> items = [
    DataItems(id: "1", name: "Tập Thể Dục"),
    DataItems(id: "2", name: "Bơi Lội"),
    DataItems(id: "3", name: "Làm Việc"),
    DataItems(id: "4", name: "Ăn Trưa"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: const Text(
              "ToDoList",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.yellow,
                  fontFamily: AutofillHints.newPassword),
            )),
        body: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: items.map((item) => CarBoddy(item: item)).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.grey,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return const MadalBottom();
                });
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            size: 50,
            color: Colors.amber,
          ),
        ));
  }
}
