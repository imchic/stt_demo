import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldi/screens/bsns/bsns_controller.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../utils/colors.dart';

class CustomGridColumn {
  static List<GridColumn> getColumns(List<String> columns) {
    return columns
        .map((e) => GridColumn(
              columnName: e,
              label: Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                //color: CustomColors.primaryColor,
                child: Text(
                  e,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ))
        .toList();
  }
}
