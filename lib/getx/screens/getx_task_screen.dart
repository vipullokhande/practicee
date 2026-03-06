import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practicee/getx/controllers/task_controller.dart';
import 'package:practicee/sql/models/task_model.dart';

class GetxTaskScreen extends StatefulWidget {
  const GetxTaskScreen({super.key});

  @override
  State<GetxTaskScreen> createState() => _GetxTaskScreenState();
}

class _GetxTaskScreenState extends State<GetxTaskScreen> {
  final TextEditingController _controller = TextEditingController();

  addTask(TaskController taskController) {
    if (_controller.text.trim().isEmpty) return;
    taskController.addTask(_controller.text);
    _controller.clear();
  }

  toggleTask(TaskController taskController, Task task) =>
      taskController.updateTask(Task(title: task.title, isDone: task.isDone));

  deleteTask(TaskController taskController, int id) =>
      taskController.deleteTask(id);
  @override
  void initState() {
    super.initState();
    Get.put(TaskController());
  }

  @override
  Widget build(BuildContext context) {
    print("Build called");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getx Todo App"),
        centerTitle: true,
      ),
      body: GetBuilder<TaskController>(
          id: 'task_list',
          builder: (controller) {
            print("GetBuilder Called");
            return Column(children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: const Text("All"),
                    selected:
                        Get.find<TaskController>().taskFilter == TaskFilter.all,
                    onSelected: (_) =>
                        Get.find<TaskController>().changeFilter(TaskFilter.all),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text("Completed"),
                    selected: Get.find<TaskController>().taskFilter ==
                        TaskFilter.completed,
                    onSelected: (_) => Get.find<TaskController>()
                        .changeFilter(TaskFilter.completed),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: const Text("Incomplete"),
                    selected: Get.find<TaskController>().taskFilter ==
                        TaskFilter.incomplete,
                    onSelected: (_) => Get.find<TaskController>()
                        .changeFilter(TaskFilter.incomplete),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: controller.filteredTasks.isEmpty
                    ? const Center(
                        child: Text(
                          "No Tasks Found 📝",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.filteredTasks.length,
                        itemBuilder: (context, index) {
                          final task = controller.filteredTasks[index];

                          return ListTile(
                            leading: GetBuilder<TaskController>(
                              id: 'task_${task.id}',
                              builder: (con) {
                                final updatedTask = con.getTaskById(task.id!);
                                if (updatedTask == null) {
                                  return const SizedBox.shrink();
                                }
                                print("CheckBox called");
                                return Checkbox(
                                  value: updatedTask.isDone,
                                  onChanged: (value) {
                                    controller.updateTask(
                                      task.copyWith(
                                        id: task.id,
                                        isDone: value ?? false,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            title: Text(
                              task.title,
                              style: TextStyle(
                                decoration: task.isDone
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => task.id != null
                                  ? deleteTask(controller, task.id!)
                                  : () {},
                            ),
                          );
                        },
                      ),
              ),
            ]);
          }),
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
                if (_controller.text.isNotEmpty) {
                  addTask(Get.find<TaskController>());
                }
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
