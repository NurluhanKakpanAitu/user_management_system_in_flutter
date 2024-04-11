import 'package:flutter/material.dart';
import 'package:flutter_application_1/user.dart';

class UpdateUserForm extends StatefulWidget {
  final User user;

  const UpdateUserForm({super.key, required this.user});

  @override
  State<StatefulWidget> createState() {
    return UpdateUserFormState();
  }
}

class UpdateUserFormState extends State<UpdateUserForm> {

  @override
  Widget build(BuildContext context) {
   TextEditingController nameController = TextEditingController(text: widget.user.name);
   TextEditingController groupController = TextEditingController(text: widget.user.group);
    return Scaffold(
      appBar: null,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              controller: nameController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Group',
              ),
              controller: groupController,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'name': nameController.text,
                  'group': groupController.text,
                });
              },
              child: const Text('Update'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            )
          ],
        ),
      ),
    );
  }
}
