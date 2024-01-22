import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_app/model/todo_model.dart';
part 'todo_controller.g.dart';

@riverpod
class Todo extends _$Todo {
  @override
  List<TodoModel> build() {
    return [];
  }

  void addtodo(String title) {
    state = [...state, TodoModel(title: title)];
  }

  void deleteTodo(int index) {
    if (index >= 0 && index < state.length) {
      state = List.from(state)..removeAt(index);
    }
  }

  void editTodoTitle(int index, String newTitle) {
    if (index >= 0 && index < state.length) {
      state = List.from(state)..[index].title = newTitle;
    }
  }
}
