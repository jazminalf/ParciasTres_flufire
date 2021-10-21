import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  late FirebaseFirestore firestore;
  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(String nombre, String entrenador, String estaenprimera, String web) async {
    try {
      await firestore.collection("equipo").add({
        'nombre': nombre,
        'Entrenador': entrenador,
        'estaenprimera': estaenprimera,
        'web': web,
        //'timestamp': FieldValue.serverTimestamp()
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> insertar(String equipo_id, String nombre) async {
    try {
      await firestore.collection("capitanes").add({
        'equipo_id': equipo_id,
        'nombre': nombre,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("equipo").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> borrar(String id) async {
    try {
      await firestore.collection("capitanes").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
          await firestore.collection('equipo').orderBy('nombre').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "nombre": doc['nombre'], "Entrenador": doc["Entrenador"], "estaenprimera": doc["estaenprimera"], "web": doc["web"]};
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<List> Leer() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
          await firestore.collection('capitanes').orderBy('equipo_id').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "equipo_id": doc['equipo_id'], "nombre": doc["nombre"]};
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return docs;
  }

  Future<void> update(String id, String nombre, String entrenador, String estaenprimera, String web) async {
    try {
      await firestore
          .collection("equipo")
          .doc(id)
          .update({'nombre': nombre, 'Entrenador': entrenador, 'estaenprimera': estaenprimera, 'web': web});
    } catch (e) {
      print(e);
    }
  }

  Future<void> actualizar(String id, String equipo_id, String nombre) async {
    try {
      await firestore
          .collection("capitanes")
          .doc(id)
          .update({'equipo_id': equipo_id, 'nombre': nombre,});
    } catch (e) {
      print(e);
    }
  }
}
