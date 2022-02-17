// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:todolist/src/controller/add_note_controller.dart';
import 'package:todolist/src/model/note_model.dart';
import 'package:todolist/src/constant/constant.dart';

class AddNoteView extends StatefulWidget {
  final int? saveIndex;
  final Note? note;
  final VoidCallback? updateNoteList;
  AddNoteView({Key? key, this.note, this.updateNoteList, this.saveIndex})
      : super(key: key);

  @override
  _AddNoteViewState createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  final AddNoteController _controller = AddNoteController();

  @override
  void initState() {
    super.initState();
    changeNoteButton();
  }

  void changeNoteButton() {
    setState(() {
      _controller.changeNoteButton(widget);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _handleDataPicker() async {
    setState(() {
      _controller.handleDataPicker(context);
    });
  }

  _submit() {
    _controller.submit(context, widget);
  }

  _delete() {
    _controller.delete(context, widget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Note',
            style: kAppBarTextStyle,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _controller.titleText,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Form(
                key: _controller.formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          labelText: 'Title',
                          labelStyle: const TextStyle(fontSize: 20),
                          hintText: 'Write a title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (input) => input!.trim().isEmpty
                            ? 'Please enter a note title'
                            : null,
                        onSaved: (input) => _controller.title = input!,
                        initialValue: _controller.title,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: const TextStyle(fontSize: 20),
                          hintText: 'Write a Description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (input) => input!.trim().isEmpty
                            ? 'Please enter a note description'
                            : null,
                        onSaved: (input) => _controller.description = input!,
                        initialValue: _controller.description,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      child: TextFormField(
                        controller: _controller.deadlineController,
                        readOnly: true,
                        style: const TextStyle(fontSize: 18),
                        onTap: _handleDataPicker,
                        decoration: InputDecoration(
                          labelText: 'Deadline',
                          labelStyle: const TextStyle(fontSize: 20),
                          hintText: 'Pick a deadline',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (input) => input!.trim().isEmpty
                            ? 'Please enter a note deadline'
                            : null,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      height: 60.0,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ElevatedButton(
                        onPressed: _submit,
                        child: Text(
                          _controller.btnTextSave,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    widget.note != null
                        ? Container(
                            margin: const EdgeInsets.symmetric(vertical: 20.0),
                            height: 60.0,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ElevatedButton(
                              child: const Text(
                                'Delete Note',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              onPressed: _delete,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
