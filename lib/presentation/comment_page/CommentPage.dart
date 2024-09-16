import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/assets/colors.dart';
import 'package:social_media_app/data/model/CommentModel/CommentModel.dart';
import 'package:social_media_app/presentation/comment_page/CommentController.dart';
import '../../assets/dimens.dart';
import '../../assets/fonts.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CommentController()..init(),
        child: Consumer<CommentController>(builder: (context, controller, child) {
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
            List<CommentModel> comments = [];
            return Scaffold(
              backgroundColor: SocialMediaAppColors.white,
              body: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
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
                                (comments[index].name).toString(),
                                style: const TextStyle(
                                    color: SocialMediaAppColors.thirdColor,
                                    fontFamily: Fonts.nunitoBold,
                                    fontSize: Dimens.headline2),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                (comments[index].email).toString(),
                                style: const TextStyle(
                                    color: SocialMediaAppColors.thirdColor),
                              ),
                              const SizedBox(height: 8),
                              Text(comments[index].body.toString()),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FloatingActionButton(
                                    onPressed: () {
                                      const Icon(Icons.refresh_rounded);
                                    },
                                  ),
                                  FloatingActionButton(onPressed: (){
                                    const Icon(Icons.favorite_outline_rounded);
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
