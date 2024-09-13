import 'package:flutter/material.dart';
import 'package:social_media_app/data/model/user_model/user_model.dart';
import '../assets/colors.dart';
import '../assets/dimens.dart';
import '../assets/fonts.dart';

//User sayfasinda alertDialog icerisindeki degerleri toplu bir sekilde
//aldigimiz yer
class UserDetailsTextWidget {
  final String label;
  final String? value;
  final TextStyle labelStyle;
  final TextStyle valueStyle;

  UserDetailsTextWidget({
    required this.label,
    this.value,
    required this.labelStyle,
    required this.valueStyle,
  });
}

List<UserDetailsTextWidget> createUserDetails(UserModel user) {
  return [
    UserDetailsTextWidget(
      label: "Name: ",
      value: user.name ?? "Username not found",
      labelStyle: const TextStyle(
        color: SocialMediaAppColors.linearBlack,
        fontFamily: Fonts.nunitoBold,
        fontSize: Dimens.body1,
      ),
      valueStyle: const TextStyle(
        color: SocialMediaAppColors.linearBlack,
        fontFamily: Fonts.nunitoRegular,
        fontSize: Dimens.body1,
      ),
    ),
    UserDetailsTextWidget(
      label: "UserName: ",
      value: user.username ?? "Website not found",
      labelStyle: const TextStyle(
        color: SocialMediaAppColors.linearBlack,
        fontFamily: Fonts.nunitoBold,
        fontSize: Dimens.body1,
      ),
      valueStyle: const TextStyle(
        color: SocialMediaAppColors.linearBlack,
        fontFamily: Fonts.nunitoRegular,
        fontSize: Dimens.body1,
      ),
    ),
    UserDetailsTextWidget(
      label: "Phone Number: ",
      value: user.phone ?? "Username not found",
      labelStyle: const TextStyle(
        color: SocialMediaAppColors.linearBlack,
        fontFamily: Fonts.nunitoBold,
        fontSize: Dimens.body1,
      ),
      valueStyle: const TextStyle(
        color: SocialMediaAppColors.linearBlack,
        fontFamily: Fonts.nunitoRegular,
        fontSize: Dimens.body1,
      ),
    ),
    UserDetailsTextWidget(
      label: "E-mail: ",
      value: user.email ?? "Username not found",
      labelStyle: const TextStyle(
        color: SocialMediaAppColors.linearBlack,
        fontFamily: Fonts.nunitoBold,
        fontSize: Dimens.body1,
      ),
      valueStyle: const TextStyle(
        color: SocialMediaAppColors.linearBlack,
        fontFamily: Fonts.nunitoRegular,
        fontSize: Dimens.body1,
      ),
    ),
    UserDetailsTextWidget(
      label: "Address: ",
      value: '\n Street: ${user.address?.street ?? "Street not found"}\n'
          ' Suite: ${user.address?.suite ?? "Suite not found"}\n'
          ' City: ${user.address?.city ?? "City not found"}\n'
          ' ZipCode: ${user.address?.zipcode ?? "Zipcode not found"}',
      labelStyle: const TextStyle(
        color: SocialMediaAppColors.linearBlack,
        fontFamily: Fonts.nunitoBold,
        fontSize: Dimens.body1,
      ),
      valueStyle: const TextStyle(
        color: SocialMediaAppColors.linearBlack,
        fontFamily: Fonts.nunitoRegular,
        fontSize: Dimens.body1,
      ),
    ),
    UserDetailsTextWidget(
      label: "Company ",
      value: '\n${user.company?.name ?? "Name not found"}\n'
          '${user.company?.bs ?? "Bs not found"}\n',
      labelStyle: const TextStyle(
        color: SocialMediaAppColors.linearBlack,
        fontFamily: Fonts.nunitoBold,
        fontSize: Dimens.body1,
      ),
      valueStyle: const TextStyle(
        color: SocialMediaAppColors.linearBlack,
        fontFamily: Fonts.nunitoRegular,
        fontSize: Dimens.body1,
      ),
    ),
  ];
}
