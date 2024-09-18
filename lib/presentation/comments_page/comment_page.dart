import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/assets/colors.dart';
import 'package:social_media_app/data/model/CommentModel/CommentModel.dart';
import 'package:social_media_app/presentation/comments_page/comment_controller.dart';
import '../../assets/dimens.dart';
import '../../assets/fonts.dart';


class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CommentController()..init(),
        child:
            Consumer<CommentController>(builder: (context, controller, child) {
          if (controller.isLoading) {
             return const Scaffold(
              backgroundColor: SocialMediaAppColors.white,
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (controller.errorMessage != null) {
             return Center(child: Text('Error: ${controller.errorMessage}'));
          } else if (controller.comments.isEmpty) {
             return Center(
              child: InkWell(
                  child: const Text("No users found"),
                  onTap: () {
                    controller.init();
                  }),
            );
          } else {
             return Scaffold(
              backgroundColor: SocialMediaAppColors.white,
              body: ListView.builder(
                itemCount: controller.comments.length,
                itemBuilder: (context, index) {
                  final CommentModel comment = controller.comments[index];
                  return Card(
                      color: SocialMediaAppColors.fifthColorLightest,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                (comment.name).toString(),
                                style: const TextStyle(
                                    color: SocialMediaAppColors.thirdColor,
                                    fontFamily: Fonts.nunitoBold,
                                    fontSize: Dimens.headline2),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                (comment.email).toString(),
                                style: const TextStyle(
                                    color: SocialMediaAppColors.thirdColor),
                              ),
                              const SizedBox(height: 8),
                              Text(comment.body.toString()),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FloatingActionButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            TextEditingController
                                                editController =
                                                TextEditingController();
                                            editController.text = comment.body!;
                                            return AlertDialog(
                                              title: const Text("Düzenle"),
                                              content: TextField(
                                                controller: editController,
                                                maxLines: 10,
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('İptal'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('Kaydet'),
                                                  onPressed: () {               //// BURAYI NASIL UPDATE EDİCEM ???
                                                    Navigator.of(context).pop();
                                                  },
                                                )
                                              ],
                                            );
                                          });
                                      const Icon(Icons.edit);
                                    },
                                  ),
                                  FloatingActionButton(onPressed: () {   // burayı nasıl animasyonlaştırıcaz
                                    const Icon(Icons.favorite);
                                  })
                                ],
                              ),
                            ]),
                      ));
                },
              ),
            );
          }
        }));
  }
}
