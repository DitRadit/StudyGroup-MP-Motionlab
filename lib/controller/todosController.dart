import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodosController extends GetxController{
 // TextEditingController untuk melakukan controlling input text
  final _textEditingController = TextEditingController();

  // Fungsi akan dipanggil ketika tombol 'tambah todo' ditekan
  void handleCreateTodo() async {
    final newTodo = {
      'status': false,
      'text': _textEditingController.text,
      'created_at': FieldValue.serverTimestamp(),
    };

    final db = FirebaseFirestore.instance;
    await db.collection('todos').add(newTodo);

    _textEditingController.text = '';
  }

  // Fungsi akan dipanggil ketika todo di checklist/unchecklist
  void handleToggleTodo(String id, bool status) async {
    final updateStatusTodo = {'status': !status};

    final db = FirebaseFirestore.instance;
    await db.collection('todos').doc(id).update(updateStatusTodo);
  }

  // Fungsi akan dipanggil ketika menghapus salah satu todo
  void handleDeleteTodo(String id) async {
    final db = FirebaseFirestore.instance;
    await db.collection('todos').doc(id).delete();
  }

}