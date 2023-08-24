import 'package:flutter/material.dart';
import 'package:newtodolist/control/providers.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Task extends StatelessWidget {
  Task({this.title, this.number, super.key, this.index});
  late String? title;
  final int? number;

  final int? index;

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller =
        TextEditingController(text: ListState.toDoListData[index!].title);
    return ListTile(
      title: Text(title!),
      leading: Text((number! + 1).toString()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              context.read<ListState>().delete(index);
            },
            icon: const Icon(Icons.remove),
            hoverColor: Colors.transparent,
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Edit"),
                  content: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                    controller: controller,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.read<ListState>().edit(controller.text, index);
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.edit,
                      ),
                      hoverColor: Colors.transparent,
                    )
                  ],
                ),
              );
            },
            icon: const Icon(Icons.edit_document),
            hoverColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}

class Taskdto {
  Taskdto(this.subject);
  final String subject;
}
