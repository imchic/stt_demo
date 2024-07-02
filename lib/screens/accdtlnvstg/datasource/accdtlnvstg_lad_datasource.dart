import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/accdtlnvstg_lad_model.dart';

/// [AccdtlnvstgLadDatasource] 는 [DataGridSource] 를 상속받아 구현한 데이터 소스 클래스이다.

class AccdtlnvstgLadDatasource extends DataGridSource {
  AccdtlnvstgLadDatasource({required List<AccdtlnvstgLadModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'surveyDate', value: e.surveyDate),
              DataGridCell<String>(columnName: 'surveyOrder', value: e.surveyOrder),
              DataGridCell<String>(columnName: 'location', value: e.location),
              DataGridCell<String>(columnName: 'mainNumber', value: e.mainNumber),
              DataGridCell<String>(columnName: 'subNumber', value: e.subNumber),
              DataGridCell<String>(columnName: 'publicLandType', value: e.publicLandType),
            ]))
        .toList();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.sp)),
      );
    }).toList());
  }
}