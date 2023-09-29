import 'package:flutter/material.dart';

import '../services/firebase_service.dart';
// import 'package:crud/services/firebase_service.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});
  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController descripcionController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    nameController.text = arguments['nombre'];
    descripcionController.text = arguments['descripcion'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Editar tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Actualice el nombre',
              ),
            ),
            TextField(
              controller: descripcionController,
              decoration: const InputDecoration(
                hintText: 'Actualice la descripcion de la tarea',
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await updateTarea(arguments['uid'], nameController.text,
                          descripcionController.text)
                      .then((_) {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple, // Background color
                ),
                child: const Text("Actualizar"))
          ],
        ),
      ),
    );
  }
}
