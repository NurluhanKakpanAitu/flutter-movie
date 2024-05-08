import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_movie/services/file_service.dart';
import 'package:image_picker/image_picker.dart';

class StuffForm extends StatefulWidget {
  const StuffForm({super.key});

  @override
  StuffFormState createState() => StuffFormState();
}

class StuffFormState extends State<StuffForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController activityController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  String? image;
  FileService fileService = FileService();

  final picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);

        setState(() {
          fileService.upload(imageFile).then((value) {
            image = value;
          }).catchError((error) {
            showErrorDialog(context, error);
          });
        });
      } else {
        showErrorDialog(context, 'No image selected');
      }
    } catch (error) {
      showErrorDialog(context, error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return AlertDialog(
      content: Container(
        padding: const EdgeInsets.only(top: 80),
        alignment: Alignment.center,
        height: height * 0.7,
        width: width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Add new stuff',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: activityController,
              decoration: const InputDecoration(
                labelText: 'Activity',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: bioController,
              decoration: const InputDecoration(
                labelText: 'Bio',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            Column(
              children: [
                if (image == null)
                  const Text('No image selected.')
                else
                  Image.file(File(image!)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: pickImage,
                  child: const Text('Pick Image'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    activityController.dispose();
    bioController.dispose();
    super.dispose();
  }
}

void showErrorDialog(BuildContext context, String message) {
  print(message);
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
