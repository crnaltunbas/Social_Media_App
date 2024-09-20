import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/assets/colors.dart';
import '../../assets/dimens.dart';
import '../../assets/fonts.dart';
import '../../data/model/posts_model/posts_model.dart';
import 'post_controller.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostController()..init(),
      child: Consumer<PostController>(
        builder: (context, controller, child) {
          if (controller.loading) {
            return const Scaffold(
              backgroundColor: SocialMediaAppColors.white,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (controller.posts.isEmpty) {
            return Scaffold(
              backgroundColor: SocialMediaAppColors.white,
              body: Center(
                child: InkWell(
                  child: const Text("No posts found"),
                  onTap: () {
                    controller.init();
                  },
                ),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: SocialMediaAppColors.white,
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    // AppBar benzeri üst kısım
                    Container(
                      height: MediaQuery.of(context).size.height / 15,
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: SocialMediaAppColors.greyDark,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Posts List',
                            style: TextStyle(
                              color: SocialMediaAppColors.thirdColor,
                              fontSize: Dimens.headline2,
                              fontFamily: Fonts.nunitoBold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.post_add,
                              size: 32,
                              color: SocialMediaAppColors.thirdColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Post listesi
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      itemCount: controller.posts.length,
                      itemBuilder: (context, index) {
                        final post = controller.posts[index];
                        return Column(
                          children: [
                            const SizedBox(height: 6.0),
                            Card(
                              color: SocialMediaAppColors.fifthColorLightest,
                              elevation: 3,
                              child: InkWell(
                                onTap: () => _showPostDialog(context, post),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Metinlerin olduğu kısım
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              post.title ?? "Post not found",
                                              style: const TextStyle(
                                                fontSize: Dimens.body1,
                                                fontFamily: Fonts.nunitoBold,
                                                color: SocialMediaAppColors
                                                    .linearBlack,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1, // Taşmayı engelle
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              post.body ?? "Content not found",
                                              style: const TextStyle(
                                                fontSize: Dimens.body2,
                                                fontFamily: Fonts.nunitoRegular,
                                                color: SocialMediaAppColors
                                                    .linearBlack,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines:
                                                  2, // İçeriği sınırlamak için
                                            ),
                                          ],
                                        ),
                                      ),
                                      // İleri ikon butonu
                                      IconButton(
                                        onPressed: () =>
                                            _showPostDialog(context, post),
                                        icon: const Icon(
                                          Icons.arrow_forward_ios,
                                          color: SocialMediaAppColors
                                              .thirdColorLightest,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
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

  Future<void> _showPostDialog(BuildContext context, PostModel post) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: SocialMediaAppColors.fifthColorLightest,
          title: const Text(
            'Post Details',
            style: TextStyle(
              color: SocialMediaAppColors.thirdColor,
              fontFamily: Fonts.nunitoBold,
              fontSize: Dimens.headline2,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                post.title ?? "Title not found",
                style: const TextStyle(
                  fontSize: Dimens.body1,
                  fontFamily: Fonts.nunitoBold,
                  color: SocialMediaAppColors.linearBlack,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                post.body ?? "Content not found",
                style: const TextStyle(
                  fontSize: Dimens.body2,
                  fontFamily: Fonts.nunitoRegular,
                  color: SocialMediaAppColors.linearBlack,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: SocialMediaAppColors.secondColorLight),
              ),
            ),
          ],
        );
      },
    );
  }
}
