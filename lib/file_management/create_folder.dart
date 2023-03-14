
import 'package:flutter/material.dart';

class CreateFolderScreen extends StatefulWidget {
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
        title: Text('Create folder'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _folderNameController,
                decoration: InputDecoration(
                  labelText: 'Folder name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a folder name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Create'),
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
