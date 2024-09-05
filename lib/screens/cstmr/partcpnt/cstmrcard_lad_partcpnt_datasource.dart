import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/cstmrcard_lad_partcpnt_datasource_model.dart';

class CstmrcardLadPartcpntDatasource extends DataGridSource {
  CstmrcardLadPartcpntDatasource({required List<CstmrcardLadPartcpntDatasourceModel> items}) {
    _items = items
        .map<DataGridRow>((e) =>
        DataGridRow(cells: [
          DataGridCell<String>(columnName: 'lgdongNm', value: e.lgdongNm), // 법정동
          DataGridCell<String>(columnName: 'lcrtsDivNm', value: e.lcrtsDivNm), // 특지
          DataGridCell<String>(columnName: 'mlnoLtno', value: e.mlnoLtno), // 본번
          DataGridCell<String>(columnName: 'slnoLtno', value: e.slnoLtno), // 부번
          DataGridCell<String>(columnName: 'acqsPrpDivNm', value: e.acqsPrpDivNm), // 부번
          // 지목
          DataGridCell<String>(columnName: 'ofcbkLndcgrDivNm', value: e.ofcbkLndcgrDivNm), // 공부지목
          DataGridCell<String>(columnName: 'sttusLndcgrDivNm', value: e.sttusLndcgrDivNm), // 현황지목
          // 면적
          DataGridCell<String>(columnName: 'ofcbkAra', value: e.ofcbkAra.toString()), // 공부
          DataGridCell<String>(columnName: 'incrprAra', value: e.incrprAra.toString()), // 편입
          DataGridCell<String>(columnName: 'cmpnstnInvstgAra', value: e.cmpnstnInvstgAra.toString()), // 보상

          DataGridCell<String>(columnName: 'posesnShreNmrtrInfo', value: e.posesnShreNmrtrInfo), // 지분분자
          DataGridCell<String>(columnName: 'posesnShreDnmntrInfo', value: e.posesnShreDnmntrInfo), // 지분분모
          DataGridCell<String>(columnName: 'partcpntSeq', value: e.partcpntSeq.toString()),
          DataGridCell<String>(columnName: 'cmpnstnPartcpntRsn', value: e.cmpnstnPartcpntRsn),
          DataGridCell<String>(columnName: 'partcpntNm', value: e.partcpntNm),
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

      if (dataGridCell.columnName == 'accdtInvstgSqnc') {
        return Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          child: Center(child: AutoSizeText(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp, color: Color(0xFF1D56BC)))),
        );
      }

      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: AutoSizeText(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
      );
    }).toList());
  }
}