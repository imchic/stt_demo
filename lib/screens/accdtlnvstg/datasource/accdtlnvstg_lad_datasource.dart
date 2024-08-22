import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/accdtlnvstg_lad_model.dart';

/// [AccdtlnvstgLadDatasource] 는 [DataGridSource] 를 상속받아 구현한 데이터 소스 클래스이다.

class AccdtlnvstgLadDatasource extends DataGridSource {
  AccdtlnvstgLadDatasource({required List<AccdtlnvstgLadModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'col1', value: e.col1),
              DataGridCell<String>(columnName: 'col2', value: e.col2),
              DataGridCell<String>(columnName: 'col3', value: e.col3),
              DataGridCell<String>(columnName: 'col4', value: e.col4),
              DataGridCell<String>(columnName: 'col5', value: e.col5),
              DataGridCell<String>(columnName: 'col6', value: e.col6),
              DataGridCell<String>(columnName: 'col7', value: e.col7),
              DataGridCell<String>(columnName: 'col8', value: e.col8),
              DataGridCell<String>(columnName: 'col9', value: e.col9),
              DataGridCell<String>(columnName: 'col10', value: e.col10),
              DataGridCell<String>(columnName: 'col11', value: e.col11),
              DataGridCell<String>(columnName: 'col12', value: e.col12),
              DataGridCell<String>(columnName: 'col13', value: e.col13),
              DataGridCell<String>(columnName: 'col14', value: e.col14),
              DataGridCell<String>(columnName: 'col15', value: e.col15),
              DataGridCell<String>(columnName: 'col16', value: e.col16),
              DataGridCell<String>(columnName: 'col17', value: e.col17),
            ]))
        .toList();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(color: Colors.white, cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: AutoSizeText(dataGridCell.value.toString(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.sp)),
          );
    }).toList());
  }
}