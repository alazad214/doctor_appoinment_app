import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: h * 0.03,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('privacy_policy')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: CircularProgressIndicator());
            }

            final data = snapshot.data!.docs;
            return Stack(
              children: [
                ///Top and bottom color circle design...
                bgCircle(w, h),
                SingleChildScrollView(
                  padding: EdgeInsets.all(w * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < data.length; i++)
                        Text('''${data[i]['policy']} ?? "" '''),
                      SizedBox(height: h * 0.05),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget bgCircle(double w, double h) {
    return Stack(
      children: [
        Positioned(
          top: -h * 0.15,
          left: -w * 0.3,
          child: CircleAvatar(
            radius: w * 0.4,
            backgroundColor: Colors.blueAccent.withOpacity(0.1),
          ),
        ),
        Positioned(
          bottom: -h * 0.2,
          right: -w * 0.25,
          child: CircleAvatar(
            radius: w * 0.35,
            backgroundColor: Colors.blueAccent.withOpacity(0.1),
          ),
        ),
      ],
    );
  }
}
