import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleTile extends StatelessWidget {
  final Map locale;
  final Future<void> Function(Locale locale) updateLocale;

  const LocaleTile({required this.locale, required this.updateLocale});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: InkWell(
        splashColor: Colors.cyan.withOpacity(0.3),
        onTap: () async {
          Get.back();
          await updateLocale(locale['locale']);
        },
        child: Padding(
          padding: EdgeInsets.only(top: 16, right: 16, bottom: 16, left: 24),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(child: Icon(Icons.language_rounded, size: 25)),
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  '${locale['name']}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
