import 'package:flutter/material.dart';
import 'package:crud/services/firebase_service.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});
  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController descripcionController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Añadir tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Ingrese la nueva tarea',
              ),
            ),
            TextField(
              controller: descripcionController,
              decoration: const InputDecoration(
                hintText: 'Ingrese la descripcion de la tarea',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await addTarea(
                          nameController.text, descripcionController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple, // Background color
                ),
                child: const Text("Guardar"))
          ],
        ),
      ),
    );
  }
}
