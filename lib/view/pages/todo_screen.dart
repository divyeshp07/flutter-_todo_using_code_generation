import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/controller/todo_controller.dart';

class MytodoUsingCg extends ConsumerWidget {
  const MytodoUsingCg({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController textEditingController = TextEditingController();
    final mylist = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('todo-using-code-generation'),
      ),
      body: ListView.builder(
        itemCount: mylist.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            textEditingController.text = mylist[index].title;
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: TextField(
                  controller: textEditingController,
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        ref
                            .read(todoProvider.notifier)
                            .editTodoTitle(index, textEditingController.text);
                        Navigator.pop(context);
                      },
                      child: const Text('Update'))
                ],
              ),
            );
          },
          child: Card(
            child: ListTile(
              title: Text(mylist[index].title),
              trailing: IconButton(
                  onPressed: () {
                    ref.read(todoProvider.notifier).deleteTodo(index);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: TextField(
                controller: textEditingController,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      ref
                          .read(todoProvider.notifier)
                          .addtodo(textEditingController.text);
                      Navigator.pop(context);
                      textEditingController.clear();
                    },
                    child: const Text('add'))
              ],
            ),
          );
        },
        label: const Text('Add item'),
      ),
    );
  }
}
