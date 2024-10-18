import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldm/screens/bsns/sqnc/model/bsns_accdtinvstg_sqnc_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/material.dart';

class BsnsAccdtinvstgSqncDatasource extends DataGridSource {
  BsnsAccdtinvstgSqncDatasource({required List<BsnsAccdtinvstgSqncModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
      // DataGridCell<int>(columnName: 'no', value: e.no),
      DataGridCell<String>(columnName: 'bsnsNo', value: e.bsnsNo),
      DataGridCell<num>(columnName: 'bsnsZoneNo', value: e.bsnsZoneNo),
      DataGridCell<num>(columnName: 'accdtInvstgSqnc', value: e.accdtInvstgSqnc),
      DataGridCell<String>(columnName: 'accdtInvstgNm', value: e.accdtInvstgNm),
      DataGridCell<String>(columnName: 'delYn', value: e.delYn),
      DataGridCell<String>(columnName: 'frstRgstrId', value: e.frstRgstrId),
      DataGridCell<String>(columnName: 'frstRegistDt', value: e.frstRegistDt),
      DataGridCell<String>(columnName: 'lastUpdusrId', value: e.lastUpdusrId),
      DataGridCell<String>(columnName: 'lastUpdtDt', value: e.lastUpdtDt),
      DataGridCell<String>(columnName: 'conectIp', value: e.conectIp),
    ]))
        .toList();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(color: Colors.white, cells: row.getCells().map<Widget>((dataGridCell) {

      // 차수에 스트링 더하기
      if(dataGridCell.columnName == 'accdtInvstgSqnc') {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(maxFontSize: 20, '${dataGridCell.value.toString()}차',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 30.sp, color: Color(0xFF1D56BC))),
        );

      } else if(dataGridCell.columnName == 'accdtInvstgNm') {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(fontSize: 30.sp)),
        );

      } else if(dataGridCell.columnName == 'accdtInvstgSqnc') {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(maxFontSize: 20, '${dataGridCell.value.toString()}차',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 30.sp, color: Color(0xFF1D56BC))),
        );

      } else if(dataGridCell.columnName == 'accdtInvstgNm') {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 30.sp)),
        );

      }else {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
        );
      }

    }).toList());
  }
}