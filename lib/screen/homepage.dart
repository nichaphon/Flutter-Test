import 'package:app/database_helper.dart';
import 'package:app/models/task.dart';
import 'package:app/screen/taskpage.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: .0),
          color: Colors.deepPurple,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'welcome',
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: _dbHelper.getTasks(),
                      builder: (context, AsyncSnapshot<List<Task>> snapshot) =>
                          ListView.builder(
                              itemCount:
                                  snapshot.hasData ? snapshot.data!.length : 0,
                              itemBuilder: (context, index) {
                                return taskWidget(
                                  title: snapshot.data![index].title,
                                  desc: snapshot.data![index].description,
                                );
                              }),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 15.0,
                right: 0.0,
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
                        image:
                            AssetImage("assets/images/add-icon-png-2478.png")),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
