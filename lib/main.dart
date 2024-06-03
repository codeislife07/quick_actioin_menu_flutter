import 'package:flutter/material.dart';
import 'package:quick_actioin_menu_flutter/second_screen.dart';
import 'package:quick_actioin_menu_flutter/three_screen.dart';
import 'package:quick_actions/quick_actions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const MyHomePage(title: 'Flutter Quick Action Demo'),
        "second_screen": (context) => const SeconsScreen(),
        "third_screen": (context) => const ThirdScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const QuickActions quickActions = QuickActions();
    quickActions.initialize((String shortcutType) {
      Navigator.pushNamed(context, shortcutType);
    });
    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'second_screen',
          localizedTitle: 'Second Screen',
          icon: 'gamezone'),
      const ShortcutItem(
        type: 'third_screen',
        localizedTitle: 'Third Screen',
        icon: 'guest_room',
      )
    ]);

    /// Name of native resource (xcassets etc; NOT a Flutter asset) to be
    /// displayed as the icon for single item.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
