import 'package:flutter/material.dart';
import 'package:tutorial_inicial/app/category_list/category_list.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 70),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome to',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Unit Converter',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.cyan),
                ),
              ),
              SizedBox(height: 32),
              SizedBox(height: 300, width: 300),
              SizedBox(height: 32),
              ElevatedButton(
                  onPressed: () => _toCategoryRoute(context),
                  style: ElevatedButton.styleFrom(primary: Colors.cyan[600], textStyle: TextStyle(fontSize: 18)),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, right: 30, bottom: 10, left: 30),
                    child: Text(
                      'Start',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // Navega para CategoryRoute
  void _toCategoryRoute(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryList()),
    );
  }
}
