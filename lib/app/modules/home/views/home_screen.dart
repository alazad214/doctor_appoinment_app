import 'package:doctor_appointment/app/modules/article/views/article_card.dart';
import 'package:doctor_appointment/app/modules/home/components/drawer.dart';
import 'package:doctor_appointment/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utils/app_icon.dart';
import '../../../../utils/constants.dart';
import '../../search/views/search_screen.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/app_image.dart';
import '../components/available_doctors.dart';
import '../../category/components/categories.dart';
import '../components/banner.dart';

class HomePage extends StatelessWidget {
  final Function doctorSeeMore;
  final Function healthSeeMore;
  const HomePage({
    super.key,
    required this.doctorSeeMore,
    required this.healthSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          'Aroggo Talk',
          style: TextStyle(
              color: AppColors.c000000,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const SearchScreen()),
            icon: SvgPicture.asset(
              searchIcon,
              colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: Get.height / 1,
                    width: Get.width / 1,
                    child: SvgPicture.asset(
                      AppImage.appBg,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        const BannerCard(),
                        const Categories(),
                        AvailableDoctors(
                          doctorSeeMore: doctorSeeMore,
                        ),
                        ArticleCard(
                          healthSeeMore: healthSeeMore,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
