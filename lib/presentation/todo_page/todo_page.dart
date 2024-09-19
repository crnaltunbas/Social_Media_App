import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/presentation/todo_page/todo_controller.dart';

import '../../assets/colors.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => TodoController()..init(),
      child: Consumer<TodoController>(
        builder:
            (BuildContext context, TodoController controller, Widget? child) {
          if (controller.isLoading) {
            return const Scaffold(
              //buraya bunu ekledim cunku diger turlu yuklenirken uygulama
              // rengi farkli
              backgroundColor: SocialMediaAppColors.white,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (controller.todos.isEmpty) {
            return Center(
              child: InkWell(
                child: const Text("No todos found"),
                onTap: () {
                  controller.init();
                },
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: SocialMediaAppColors.white,
              body: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.todos.length,
                        itemBuilder: (BuildContext context, int index) {
                          final todo = controller.todos[index];
                          return Card(
                            color: theme.colorScheme.secondary,
                            elevation: 5,
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Title: ${todo.title}",
                                    style: theme.textTheme.titleLarge,
                                  ),
                                  Text(
                                    "Completed: ${todo.completed}",
                                    style: theme.textTheme.titleMedium,
                                  ),
                                ],
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
        },
      ),
    );
  }
}
