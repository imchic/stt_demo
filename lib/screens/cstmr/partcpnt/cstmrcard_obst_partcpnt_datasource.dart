import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/cstmrcard_lad_partcpnt_datasource_model.dart';
import 'model/cstmrcard_obst_partcpnt_datasource_model.dart';

class CstmrcardObstPartcpntDatasource extends DataGridSource {
  CstmrcardObstPartcpntDatasource({required List<CstmrcardObstPartcpntDatasourceModel> items}) {
    _items = items
        .map<DataGridRow>((e) =>
        DataGridRow(cells: [
          DataGridCell<String>(columnName: 'lgdongNm', value: e.lgdongNm), // 법정동
          DataGridCell<String>(columnName: 'lcrtsDivCd', value: e.lcrtsDivNm), // 특지
          DataGridCell<String>(columnName: 'mlnoLtno', value: e.mlnoLtno), // 본번
          DataGridCell<String>(columnName: 'slnoLtno', value: e.slnoLtno), // 부번
          DataGridCell<String>(columnName: 'obstStrctStndrdInfo', value: e.obstStrctStndrdInfo), // 부번
          DataGridCell<String>(columnName: 'cmpnstnQtyAraVu', value: e.cmpnstnQtyAraVu), // 부번
          DataGridCell<String>(columnName: 'cmpnstnThingUnitDivNm', value: e.cmpnstnThingUnitDivNm), // 부번
          DataGridCell<String>(columnName: 'partcpntSeq', value: e.partcpntSeq.toString()), // 참여자
          DataGridCell<String>(columnName: 'cmpnstnPartcpntRsn', value: e.cmpnstnPartcpntRsn), // 참여자
          DataGridCell<String>(columnName: 'partcpntNm', value: e.partcpntNm), // 참여자
          DataGridCell<String>(columnName: 'partcpntAddr', value: e.partcpntAddr.toString()), // 참여자
          DataGridCell<String>(columnName: 'partcpntMbtlnum', value: e.partcpntMbtlnum.toString()), // 참여자

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
        child: AutoSizeText(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
      );
    }).toList());
  }
}