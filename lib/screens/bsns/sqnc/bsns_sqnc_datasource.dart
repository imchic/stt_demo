import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/bsns_sqnc_datasource_model.dart';

class BsnsSqncDatasource extends DataGridSource {
  BsnsSqncDatasource({required List<BsnsSqncDatasourceModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'no', value: e.no),
              DataGridCell<int>(columnName: 'bsnsSqnc', value: e.bsnsSqnc),
              DataGridCell<String>(columnName: 'bsnsStrtDe', value: e.bsnsStrtDe),
              DataGridCell<String>(columnName: 'bsnsEndDe', value: e.bsnsEndDe),
            ]))
        .toList();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: row.getCells().map<Widget>((dataGridCell) {

      // 차수에 스트링 더하기
      if(dataGridCell.columnName == 'bsnsSqnc') {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text('${dataGridCell.value.toString()}차', overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.sp)),
        );
      }

      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.sp)),
      );
    }).toList());
  }
}