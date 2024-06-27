import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiTempScreen extends StatefulWidget {
  const UiTempScreen({super.key});

  @override
  State<UiTempScreen> createState() => _UiTempScreenState();
}

class _UiTempScreenState extends State<UiTempScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UiTempScreen', style: TextStyle(fontSize: 16.sp)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(

              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/second');
              },
              child: Text('Launch screen', style: TextStyle(fontSize: 16.sp)),
            ),
          ],
        ),
      ),
    );
  }
}
