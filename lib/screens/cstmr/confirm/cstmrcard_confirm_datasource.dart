import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldi/screens/cstmr/lwst/model/cstmrcard_lad_lwst_datasource_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/cstmrcard_confirm_datasource_model.dart';

class CstmrcardConfirmDatasource extends DataGridSource {
  CstmrcardConfirmDatasource({required List<CstmrcardConfirmDatasourceModel> items}) {
    _items = items
        .map<DataGridRow>((e) =>
        DataGridRow(cells: [
          DataGridCell<String>(columnName: 'issNo', value: e.issNo),
          DataGridCell<String>(columnName: 'isuDt', value: e.isuDt.toString()),
          DataGridCell<String>(columnName: 'bondIsuDe', value: e.bondIsuDe),
          DataGridCell<String>(columnName: 'prchasCnfrmnIsuDivNm', value: e.prchasCnfrmnIsuDivNm),
          DataGridCell<String>(columnName: 'pymntSumAmt', value: e.pymntSumAmt),
          DataGridCell<String>(columnName: 'prchasCnfrmnIssAmt', value: e.prchasCnfrmnIssAmt),
          DataGridCell<String>(columnName: 'delamt', value: e.delamt.toString()),
          DataGridCell<String>(columnName: 'janamt', value: e.janamt.toString()),
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