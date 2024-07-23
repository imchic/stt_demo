import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/owner_obst_info_datasource_model.dart';

/// TM_LP20310 (LP_실태조사지장물정보)
///
/// LP_실태조사지장물정보 그리드 데이터소스


class OwnerObstInfoDatasource extends DataGridSource {
  OwnerObstInfoDatasource({required List<OwnerObstInfoDatasourceModel> items}) {
    _items = items
        .map<DataGridRow>((e) =>
        DataGridRow(cells: [
          DataGridCell<String>(columnName: 'lgdongNm', value: e.lgdongNm),
          DataGridCell<String>(columnName: 'lcrtsDivCd', value: e.lcrtsDivCd),
          DataGridCell<String>(columnName: 'mlnoLtno', value: e.mlnoLtno),
          DataGridCell<String>(columnName: 'slnoLtno', value: e.slnoLtno),
          DataGridCell<String>(columnName: 'obstSeq', value: e.obstSeq),
          DataGridCell<String>(columnName: 'obstDivCd', value: e.obstDivCd),
          DataGridCell<String>(columnName: 'cmpnstnThingKndDtls', value: e.cmpnstnThingKndDtls),
          DataGridCell<String>(columnName: 'obstStrctStndrdInfo', value: e.obstStrctStndrdInfo),
          DataGridCell<String>(columnName: 'cmpnstnQtyAraVu', value: e.cmpnstnQtyAraVu),
          DataGridCell<String>(columnName: 'cmpnstnThingUnitDivCd', value: e.cmpnstnThingUnitDivCd),
          DataGridCell<String>(columnName: 'sttusLndcgrDivCd', value: e.sttusLndcgrDivCd),
          DataGridCell<String>(columnName: 'acqsPrpDivCd', value: e.acqsPrpDivCd),
          DataGridCell<String>(columnName: 'aceptncUseDivCd', value: e.aceptncUseDivCd),
          DataGridCell<int>(columnName: 'accdtInvstgSqnc', value: e.accdtInvstgSqnc),
          DataGridCell<String>(columnName: 'invstgDt', value: e.invstgDt),
          DataGridCell<String>(columnName: 'cmpnstnStepDivCd', value: e.cmpnstnStepDivCd),
          DataGridCell<String>(columnName: 'spcitm', value: e.spcitm),
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
        child: Text(dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12)),
      );
    }).toList());
  }
}