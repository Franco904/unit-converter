// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tutorial_inicial/app/category/category_route.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey),
                ),
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Unit Converter',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan),
                ),
              ),
              SizedBox(height: 50),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [ 
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ]
                ),
                child: TextButton(
                  onPressed: () => _toCategoryRoute(context),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      textStyle: TextStyle(fontSize: 18)),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Start converting',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ),
              ),
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
      MaterialPageRoute(builder: (context) => CategoryRoute()),
    );
  }
}
