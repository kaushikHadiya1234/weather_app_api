import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() => Navigator.pushReplacementNamed(context, 'home'),);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff6EF7E6),
        body: Column(
          children: [
            Image.asset('assets/images/splace.png'),
            Text("Weather",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 5.h,color: Colors.white54),)
          ],
        ),
      ),
    );
  }
}
