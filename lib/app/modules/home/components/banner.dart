import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/app/modules/home/components/banner_dialog.dart';
import 'package:doctor_appointment/utils/constants.dart';
import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('banner').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final banner = snapshot.data!.docs;
          return AspectRatio(
            aspectRatio: 2.5,
            child: PageView.builder(
                controller:
                    PageController(viewportFraction: 0.88, initialPage: 2),
                itemCount: banner.length,
                itemBuilder: (context, index) {
                  final data = banner[index];
                  return GestureDetector(
                    onTap: () {
                      bannerDialog(
                          context,
                          Image.network(
                            data['image'],
                            fit: BoxFit.cover,
                          ),
                          data['description']);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Card(
                        color: Colors.white,
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(data['image']),
                                    fit: BoxFit.cover)),
                            child: Container(
                                color: Colors.white38,
                                alignment: Alignment.bottomLeft,
                                padding: const EdgeInsets.all(10),
                                child: Text(data['title'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: textColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700)))),
                      ),
                    ),
                  );
                }),
          );
        });
  }
}
