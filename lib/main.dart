// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names, unused_local_variable, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:project10/wedgit/ToDoCard.dart';
import 'package:project10/wedgit/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => ToDoApp(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class Task {
  String name;
  bool state;
  Task({required this.name, required this.state});
}

List Tasks = [
  Task(name: "study", state: false),
  Task(name: "eat", state: true),
  Task(name: "shawoer", state: true),
];


int numOfFinshTasks() {
  int w = 0;
  Tasks.forEach((item) {
    if (item.state == true) {
      w++;
    }
  });
  return w;
}

class _ToDoAppState extends State<ToDoApp> {
  final TaskName = TextEditingController();
  AddTask() {
    setState(() {
      Tasks.add(Task(name: TaskName.text, state: false));
    });
  }
  changeState(int p){
  setState(() {
        Tasks[p].state=!Tasks[p].state ;

    });
}
deletetask(int p){
  setState(() {
        Tasks.remove(Tasks[p]);

    });
}


//   @override
// void initState() {
//    super.initState();
//    // Start listening to changes.
//    TaskName.addListener(AddTask);
// }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(0, 40, 20, 1),
              Color.fromRGBO(52, 88, 58, 1),
              Color.fromRGBO(53, 89, 59, 1)
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(64, 99, 67, 1),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    padding: EdgeInsets.all(18),
                    height: 300,
                    child: Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: TaskName,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              labelText: "Add new task",
                              labelStyle:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                AddTask();
                              },
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(164, 129, 17, 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(Icons.add)),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 40, 20, 1),
          title: Text(
            "To Do APP",
            style: TextStyle(
                fontSize: 33,
                color: Color.fromRGBO(236, 231, 180, 1),
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Counter(
                  cmp: numOfFinshTasks(),
                  alltasks: Tasks.length,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: Tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ToDoCard(
                          name: Tasks[index].name,
                          state: Tasks[index].state,
                          changeState: changeState,
                          deletetask: deletetask,
                          p:index,
                        );
                      }),
                ),
              ],
            )),

        // ToDoCard(),
        // ToDoCard(),
        // ToDoCard(),
      ),
    );
  }
}
//عشان تكون صفحة كاملة زي مانبي في اضافة الحلقة
// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:project10/wedgit/ToDoCard.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         // When navigating to the "/" route, build the FirstScreen widget.
//         '/': (context) => ToDoApp(),
//       },
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light(useMaterial3: true),
//     );
//   }
// }

// class ToDoApp extends StatefulWidget {
//   const ToDoApp({super.key});

//   @override
//   State<ToDoApp> createState() => _ToDoAppState();
// }

// class Task {
//   String name;
//   bool state;
//   Task({required this.name, required this.state});
// }

// List Tasks = [
//   Task(name: "study", state: true),
//   Task(name: "eat", state: false),
//   Task(name: "shawoer", state: true),
// ];

// class _ToDoAppState extends State<ToDoApp> {
//   final TaskName = TextEditingController();
//  AddTask() {
//     setState(() {
//     Tasks.add(Task(name: TaskName.text, state: false));
//     });
//   }

// //   @override
// // void initState() {
// //    super.initState();
// //    // Start listening to changes.
// //    TaskName.addListener(AddTask);
// // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color.fromRGBO(0, 40, 20, 1),
//               Color.fromRGBO(52, 88, 58, 1),
//               Color.fromRGBO(53, 89, 59, 1)
//             ]),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showModalBottomSheet(
//               context: context,
//               builder: (BuildContext context) {
//                 return Container(
//                   padding: EdgeInsets.all(18),
//                   height: double.infinity,
//                   color: Color.fromRGBO(64, 99, 67, 1),
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 50.0),
//                     child: Column(
//                       children: [
//                         TextField(
//                           controller: TaskName,
//                           decoration: InputDecoration(
//                             enabledBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.black)),
//                             labelText: "Add new task",
//                             labelStyle:
//                                 TextStyle(color: Colors.black, fontSize: 18),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 22,
//                         ),
//                         TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                               AddTask();
//                             },
//                             child: Text(
//                               "Add",
//                               style:
//                                   TextStyle(color: Colors.black, fontSize: 20),
//                             )),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//               isScrollControlled: true,
//             );
//           },
//           child: Container(
//               height: double.infinity,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(164, 129, 17, 1),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Icon(Icons.add)),
//         ),
//         appBar: AppBar(
//           backgroundColor: Color.fromRGBO(0, 40, 20, 1),
//           title: Text(
//             "To Do APP",
//             style: TextStyle(
//                 fontSize: 33,
//                 color: Color.fromRGBO(236, 231, 180, 1),
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: Container(
//           width: double.infinity,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // ToDoCard(),
//                 // ToDoCard(),
//                 // ToDoCard(),
//                 ...Tasks.map((item) => ToDoCard(
//                       name: item.name,
//                       state: item.state,
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
