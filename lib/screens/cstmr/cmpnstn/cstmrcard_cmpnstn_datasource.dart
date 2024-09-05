import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/cstmrcard_cmpnstn_datasource_model.dart';

class CstmrcardCmpnstnDatasource extends DataGridSource {
  CstmrcardCmpnstnDatasource({required List<CstmrcardCmpnstnDatasourceModel> items}) {
    _items = items
        .map<DataGridRow>((e) =>
        DataGridRow(cells: [
          //DataGridCell<String>(columnName: 'bsnsNo', value: e.bsnsNo),
          //DataGridCell<String>(columnName: 'bsnsZoneNo', value: e.bsnsZoneNo.toString()),
          //DataGridCell<String>(columnName: 'ownerNo', value: e.ownerNo),
          DataGridCell<String>(columnName: 'sbmtDe', value: e.sbmtDe), // 요청일자
          DataGridCell<String>(columnName: 'sanctnTit', value: e.sanctnTit), // 요청내역
          DataGridCell<String>(columnName: 'cmpnstnDscssSqnc', value: e.cmpnstnDscssSqnc), // 협의차수
          DataGridCell<String>(columnName: 'dscssMthDc', value: e.dscssMthDc.toString()), // 협의방법
          DataGridCell<String>(columnName: 'cmpnstnDscssPdInfo', value: e.cmpnstnDscssPdInfo.toString()), // 협의기간
          DataGridCell<String>(columnName: 'cmpnstnDscssPlaceDtls', value: e.cmpnstnDscssPlaceDtls.toString()), // 협의장소
          DataGridCell<String>(columnName: 'cmpnstnEraMthPrcdrCtnt', value: e.cmpnstnEraMthPrcdrCtnt.toString()), // 보상시기방법과절차

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