import 'package:dateandtime1/provider/date_provider.dart';
import 'package:dateandtime1/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => DateProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) =>HomeScreen(),
        },
      ),
    ),
  );
}