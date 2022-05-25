import 'package:app/database_helper.dart';
import 'package:app/models/task.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

class taskPage extends StatefulWidget {
  taskPage({Key? key}) : super(key: key);

  @override
  State<taskPage> createState() => _taskPageState();
}

class _taskPageState extends State<taskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 25.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image(
                              width: 50.0,
                              height: 50.0,
                              image: AssetImage("assets/images/sd.png")),
                        ),
                        Expanded(
                          child: TextField(
                            onSubmitted: (value) async {
                              if (value != value) {
                                DatabaseHelper _dbHelper = DatabaseHelper();
                                Task _newTask = Task(title: value);
                                await _dbHelper.InsertTask(_newTask);
                              }
                              print("something");
                            },
                            decoration: InputDecoration(
                              hintText: "Enter Task title",
                              border: InputBorder.none,
                            ),
                            style: TextStyle(fontSize: 15, color: Colors.green),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Task description",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0)),
                ),
                todoWidget(
                  text: 'hello',
                  isDone: false,
                ),
                todoWidget(
                  isDone: false,
                ),
                todoWidget(
                  isDone: false,
                ),
                todoWidget(
                  isDone: true,
                ),
                todoWidget(
                  isDone: true,
                ),
              ],
            ),
            Positioned(
              bottom: 15.0,
              right: 24.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => taskPage(),
                    ),
                  );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50)),
                  child: Image(
                      image: AssetImage(
                          "assets/images/—Pngtree—trash bin icon_4398485.png")),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
