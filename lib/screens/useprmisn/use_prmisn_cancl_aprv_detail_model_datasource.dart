import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldi/screens/useprmisn/model/use_prmisn_cancl_aprv_model.dart';
import 'package:ldi/utils/common_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/use_prmisn_cancl_aprv_detail_model.dart';

class UsePrmisnCanclAprvDetailModelDataSource extends DataGridSource {
  UsePrmisnCanclAprvDetailModelDataSource(
      {required List<UsePrmisnCanclAprvDetailModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'usePrmisnPurpsSclsCd', value: e.usePrmisnPurpsSclsCd),
      DataGridCell<String>(columnName: 'prmisnRqstAra', value: e.prmisnRqstAra.toString()),
      DataGridCell<String>(columnName: 'useAprvAra', value: e.useAprvAra.toString()),
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