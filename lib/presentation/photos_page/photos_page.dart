import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/presentation/photos_page/photos_controller.dart';
import 'package:social_media_app/presentation/photos_page/photos_detail_page.dart';
import '../../assets/colors.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => PhotosController()..init(),
      child: Consumer<PhotosController>(
        builder: (BuildContext context, PhotosController controller, Widget? child) {
          if (controller.isLoading) {
            return const Scaffold(
              backgroundColor: SocialMediaAppColors.white,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (controller.photos.isEmpty) {
            return Center(
              child: InkWell(
                child: const Text("No photos found"),
                onTap: () {
                  controller.init();
                },
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: SocialMediaAppColors.white,
              body: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: controller.photos.length,
                  itemBuilder: (BuildContext context, int index) {
                    final photo = controller.photos[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhotosDetailPage(photo: photo),
                          ),
                        );
                      },
                      child: Card(
                        color: theme.colorScheme.secondary,
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Image.network(
                                photo.thumbnailUrl ?? '',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

