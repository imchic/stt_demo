import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldm/screens/wtwkAccdtInvstg/model/wtwkAccdtInvstg_model.dart';
import 'package:ldm/utils/common_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class WtwkAccdtinvstgModelDatasource extends DataGridSource {
  WtwkAccdtinvstgModelDatasource(
      {required List<WtwkaccdtinvstgModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'usePurpsLclsCd', value: e.usePurpsLclsCd ?? ''),
      DataGridCell<String>(columnName: 'squatAra', value: e.squatAra.toString() ?? ''),
      DataGridCell<String>(columnName: 'dtlDtls', value: e.dtlDtls.toString() ?? ''),
      DataGridCell<String>(columnName: 'referMtt', value: e.referMtt.toString() ?? ''),
      DataGridCell<String>(columnName: 'etcMtt', value: e.etcMtt.toString() ?? ''),
      DataGridCell<String>(columnName: 'possesnStrtDe', value: e.possesnStrtDe.toString() ?? ''),
      DataGridCell<String>(columnName: 'possesnEndDe', value: e.possesnEndDe.toString() ?? ''),
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

          if (dataGridCell.columnName == 'dtlDtls'){
            return Container(
              height: 500.h,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(maxFontSize: 20, CommonUtil.convertToDateTime(dataGridCell.value.toString()), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
            );
          }
          
          if (dataGridCell.columnName == 'possesnStrtDe' || dataGridCell.columnName == 'possesnEndDe') {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(maxFontSize: 20, CommonUtil.convertToDateTime(dataGridCell.value.toString()), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
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