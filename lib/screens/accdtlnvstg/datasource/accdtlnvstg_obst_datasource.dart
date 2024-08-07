import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/accdtlnvstg_lad_model.dart';
import 'model/accdtlnvstg_obst_model.dart';

/// [AccdtlnvstgLadDatasource] 는 [DataGridSource] 를 상속받아 구현한 데이터 소스 클래스이다.

class AccdtlnvstgObstDatasource extends DataGridSource {
  AccdtlnvstgObstDatasource({required List<AccdtlnvstgObstModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
            DataGridCell(columnName: 'obstSeq', value: e.obstSeq),
            DataGridCell(columnName: 'obstDivCd', value: e.obstDivCd),
            DataGridCell(columnName: 'cmpnstnThingKndDtls', value: e.cmpnstnThingKndDtls),
            DataGridCell(columnName: 'obstStrctStndrdInfo', value: e.obstStrctStndrdInfo),
            DataGridCell(columnName: 'cmpnstnQtyAraVu', value: e.cmpnstnQtyAraVu),
            DataGridCell(columnName: 'cmpnstnThingUnitDivCd', value: e.cmpnstnThingUnitDivCd),
            DataGridCell(columnName: 'invstrEmpNo', value: e.invstrEmpNo),
            DataGridCell(columnName: 'invstrJgrdNm', value: e.invstrJgrdNm),
            DataGridCell(columnName: 'invstrNm', value: e.invstrNm),
            DataGridCell(columnName: 'obsrverNm', value: e.obsrverNm),
            DataGridCell(columnName: 'accdtInvstgObsrverAddr', value: e.accdtInvstgObsrverAddr),
            DataGridCell(columnName: 'acddtInvstgSqnc', value: e.acddtInvstgSqnc),
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
    return DataGridRowAdapter(cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.sp)),
      );
    }).toList());
  }
}