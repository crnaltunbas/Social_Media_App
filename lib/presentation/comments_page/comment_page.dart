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
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Name: ',
                                    style: TextStyle(
                                        color: SocialMediaAppColors.linearBlack,
                                        fontFamily: Fonts.nunitoBold,
                                        fontSize: Dimens.headline3),
                                  ),
                                  TextSpan(
                                    text: comment.name,
                                    style: const TextStyle(
                                        color: SocialMediaAppColors.thirdColor,
                                        fontFamily: Fonts.nunitoBold,
                                        fontSize: Dimens.headline3),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Email: ',
                                    style: TextStyle(
                                        color: SocialMediaAppColors.linearBlack,
                                        fontFamily: Fonts.nunitoBold,
                                        fontSize: Dimens.headline3),
                                  ),
                                  TextSpan(
                                    text: comment.email,
                                    style: const TextStyle(
                                        color: SocialMediaAppColors.thirdColor,
                                        fontFamily: Fonts.nunitoBold,
                                        fontSize: Dimens.headline3),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Comment: ',
                                    style: TextStyle(
                                        color: SocialMediaAppColors.linearBlack,
                                        fontFamily: Fonts.nunitoBold,
                                        fontSize: Dimens.headline3),
                                  ),
                                  TextSpan(
                                    text: comment.body,
                                    style: const TextStyle(
                                        color: SocialMediaAppColors.thirdColor,
                                        fontFamily: Fonts.nunitoBold,
                                        fontSize: Dimens.headline3),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          TextEditingController editController =
                                              TextEditingController(
                                                  text: comment.body);
                                          editController.text = comment.body!;
                                          return AlertDialog(
                                            backgroundColor:
                                                SocialMediaAppColors
                                                    .fifthColorLightest,
                                            title: const Text(
                                              "Düzenle",
                                              style: TextStyle(
                                                color: SocialMediaAppColors
                                                    .thirdColor,
                                                fontFamily: Fonts.nunitoBold,
                                                fontSize: Dimens.headline2,
                                              ),
                                            ),
                                            content: TextField(
                                              controller: editController,
                                              style: const TextStyle(
                                                  color: SocialMediaAppColors
                                                      .linearBlack,
                                                  fontFamily: Fonts.nunitoBold,
                                                  fontSize: Dimens.headline3),
                                              maxLines: 8,
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text(
                                                  'İptal',
                                                  style: TextStyle(
                                                    color: SocialMediaAppColors
                                                        .thirdColor,
                                                    fontFamily:
                                                        Fonts.nunitoBold,
                                                    fontSize: Dimens.headline2,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              TextButton(
                                                child: const Text(
                                                  'Kaydet',
                                                  style: TextStyle(
                                                    color: SocialMediaAppColors
                                                        .thirdColor,
                                                    fontFamily:
                                                        Fonts.nunitoBold,
                                                    fontSize: Dimens.headline2,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              )
                                            ],
                                          );
                                        });
                                  },
                                ),
                                 IconButton(
                                   icon: Icon(
                                    controller.favoriteControllers[index].comment.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                    color: controller.favoriteControllers[index].comment.isFavorite
                                    ? Colors.red
                                    : Colors.grey,
                            ),
                                   onPressed: () {
                                   controller.toggleFavorite(index);// Favori durumunu değiştir
                            },
                            ),
                                 Text(
                                '${controller.favoriteControllers[index].comment.favoriteCount} ',
                                 style: const TextStyle(
                                 color: SocialMediaAppColors.linearBlack,
                                 fontFamily: Fonts.nunitoBold,
                                 fontSize: Dimens.headline3,
                            ),
                            ),
                            ]),],
                            ),
                          ),
                    );
                },
              ),
            );
          }
        }));
  }
}
//COMMENT PAGE FİNİSHED BUT IT ISN'T DONE OPERATION OF SAVE BECAUSE API IS FAKE (JSON PLACEHOLDER)