import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/accdtlnvstg_obst_model.dart';

/// [AccdtlnvstgLadDatasource] 는 [DataGridSource] 를 상속받아 구현한 데이터 소스 클래스이다.

class AccdtlnvstgObstDatasource extends DataGridSource {
  AccdtlnvstgObstDatasource({required List<AccdtlnvstgObstModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
            DataGridCell(columnName: 'thingSerNo', value: e.thingSerNo),
            DataGridCell(columnName: 'cmpnstnObstNo', value: e.cmpnstnObstNo),
            DataGridCell(columnName: 'obstDivNm', value: e.obstDivNm),
            DataGridCell(columnName: 'cmpnstnThingKndDtls', value: e.cmpnstnThingKndDtls),
            DataGridCell(columnName: 'obstStrctStndrdInfo', value: e.obstStrctStndrdInfo),
            DataGridCell(columnName: 'cmpnstnQtyAraVu', value: e.cmpnstnQtyAraVu),
            DataGridCell(columnName: 'cmpnstnThingUnitDivNm', value: e.cmpnstnThingUnitDivNm),
            DataGridCell(columnName: 'lgdongNm', value: e.lgdongNm),
            DataGridCell(columnName: 'accdtInvstgSqnc', value: e.accdtInvstgSqnc),
            DataGridCell(columnName: 'invstgDt', value: e.invstgDt),
            DataGridCell(columnName: 'spcitm', value: e.spcitm),
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
        child: Text(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
      );
    }).toList());
  }
}