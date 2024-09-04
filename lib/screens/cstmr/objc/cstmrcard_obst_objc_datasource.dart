import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/cstmrcard_obst_objc_datasource_model.dart';

class CstmrcardObstObjcDatasource extends DataGridSource {
  CstmrcardObstObjcDatasource({required List<CstmrcardObstObjcDatasourceModel> items}) {
    _items = items
        .map<DataGridRow>((e) =>
        DataGridRow(cells: [
          DataGridCell<String>(columnName: 'lgdongNm', value: e.lgdongNm),
          DataGridCell<String>(columnName: 'lcrtsDivNm', value: e.lcrtsDivNm),
          DataGridCell<String>(columnName: 'mlnoLtno', value: e.mlnoLtno),
          DataGridCell<String>(columnName: 'slnoLtno', value: e.slnoLtno),
          DataGridCell<String>(columnName: 'acqsPrpDivNm', value: e.acqsPrpDivNm.toString()),
          DataGridCell<String>(columnName: 'obstDivNm', value: e.obstDivNm),
          DataGridCell<String>(columnName: 'obstStrctStndrdInfo', value: e.obstStrctStndrdInfo),
          DataGridCell<String>(columnName: 'dtaPrcsSittnCtnt', value: e.dtaPrcsSittnCtnt),
          DataGridCell<String>(columnName: 'cmpnstnQtyAraVu', value: e.cmpnstnQtyAraVu.toString()),
          DataGridCell<String>(columnName: 'cmpnstnThingUnitDivNm', value: e.cmpnstnThingUnitDivNm.toString()),
          DataGridCell<String>(columnName: 'objcLdgmntDe', value: e.objcLdgmntDe.toString()),
          DataGridCell<String>(columnName: 'objcLdgmntAmt', value: e.objcLdgmntAmt.toString()),
          DataGridCell<String>(columnName: 'obadUpc', value: e.obadUpc.toString()),
          DataGridCell<String>(columnName: 'objcRstAmt', value: e.objcRstAmt.toString()),
          DataGridCell<String>(columnName: 'objcIrsdAmt', value: e.objcIrsdAmt.toString()),
          DataGridCell<String>(columnName: 'objcAdjdcDt', value: e.objcAdjdcDt.toString()),
          DataGridCell<String>(columnName: 'objcLdgmntPrrgDe', value: e.objcLdgmntPrrgDe.toString()),

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