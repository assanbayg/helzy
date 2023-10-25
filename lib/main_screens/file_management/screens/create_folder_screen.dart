import 'package:flutter/material.dart';
import 'package:helzy/services/storage_service.dart';

class CreateFolderScreen extends StatefulWidget {
  const CreateFolderScreen({super.key});

  @override
  State<CreateFolderScreen> createState() => _CreateFolderScreenState();
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
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: const Text('Create folder'),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.height * 0.02),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: _folderNameController,
                decoration: InputDecoration(
                  labelText: 'Folder name',
                  labelStyle: const TextStyle(color: Colors.white),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.primaryColor),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a folder name';
                  }
                  return null;
                },
              ),
              SizedBox(height: size.height * 0.02),
              ElevatedButton(
                child: const Text('Create'),
                onPressed: () {
                  StorageService().createBucket(_folderNameController.text);
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
