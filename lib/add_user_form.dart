import 'package:flutter/material.dart';

class AddUserForm extends StatefulWidget {
  const AddUserForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddUserFormState();
  }
}

class AddUserFormState extends State<AddUserForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _groupController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }
  String? validateGroup(String? value) {
    if (value == null || value.isEmpty) {
      return 'Group is required';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
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
              controller: _nameController,
              validator: validateName
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Group',
              ),
              controller: _groupController,
              validator: validateGroup
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (validateName(_nameController.text) == null 
                    && validateGroup(_groupController.text) == null
                ) {
                  Navigator.pop(context, {
                    'name': _nameController.text,
                    'group': _groupController.text,
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a name and group')),
                  );
                }
              },
              child: const Text('Add User'),
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
  @override
  void dispose() {
    _nameController.dispose();
    _groupController.dispose();
    super.dispose();
  }
}
