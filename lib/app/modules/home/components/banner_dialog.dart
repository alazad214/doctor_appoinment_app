import 'package:flutter/material.dart';

void bannerDialog(
  BuildContext context,
  Widget child,
  String description,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 20,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.lightBlue.shade300),
                  child: child,
                ),
                const SizedBox(height: 15),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text(
                        'back',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
