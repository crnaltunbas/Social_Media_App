import 'package:flutter/material.dart';
import '../../assets/colors.dart';
import '../../assets/dimens.dart';
import '../../assets/fonts.dart';
import '../../data/model/album_model/album_model.dart';
import '../controllers/albums_controller.dart';
import '../photos_page/photos_page.dart';
import 'albums_controller.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key? key}) : super(key: key);

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  late Future<List<Album>> albums;
  final AlbumController _albumController = AlbumController();

  @override
  void initState() {
    super.initState();
    albums = _albumController.fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        backgroundColor: SocialMediaAppColors.primaryColor,
      ),
      backgroundColor: SocialMediaAppColors.white,
      body: FutureBuilder<List<Album>>(
        future: albums,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading albums'));
          } else if (snapshot.hasData) {
            return _buildAlbumList(snapshot.data!);
          } else {
            return const Center(child: Text('No albums available'));
          }
        },
      ),
    );
  }

  Widget _buildAlbumList(List<Album> albums) {
    Map<int, List<Album>> groupedAlbums = {};
    for (var album in albums) {
      int userId = album.userId;
      groupedAlbums[userId] = groupedAlbums[userId] ?? [];
      groupedAlbums[userId]!.add(album);
    }

    return ListView.builder(
      itemCount: groupedAlbums.keys.length,
      itemBuilder: (context, index) {
        int userId = groupedAlbums.keys.elementAt(index);
        List<Album> userAlbums = groupedAlbums[userId]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserHeader(userId),
            _buildUserAlbums(userAlbums),
            const Divider(),
          ],
        );
      },
    );
  }

  Widget _buildUserHeader(int userId) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: SocialMediaAppColors.secondColor,
      child: Text(
        'Kullanıcı $userId',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: Dimens.headline3,
          color: SocialMediaAppColors.linearBlack,
        ),
      ),
    );
  }

  Widget _buildUserAlbums(List<Album> userAlbums) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: userAlbums.length,
      itemBuilder: (context, albumIndex) {
        var album = userAlbums[albumIndex];
        return ListTile(
          title: Text('${albumIndex + 1}. Album: ${album.title}'),
          tileColor: SocialMediaAppColors.fourthColorLightest,
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          titleTextStyle: TextStyle(
            fontSize: Dimens.body1,
            color: SocialMediaAppColors.black,
            fontFamily: Fonts.nunitoRegular,
          ),
          onTap: () => _showAlbumOptions(context, album),
        );
      },
    );
  }

  void _showAlbumOptions(BuildContext context, Album album) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Ne yapmak istersiniz?',
            style: TextStyle(
              color: SocialMediaAppColors.linearBlack,
              fontFamily: Fonts.nunitoMedium,
            ),
          ),
          backgroundColor: SocialMediaAppColors.fourthColorLightest,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showAlbumPhotos(context, album); // Albüm fotoğraflarını göster
              },
              child: Text(
                'Göster',
                style: TextStyle(
                  color: SocialMediaAppColors.secondColorDarkest,
                  fontFamily: Fonts.nunitoRegular,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _albumController.deleteAlbum(album.id);
                setState(() {
                  albums = _albumController.fetchAlbums();
                });
              },
              child: Text(
                'Sil',
                style: TextStyle(
                  color: SocialMediaAppColors.secondColorDarkest,
                  fontFamily: Fonts.nunitoRegular,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAlbumPhotos(BuildContext context, Album album) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PhotosPage(),
      ),
    );
  }
}
