import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('info_title'.tr),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              Divider(color: Colors.grey),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'app_title'.tr,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.cyan),
                    ),
                    SizedBox(height: 24),
                    Text('info_text1'.tr + ': 18/11/2021'),
                    SizedBox(height: 24),
                    Text('info_text2'.tr),
                    SizedBox(height: 8),
                    Text('Franco Saravia Tavares'),
                    SizedBox(height: 24),
                    Text('info_text3'.tr),
                    SizedBox(height: 12),
                    Image.asset('lib/assets/images/flutter_logo_grey.png')
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(color: Colors.grey),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
