import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/pages/note_page.dart';
import 'package:notes_app/pages/settings_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('notes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Note()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.grey[300],
        home: const NoteApp(),
        routes: {
          '/settings': (context) => const SettingsPage(),
        },
      ),
    );
  }
}
