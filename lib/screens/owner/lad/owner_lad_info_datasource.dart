import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/owner_lad_info_datasource_model.dart';

/// TM_LP20210 (LP_실태조사토지정보)
///
/// LP_실태조사토지정보 그리드 데이터소스


class OwnerLadInfoDatasource extends DataGridSource {
  OwnerLadInfoDatasource({required List<OwnerLadInfoDatasourceModel> items}) {
    _items = items
        .map<DataGridRow>((e) =>
        DataGridRow(cells: [
          DataGridCell<String>(columnName: 'lgdongNm', value: e.lgdongNm),
          DataGridCell<String>(columnName: 'lcrtsDivCd', value: e.lcrtsDivCd),
          DataGridCell<String>(columnName: 'mlnoLtno', value: e.mlnoLtno),
          DataGridCell<String>(columnName: 'slnoLtno', value: e.slnoLtno),
          DataGridCell<String>(columnName: 'ofcbkLndcgrDivCd', value: e.ofcbkLndcgrDivCd),
          DataGridCell<String>(columnName: 'sttusLndcgrDivCd', value: e.sttusLndcgrDivCd),
          DataGridCell<int>(columnName: 'ofcbkAra', value: e.ofcbkAra),
          DataGridCell<int>(columnName: 'incrprAra', value: e.incrprAra),
          DataGridCell<int>(columnName: 'cmpnstnInvstgAra', value: e.cmpnstnInvstgAra),
          DataGridCell<String>(columnName: 'acqsPrpDivCd', value: e.acqsPrpDivCd),
          DataGridCell<String>(columnName: 'aceptncPrpDivCd', value: e.aceptncPrpDivCd),
          DataGridCell<int>(columnName: 'accdtInvstgSqnc', value: e.accdtInvstgSqnc),
          DataGridCell<String>(columnName: 'invstgDt', value: e.invstgDt),
          DataGridCell<String>(columnName: 'cmpnstnDtaChnStatDivCd', value: e.cmpnstnDtaChnStatDivCd),
          DataGridCell<String>(columnName: 'etc', value: e.etc),
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
        child: AutoSizeText(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
      );
    }).toList());
  }
}