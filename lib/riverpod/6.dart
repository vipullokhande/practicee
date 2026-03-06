import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practicee/riverpod/5.dart' show space;

final todoProvider = StateNotifierProvider<TodoProvider, List<Todo>>(
  (_) => TodoProvider([]),
);

class Todo {
  final int id;
  final String title;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  Todo copyWith({int? id, String? title, bool? isCompleted}) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class TodoProvider extends StateNotifier<List<Todo>> {
  TodoProvider(super.state);

  void add(String title) {
    state = [
      ...state,
      Todo(
        id: state.length,
        title: title,
        isCompleted: false,
      ),
    ];
  }

  void remove(int id) {
    state = state.where((t) => t.id != id).toList();
  }

  void toggle(int id) {
    final todos = [...state];
    final index = todos.indexWhere((t) => t.id == id);

    if (index == -1) return;

    todos[index] =
        todos[index].copyWith(isCompleted: !todos[index].isCompleted);

    state = todos;
  }
}

class RiverpodTodoStateNotifierProviderExample extends ConsumerStatefulWidget {
  const RiverpodTodoStateNotifierProviderExample({super.key});

  @override
  ConsumerState<RiverpodTodoStateNotifierProviderExample> createState() =>
      _RiverpodTodoStateNotifierProviderExampleState();
}

class _RiverpodTodoStateNotifierProviderExampleState
    extends ConsumerState<RiverpodTodoStateNotifierProviderExample> {
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoProvider);
    final todoControl = ref.read(todoProvider.notifier);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_textEditingController.text.isNotEmpty) {
                      todoControl.add(_textEditingController.text);
                      _textEditingController.clear();
                      return;
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Enter title"),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            space,
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
