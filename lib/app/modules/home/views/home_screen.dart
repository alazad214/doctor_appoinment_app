import 'package:doctor_appointment/app/modules/article/views/article_card.dart';
import 'package:doctor_appointment/app/modules/home/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utils/app_icon.dart';
import '../../../../utils/constants.dart';
import '../../search/views/search_screen.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/app_image.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../components/available_doctors.dart';
import '../../category/components/categories.dart';
import '../components/banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Aroggo Talk'),
        backgroundColor: Colors.transparent,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                fit: StackFit.expand,
                children: [
                  SvgPicture.asset(
                    AppImage.appBg,
                    fit: BoxFit.cover,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const CustomAppBar(),
                        const BannerCard(),
                        const Categories(),
                        AvailableDoctors(),
                        const ArticleCard(),
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
