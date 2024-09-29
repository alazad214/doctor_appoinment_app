import 'package:flutter/material.dart';
import '../../../../utils/constants.dart';
import '../../home/components/available_doctors.dart';

class ArticleDetails extends StatelessWidget {
  final blog;
  const ArticleDetails({super.key, this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          blog['title'],
          style: const TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              child: Image.network(blog['image'], fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 5),
            Text(
              blog['description'],
            ),
            const SizedBox(height: 20),
            const AvailableDoctors(),
          ],
        ),
      ),
    );
  }
}
