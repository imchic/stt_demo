import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          DataGridCell<String>(columnName: 'lgdongNm', value: e.lgdongNm), //소재지
          DataGridCell<String>(columnName: 'lcrtsDivNm', value: e.lcrtsDivNm), // 특지
          DataGridCell<String>(columnName: 'mlnoLtno', value: e.mlnoLtno), // 본번
          DataGridCell<String>(columnName: 'slnoLtno', value: e.slnoLtno), // 부번
          DataGridCell<String>(columnName: 'cmpnstnObstNo', value: e.cmpnstnObstNo.toString()), // 지장물순번
          DataGridCell<String>(columnName: 'obstDivNm', value: e.obstDivNm), // 지장물구분
          DataGridCell<String>(columnName: 'cmpnstnThingKndDtls', value: e.cmpnstnThingKndDtls), // 물건의종류
          DataGridCell<String>(columnName: 'obstStrctStndrdInfo', value: e.obstStrctStndrdInfo), // 구조 및 규격
          DataGridCell<String>(columnName: 'cmpnstnQtyAraVu', value: e.cmpnstnQtyAraVu.toString()), // 수량면적
          DataGridCell<String>(columnName: 'cmpnstnThingUnitDivNm', value: e.cmpnstnThingUnitDivNm), // 물건단위구분
          DataGridCell<String>(columnName: 'acqsPrpDivNm', value: e.acqsPrpDivNm), // 취득용도
          DataGridCell<String>(columnName: 'accdtInvstgSqnc', value: e.accdtInvstgSqnc.toString()), // 조사차수
          DataGridCell<String>(columnName: 'invstgDt', value: e.invstgDt), // 조사일자
          DataGridCell<String>(columnName: 'cmpnstnStepDivNm', value: e.cmpnstnStepDivNm), // 보상진행단계
          DataGridCell<String>(columnName: 'spcitm', value: e.spcitm), // 특이사항
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
        child: Text(dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12)),
      );
    }).toList());
  }
}