import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/assets/colors.dart';
import '../../assets/dimens.dart';
import '../../assets/fonts.dart';
import '../../data/model/user_model/user_model.dart';
import '../../widget/user_details_text_widget.dart';
import 'user_controller.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserController()..init(),
      child: Consumer<UserController>(
        builder: (context, controller, child) {
          if (controller.loading) {
            return const Scaffold(
              backgroundColor: SocialMediaAppColors.white,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (controller.users.isEmpty) {
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
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      //AppBar seklinde tanimladigim yer
                      //Buraya ekran ismini ya da farkli bir sey ekleyebiliriz
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
                            'Users List',
                            style: TextStyle(
                              color: SocialMediaAppColors.thirdColor,
                              fontSize: Dimens.headline2,
                              //Dimens sinifindan degerleri aldik
                              fontFamily: Fonts.nunitoBold,
                              //Font sinifindan degerleri aldik
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.account_circle,
                              size: 32,
                              color: SocialMediaAppColors.thirdColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        final user = controller.users[index];
                        return Column(
                          children: [
                            const SizedBox(height: 6.0),
                            Card(
                                color: SocialMediaAppColors.fifthColorLightest,
                                elevation: 3,
                                child: InkWell(
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  SocialMediaAppColors
                                                      .thirdColorDark,
                                              child: Text(
                                                user.name?[0] ?? '',
                                                style: const TextStyle(
                                                  color:
                                                      SocialMediaAppColors.white,
                                                  fontFamily: Fonts.nunitoBold,
                                                  fontSize: Dimens.headline3,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const SizedBox(width: 10.0),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  user.name ?? "User not found",
                                                  style: const TextStyle(
                                                    fontSize: Dimens.body1,
                                                    fontFamily:
                                                        Fonts.nunitoMedium,
                                                    color: SocialMediaAppColors
                                                        .linearBlack,
                                                  ),
                                                ),
                                                Text(
                                                  user.username ??
                                                      "Username not found",
                                                  style: const TextStyle(
                                                    fontSize: Dimens.body2,
                                                    fontFamily:
                                                        Fonts.nunitoRegular,
                                                    color: SocialMediaAppColors
                                                        .linearBlack,
                                                  ),
                                                ),
                                                Text(
                                                  user.phone ?? "Phone not found",
                                                  style: const TextStyle(
                                                    fontSize: Dimens.body2,
                                                    fontFamily: Fonts.nunitoLight,
                                                    color: SocialMediaAppColors
                                                        .linearBlack,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () =>
                                              _showMyDialog(context, user),
                                          icon: const Icon(
                                            Icons.arrow_forward_ios,
                                            color: SocialMediaAppColors
                                                .thirdColorLightest,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () => _showMyDialog(context, user),
                                )

                                /*ListTile(
                                title: Text(user.name ?? "Name not found"),
                                subtitle: Text(user.email ?? "eMail not found"),
                              ),*/
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

  Future<void> _showMyDialog(BuildContext context, UserModel user) async {
    final userDetails = createUserDetails(user);

    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: SocialMediaAppColors.fifthColorLightest,
          title: const Text(
            'User Details',
            style: TextStyle(
              color: SocialMediaAppColors.thirdColor,
              fontFamily: Fonts.nunitoBold,
              fontSize: Dimens.headline2,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: userDetails.map((detail) {
              return Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: detail.label,
                      style: detail.labelStyle,
                    ),
                    TextSpan(
                      text: detail.value,
                      style: detail.valueStyle,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dialog'u kapatır
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
