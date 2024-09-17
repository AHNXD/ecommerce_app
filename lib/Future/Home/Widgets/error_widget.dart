import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key, required this.msg, required this.onPressed});
  final String msg;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(msg),
            TextButton(
                onPressed: onPressed,
                child: Text(
                  'Try Again',
                  style: TextStyle(color: Colors.black, fontSize: 12.sp),
                ))
          ]),
    );
  }
}
