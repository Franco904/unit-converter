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
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),
              const Divider(color: Colors.grey),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'app_title'.tr,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.cyan),
                    ),
                    const SizedBox(height: 24),
                    Text('info_text1'.tr + ': 18/11/2021'),
                    const SizedBox(height: 24),
                    Text('info_text2'.tr),
                    const SizedBox(height: 8),
                    const Text('Franco Saravia Tavares'),
                    const SizedBox(height: 24),
                    Text('info_text3'.tr),
                    const SizedBox(height: 12),
                    Image.asset('./lib/assets/images/flutter_logo_grey.png')
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Colors.grey),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
