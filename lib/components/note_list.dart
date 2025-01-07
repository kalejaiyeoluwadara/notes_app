import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  final List<String> notes;
  final void Function(int index) onDelete;

  const NoteList({super.key, required this.notes, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          margin: const EdgeInsets.only(
            left: 10.0,
            right: 4,
            top: 8.0,
            bottom: 8.0,
          ),
          child: ListTile(
            tileColor: Colors.transparent,
            title: Text(
              notes[index],
              style: const TextStyle(fontSize: 16),
            ),
            trailing: SizedBox(
              width: 100, // Ensure enough space for the Row and icons
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Align icons to the right
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.grey[700]),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.grey[700]),
                    onPressed: () => onDelete(index),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
