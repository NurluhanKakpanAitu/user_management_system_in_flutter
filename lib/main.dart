import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_user_form.dart';
import 'package:flutter_application_1/update_user_form.dart';
import 'package:flutter_application_1/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const projectName = "User Management System";
  List<User> users = [
    User(1, 'Nurlykhan', 'SE-2218'),
    User(2, 'Raimbek', 'SE-2218'),
    User(3, 'Erkebulan', 'SE-2218'),
    User(4, 'Temirlan', 'SE-2218'),
    User(5, 'Ernur', 'SE-2206'),
  ];

  @override
  Widget build(BuildContext context) {
    onAddUser(String name, String group) {
      setState(() {
        users.add(User(users.length + 1, name, group));
      });
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 225, 245),
        title: const Text(projectName),
      ),
      body: Column(
        children: [
          SizedBox(
            width: screenWidth,
            height: screenHeight * 0.7,
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: screenWidth * 0.1,
                      child: Text(
                        users[index].id.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: screenWidth * 0.3,
                      child: Text(
                        users[index].name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: screenWidth * 0.2,
                      child: Text(
                        users[index].group,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Confirm'),
                              content: const Text(
                                  'Are you sure you want to remove this user?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      users.removeAt(index);
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Remove'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    IconButton(icon: const Icon(Icons.edit), onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateUserForm(user: users[index]),
                        ),
                      );
                      if (result != null) {
                        final String name = result['name'];
                        final String group = result['group'];
                        setState(() {
                          users[index].name = name;
                          users[index].group = group;
                        });
                      }
                    }),
                  ],
                );
              },
            ),
          ),
          SizedBox(
              height: 30,
              child: Text(
                'Total Users: ${users.length}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                ),
              )),
          ElevatedButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddUserForm()),
              );
              if (result != null) {
                final String name = result['name'];
                final String group = result['group'];
                onAddUser(name, group);
              }
            },
            child: const Text('Add User'),
          ),
        ],
      ),
    );
  }
}
