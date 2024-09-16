import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/assets/fonts.dart';
import 'package:social_media_app/presentation/todo_page/todo_controller.dart';

import '../../assets/colors.dart';
import '../../data/model/todo_model/todo_model.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _textController = TextEditingController();
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Todos",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: SocialMediaAppColors.thirdColorDarkest,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.todos.length,
                        itemBuilder: (BuildContext context, int index) {
                          final todo = controller.todos[index];
                          String title = "${todo.title![0].toUpperCase()}${todo.title!.substring(1)}.";
                          return Column(
                            children: [
                            Card(
                            color: SocialMediaAppColors.primaryColorLightest,
                            // surfaceTintColor: SocialMediaAppColors.primaryColorLightest,
                            elevation: 5,
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: todo.completed,
                                    onChanged: (bool? value) {
                                      // Handle checkbox change if needed
                                    },
                                    shape: CircleBorder(),
                                    checkColor: SocialMediaAppColors.white,
                                    activeColor: SocialMediaAppColors.thirdColorDarkest,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          title,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontFamily: Fonts.nunitoMedium,
                                            color: SocialMediaAppColors.linearBlack,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ),
                          ),
                          SizedBox(height: 10),
                            ],
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
