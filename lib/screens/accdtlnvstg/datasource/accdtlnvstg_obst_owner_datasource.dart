import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldi/screens/accdtlnvstg/datasource/model/accdtlnvstg_obst_owner_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/accdtlnvstg_obst_model.dart';

/// [AccdtlnvstgLadDatasource] 는 [DataGridSource] 를 상속받아 구현한 데이터 소스 클래스이다.

class AccdtlnvstgObstOwnerDatasource extends DataGridSource {
  AccdtlnvstgObstOwnerDatasource({required List<AccdtlnvstgObstOwnerModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell(columnName: 'thingSerNo', value: e.thingSerNo),
      DataGridCell(columnName: 'ownerNo', value: e.ownerNo),
      DataGridCell(columnName: 'ownerNm', value: e.ownerNm),
      DataGridCell(columnName: 'posesnDivNm', value: e.posesnDivNm),
      DataGridCell(columnName: 'posesnShreDnmntrInfo', value: e.posesnShreDnmntrInfo),
      DataGridCell(columnName: 'posesnShreNmrtrInfo', value: e.posesnShreNmrtrInfo),
      DataGridCell(columnName: 'ownerRrnEnc', value: e.ownerRrnEnc),
      DataGridCell(columnName: 'ownerRgsbukAddr', value: e.ownerRgsbukAddr),
      DataGridCell(columnName: 'rgsbukZip', value: e.rgsbukZip),
      DataGridCell(columnName: 'ownerTelno', value: e.ownerTelno),
      DataGridCell(columnName: 'ownerMbtlnum', value: e.ownerMbtlnum),
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
        child: Text(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
      );
    }).toList());
  }
}