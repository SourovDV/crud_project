import 'package:crud_project/ui/weight/app_bar_weight.dart';
import 'package:crud_project/ui/weight/background_image.dart';
import 'package:flutter/material.dart';

class AddNewTask extends StatefulWidget {
  AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final _titleController = TextEditingController();

  final _description = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textThemes = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppbarWeight(textThemes: textThemes),
      body: BackgroundImage(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Text("Add New Task", style: textThemes.titleLarge),
                  const SizedBox(height: 30),
                  TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(hintText: "title")),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _description,
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: "Description",
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _description.dispose();
    super.dispose();
  }
}
