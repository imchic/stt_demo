import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/common_util.dart';

/// [ConvertDatetimeText] String을 DateTime으로 변환하여 yyyy-MM-dd 형식으로 출력
/// [value] is the value to be converted.

class ConvertDatetimeText extends StatefulWidget {
  final String? value;

  ConvertDatetimeText({Key? key, this.value}) : super(key: key);

  @override
  State<ConvertDatetimeText> createState() => _ConvertDatetimeTextState();
}

class _ConvertDatetimeTextState extends State<ConvertDatetimeText> {
  @override
  Widget build(BuildContext context) {
    return widget.value == null
        ? Text('-',
            style: TextStyle(
              color: Color(0xFF555555),
              fontSize: 1.w > 1.h ? 30.sp : 50.sp,
              fontWeight: FontWeight.w400,
            ))
        : Text(
            CommonUtil.formatDate(DateTime.parse(widget.value!)),
            style: TextStyle(
              color: Color(0xFF555555),
              fontSize: 1.w > 1.h ? 30.sp : 50.sp,
              fontWeight: FontWeight.w400,
            ),
          );
  }
}
