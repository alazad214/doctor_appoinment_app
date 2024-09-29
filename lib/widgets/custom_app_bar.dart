import 'package:doctor_appointment/utils/app_icon.dart';
import 'package:doctor_appointment/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../app/modules/search/views/search_screen.dart';
import '../utils/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          Image.asset(AppImage.appLogo, height: 50),
          const Spacer(),
          IconButton(
            onPressed: () => Get.to(() => const SearchScreen()),
            icon: SvgPicture.asset(searchIcon, color: primaryColor),
          ),
        ],
      ),
    );
  }
}
