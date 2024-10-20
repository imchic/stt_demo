import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldm/screens/useprmisn/model/use_prmisn_cancl_aprv_model.dart';
import 'package:ldm/utils/common_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/use_prmisn_cancl_aprv_detail_model.dart';
import 'model/use_prmisn_cancl_aprv_doc_model.dart';

class UsePrmisnCanclAprvDocModelDataSource extends DataGridSource {
  UsePrmisnCanclAprvDocModelDataSource(
      {required List<UsePrmisnCanclAprvDocModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'sanctnDocNo', value: e.sanctnDocNo ?? ''),
      DataGridCell<String>(columnName: 'sanctnDocNm', value: e.sanctnDocNm ?? ''),
    ]))
        .toList();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: Colors.white,
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
          );
        }).toList());
  }

}