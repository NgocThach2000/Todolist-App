// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/src/controller/todo_controller.dart';
import 'package:todolist/src/model/note_model.dart';
import 'package:todolist/src/view/add_note_veiw.dart';
import 'package:todolist/src/app_view.dart';
import 'package:todolist/src/widgets/floatingActionButtonWidget.dart';
import 'package:todolist/src/constant/constant.dart';
import 'package:todolist/src/widgets/paddingWidget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TodoController _controller = TodoController();

  @override
  void initState() {
    super.initState();
    updateNoteList();
  }

  updateNoteList() {
    _controller.updateNoteList();
  }

  Widget _buildNote(Note note) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              '${note.title!.toUpperCase()} (${note.status == 1 ? 'Completed' : 'Incompleted'})\nDeadline: ${_controller.dateFormatter.format(note.deadline!)}',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  decoration: note.status == 0
                      ? TextDecoration.none
                      : TextDecoration.lineThrough),
            ),
            subtitle: Text(
              'Description: ${note.description!}',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black45,
                  decoration: note.status == 0
                      ? TextDecoration.none
                      : TextDecoration.lineThrough),
            ),
            trailing: Checkbox(
              onChanged: (value) {
                note.status = value! ? 1 : 0;
                _controller.updatedNote(note);
                updateNoteList();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => App(
                        selectedIndexPage: 0,
                      ),
                    ));
              },
              activeColor: Theme.of(context).primaryColor,
              value: note.status == 1 ? true : false,
            ),
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => AddNoteView(
                    updateNoteList: updateNoteList,
                    note: note,
                    saveIndex: 0,
                  ),
                ),
              );
            },
          ),
          Divider(
            height: 5.0,
            color: Theme.of(context).primaryColor,
            thickness: 2.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widgetFloatingActionButton(
        heroTag: 'HomeTag',
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => AddNoteView(
                updateNoteList: updateNoteList,
                saveIndex: 0,
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Todolist Manabie',
            style: kAppBarTextStyle,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _controller.noteList,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final int allNoteCount = snapshot.data!.length;
          // ignore: non_constant_identifier_names
          final List<Note> AllNote = snapshot.data!.toList();
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 80),
            itemCount: int.parse(allNoteCount.toString()) + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return widgetPadding(
                  centerTitle: 'My Notes',
                  allNoteLength: allNoteCount.toString(),
                );
              }
              return _buildNote(AllNote[index - 1]);
            },
          );
        },
      ),
    );
  }
}
