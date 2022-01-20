import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleTile extends StatelessWidget {
  final Map locale;
  final void Function(Locale locale) updateLocale;

  const LocaleTile({required this.locale, required this.updateLocale});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 55,
        child: InkWell(
          highlightColor: Colors.grey[300],
          splashColor: Colors.grey[350],
          onTap: () {
            Get.back();
            updateLocale(locale['locale']);
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
      ),
    );
  }
}
