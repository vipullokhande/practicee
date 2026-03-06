import 'package:flutter/material.dart';
import 'package:practicee/sql/services/task_service.dart';
import '../models/task_model.dart';

class SqlTasksScreen extends StatefulWidget {
  const SqlTasksScreen({super.key});

  @override
  State<SqlTasksScreen> createState() => _SqlTasksScreenState();
}

class _SqlTasksScreenState extends State<SqlTasksScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Task> tasks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    try {
      final data = await TaskService.instance.getAllTasks();
      setState(() {
        tasks = data;
        isLoading = false;
      });
    } catch (e) {
      print("Error loading tasks: ${e.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> addTask() async {
    setState(() {
      isLoading = true;
    });
    if (_controller.text.trim().isEmpty) return;

    await TaskService.instance.insertTask(
      Task(title: _controller.text.trim()),
    );
    _controller.clear();
    await loadTasks();
  }

  Future<void> toggleTask(Task task) async {
    await TaskService.instance.updateTask(
      Task(
        id: task.id,
        title: task.title,
        isDone: !task.isDone,
      ),
    );
    await loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await TaskService.instance.deleteTask(id);
    await loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite Todo App"),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : tasks.isEmpty
              ? const Center(
                  child: Text(
                    "No Tasks Found 📝",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];

                    return ListTile(
                      leading: Checkbox(
                        value: task.isDone,
                        onChanged: (_) => toggleTask(task),
                      ),
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration:
                              task.isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () =>
                            task.id != null ? deleteTask(task.id!) : () {},
                      ),
                    );
                  },
                ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: "Enter new task...",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) addTask();
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
