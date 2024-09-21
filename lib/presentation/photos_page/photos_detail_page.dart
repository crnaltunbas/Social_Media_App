import 'package:flutter/material.dart';
import 'package:social_media_app/data/model/photos_model/photos_model.dart';
import '../../assets/colors.dart';

class PhotosDetailPage extends StatelessWidget {
  final PhotosModel photo;

  const PhotosDetailPage({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context){
  final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: SocialMediaAppColors.white,
      appBar: AppBar(
        backgroundColor: SocialMediaAppColors.thirdColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.network(
                photo.url ?? '',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text(
                      'Image not available',
                      style: TextStyle(color: SocialMediaAppColors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16 ),
            decoration: const BoxDecoration(
              color: SocialMediaAppColors.fifthColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  photo.title ?? 'No Title',
                  style: const TextStyle(
                    color: SocialMediaAppColors.thirdColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Album Id: ${photo.albumId}',
                  style: const TextStyle(color: SocialMediaAppColors.thirdColor, fontSize: 13.7),
                ),
                const SizedBox(height: 20),
                Divider(color: SocialMediaAppColors.thirdColor),
                const SizedBox(height: 3),
                const Text(
                  'Comments Section',
                  style: TextStyle(
                    color: SocialMediaAppColors.thirdColor,
                    fontSize: 13.6,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
