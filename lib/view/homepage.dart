import 'package:flutter/material.dart';
import 'package:newtodolist/control/providers.dart';
import 'package:newtodolist/model/dto/datatransfereobject.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    late TextEditingController titlecontroller =
        TextEditingController(text: null);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                    controller: titlecontroller,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        context
                            .read<ListState>()
                            .add(Task(title: titlecontroller.text));
                        Navigator.pop(context);
                        titlecontroller = TextEditingController(text: null);
                      },
                      icon: const Icon(
                        Icons.add,
                      ),
                      hoverColor: Colors.transparent,
                    )
                  ],
                ),
              );
            }),
        body: Center(
          child: Column(
            children: [
              Consumer<ListState>(
                builder: (context, value, child) => Expanded(
                  child: ListView.builder(
                      itemCount: ListState.toDoListData.length,
                      itemBuilder: (context, index) => Task(
                            number: index,
                            title: ListState.toDoListData[index].title,
                            index: index,
                          )),
                ),
              ),
            ],
          ),
        ));
  }
}
