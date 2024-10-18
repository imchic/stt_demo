import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldm/screens/wtwkAccdtInvstg/model/wtwkAccdtInvstg_model.dart';
import 'package:ldm/utils/common_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/wtwkAccdtlnvstg_thing_model.dart';

class WtwkaccdtinvstgThingModelDatasource extends DataGridSource {
  WtwkaccdtinvstgThingModelDatasource(
      {required List<WtwkaccdtinvstgThingModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'instDe', value: e.instDe),
      DataGridCell<String>(columnName: 'instThingStndrdInfo', value: e.instThingStndrdInfo),
      DataGridCell<String>(columnName: 'pdm', value: e.pdm),
      DataGridCell<String>(columnName: 'instWidthLcNo', value: e.instWidthLcNo),
      DataGridCell<String>(columnName: 'instHighLcNo', value: e.instHighLcNo),
      DataGridCell<String>(columnName: 'instThingLt', value: e.instThingLt),
      DataGridCell<String>(columnName: 'rlwayNm', value: e.rlwayNm),
      DataGridCell<String>(columnName: 'gisRefrnKeyInfo', value: e.gisRefrnKeyInfo),
      DataGridCell<String>(columnName: 'drwDc', value: e.drwDc),
      DataGridCell<String>(columnName: 'instThingRm', value: e.instThingRm),

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

          // if (dataGridCell.columnName == 'dtlDtls'){
          //   return Container(
          //     height: 500.h,
          //     alignment: Alignment.center,
          //     padding: const EdgeInsets.all(8.0),
          //     child: AutoSizeText(maxFontSize: 20, CommonUtil.convertToDateTime(dataGridCell.value.toString()), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
          //   );
          // }
          //
          // if (dataGridCell.columnName == 'possesnStrtDe' || dataGridCell.columnName == 'possesnEndDe') {
          //   return Container(
          //     alignment: Alignment.center,
          //     padding: const EdgeInsets.all(8.0),
          //     child: AutoSizeText(maxFontSize: 20, CommonUtil.convertToDateTime(dataGridCell.value.toString()), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
          //   );
          // }
          
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
          );
        }).toList());
  }

}