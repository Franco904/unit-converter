// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24),
              Divider(height: 50, color: Colors.grey),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [ 
                    Text('Unit Converter', style: 
                      TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan
                      ),
                    ),
                    SizedBox(height: 24),
                    Text('Last update: 18/11/2021'),
                    SizedBox(height: 24),
                    Text('Developed by'),
                    SizedBox(height: 8),
                    Text('Franco Saravia Tavares'),
                    SizedBox(height: 24),
                    Text('With:'),
                    SizedBox(height: 12),
                    Image.asset('lib/assets/images/flutter_logo_grey.png')
                  ],
                ),
              ),
              Divider(height: 50, color: Colors.grey)
            ],
          ),
        ),
      ),
    );
  }
}
