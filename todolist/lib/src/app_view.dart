import 'package:flutter/material.dart';
import 'package:todolist/src/widgets/bottomBarWidget.dart';
import 'package:todolist/src/controller/app_controller.dart';

// ignore: must_be_immutable
class App extends StatefulWidget {
  int? selectedIndexPage;
  App({Key? key, this.selectedIndexPage}) : super(key: key);
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppController _controller = AppController();

  @override
  void initState() {
    super.initState();
    _controller.selectedIndex = widget.selectedIndexPage!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        body: IndexedStack(
          index: _controller.selectedIndex,
          children: _controller.screens,
        ),
        bottomNavigationBar: widgetBottomBar(
          selectedIndex: _controller.selectedIndex,
          onTap: (index) {
            setState(
              () {
                _controller.selectedIndex = index;
              },
            );
          },
        ),
      ),
    );
  }
}
