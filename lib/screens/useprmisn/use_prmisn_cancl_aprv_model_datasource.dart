import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldm/screens/useprmisn/model/use_prmisn_cancl_aprv_model.dart';
import 'package:ldm/utils/common_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class UsePrmisnCanclAprvModelDataSource extends DataGridSource {
  UsePrmisnCanclAprvModelDataSource(
      {required List<UsePrmisnCanclAprvModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'plotUseNo', value: e.plotUseNo),
      DataGridCell<String>(columnName: 'applcntNm', value: e.applcntNm),
      DataGridCell<String>(columnName: 'applcntAddr', value: e.applcntAddr),
      DataGridCell<String>(columnName: 'applcntTelno', value: e.applcntTelno),
      DataGridCell<String>(columnName: 'applcntMbtlnum', value: e.applcntMbtlnum),
    ]))
        .toList();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: Colors.white,
        cells: row.getCells().map<Widget>((dataGridCell) {

          if(dataGridCell.columnName == 'applcntNm') {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, maxLines: 3, style: TextStyle(fontSize: 30.sp)),
            );
          }

          if(dataGridCell.columnName == 'applcntAddr') {
            return Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, maxLines: 3, style: TextStyle(fontSize: 30.sp)),
            );
          }

          if(dataGridCell.columnName == 'applcntTelno' || dataGridCell.columnName == 'applcntMbtlnum') {
            return Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(maxFontSize: 20, CommonUtil.phoneHyphen(dataGridCell.value.toString()), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
            );
          }

          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
          );
        }).toList());
  }

}