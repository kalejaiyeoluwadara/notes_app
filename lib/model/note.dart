import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Note extends ChangeNotifier {
  final Box<String> _notesBox = Hive.box<String>('notes');

  List<String> get notes => _notesBox.values.toList();

  void addNote(String note) {
    if (note.isNotEmpty) {
      _notesBox.add(note);
      notifyListeners();
    }
  }

  void deleteNoteAt(int index) {
    _notesBox.deleteAt(index);
    notifyListeners();
  }
}
