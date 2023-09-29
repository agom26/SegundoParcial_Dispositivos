import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getTarea() async {
  List tareas = [];
  QuerySnapshot querySnapshot = await db.collection('tareas').get();
  for (var doc in querySnapshot.docs) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    Map tarea = {
      "nombre": data["nombre"],
      "descripcion": data["descripcion"],
      "uid": doc.id,
    };

    tareas.add(tarea);
  }
  return tareas;
}

// Guardar datos
Future<void> addTarea(String name, String descripcion) async {
  await db
      .collection("tareas")
      .add({"nombre": name, "descripcion": descripcion});
}

// Actualizar datos
Future<void> updateTarea(String uid, String name, String descripcion) async {
  await db
      .collection("tareas")
      .doc(uid)
      .set({"nombre": name, "descripcion": descripcion});
}

// Borrar datos
Future<void> deleteTarea(String uid) async {
  await db.collection("tareas").doc(uid).delete();
}
