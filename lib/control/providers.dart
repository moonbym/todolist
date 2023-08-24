import 'package:flutter/material.dart';
import 'package:newtodolist/model/dto/datatransfereobject.dart';

class ListState extends ChangeNotifier {
  static List<Task> toDoListData = [];

  add(value) {
    toDoListData.add(value);
    notifyListeners();
  }

  delete(index) {
    toDoListData.removeAt(index);
    notifyListeners();
  }

  edit(String value, index) {
    toDoListData[index].title = value;
    notifyListeners();
  }
}
