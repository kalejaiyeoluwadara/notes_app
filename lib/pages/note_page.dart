import 'package:flutter/material.dart';
import 'package:notes_app/components/drawer.dart';
import 'package:notes_app/components/note_list.dart';
import 'package:notes_app/model/note.dart';
import 'package:provider/provider.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    void createNote() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add Note'),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Enter your note',
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  final note = controller.text.trim();
                  if (note.isNotEmpty) {
                    context.read<Note>().addNote(note);
                    controller.clear();
                  }
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  surfaceTintColor:
                      Colors.transparent, // Remove background color
                  shadowColor: Colors.transparent, // Remove shadow
                  side: BorderSide.none, // Remove any border
                ),
                child: const Text(
                  'Add',
                  style:
                      TextStyle(color: Colors.black), // Set text color to black
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      drawer: const MyDrawe(),
      body: Consumer<Note>(
        builder: (context, noteProvider, child) {
          final notes = noteProvider.notes;
          if (notes.isEmpty) {
            return const Center(
              child: Text(
                'No notes added yet!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }
          return NoteList(
            notes: notes,
            onDelete: noteProvider.deleteNoteAt,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
