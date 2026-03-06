import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practicee/riverpod/6.dart'
    show TodoProvider, Todo;

final todosProvider = StateNotifierProvider<TodoProvider, List<Todo>>(
  (_) => TodoProvider([]),
);

final filterTextProvider = StateProvider<String>((_) => "");

final filteredTodosprovider = Provider((Ref ref) {
  final todos = ref.watch(todosProvider);
  final filter = ref.watch(filterTextProvider);
  if (filter.isEmpty) return todos;
  return todos
      .where((t) => t.title.toLowerCase().contains(filter.toLowerCase()))
      .toList();
});

class RiverpodFilterTodoProvider extends ConsumerWidget {
  const RiverpodFilterTodoProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(filteredTodosprovider);
    final todoControl = ref.read(todosProvider.notifier);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            IconButton(
              onPressed: () => todoControl.add("Todo ${Random().nextInt(11)}"),
              icon: const Icon(Icons.add),
            ),
            TextField(
              onChanged: (value) =>
                  ref.read(filterTextProvider.notifier).state = value,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Checkbox(
                      value: todos[index].isCompleted,
                      onChanged: (value) => todoControl.toggle(todos[index].id),
                    ),
                    title: Text(
                      todos[index].title,
                      style: TextStyle(
                        decoration: todos[index].isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () => todoControl.remove(todos[index].id),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
