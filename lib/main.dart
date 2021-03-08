import 'package:flutter/material.dart';
import 'package:newspaper_app/views/homepage.dart';

void main() =>
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

    initialRoute:  '/',
    routes: {

      '/': (contex) => HomePage(),

    },
  ));

