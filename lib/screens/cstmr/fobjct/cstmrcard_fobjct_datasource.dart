import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldi/screens/cstmr/fobjct/model/cstmrcard_fobject_datasource_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CstmrcardFobjctDatasource extends DataGridSource {
  CstmrcardFobjctDatasource({required List<CstmrcardFobjectDatasourceModel> items}) {
    _items = items
        .map<DataGridRow>((e) =>
        DataGridRow(cells: [
          DataGridCell<String>(columnName: 'rqstDe', value: e.rqstDe.toString()),
          DataGridCell<String>(columnName: 'fobjctPrgstsDivNm', value: e.fobjctPrgstsDivNm.toString()),
          DataGridCell<String>(columnName: 'applcntNm', value: e.applcntNm),
          DataGridCell<String>(columnName: 'applcntTelno', value: e.applcntTelno),
          DataGridCell<String>(columnName: 'fobjctApplcntRelInfo', value: e.fobjctApplcntRelInfo),
          DataGridCell<String>(columnName: 'objcRqstDtls', value: e.objcRqstDtls),
          DataGridCell<String>(columnName: 'actnDtls', value: e.actnDtls.toString()),
          DataGridCell<String>(columnName: 'actnDt', value: e.actnDt.toString()),
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