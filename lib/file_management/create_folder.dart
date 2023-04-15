// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CreateFolderScreen extends StatefulWidget {
  const CreateFolderScreen({super.key});

  @override
  _CreateFolderScreenState createState() => _CreateFolderScreenState();
}

class _CreateFolderScreenState extends State<CreateFolderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _folderNameController = TextEditingController();

  @override
  void dispose() {
    _folderNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create folder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _folderNameController,
                decoration: const InputDecoration(
                  labelText: 'Folder name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a folder name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                child: const Text('Create'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, _folderNameController.text);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
