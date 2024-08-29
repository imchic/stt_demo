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
          DataGridCell<String>(columnName: 'lgdongNm', value: e.lgdongNm), // 법정동
          DataGridCell<String>(columnName: 'lcrtsDivCd', value: e.lcrtsDivNm), // 특지
          DataGridCell<String>(columnName: 'mlnoLtno', value: e.mlnoLtno), // 본번
          DataGridCell<String>(columnName: 'slnoLtno', value: e.slnoLtno), // 부번
          // 지목
          DataGridCell<String>(columnName: 'ofcbkLndcgrDivNm', value: e.ofcbkLndcgrDivNm), // 공부지목
          DataGridCell<String>(columnName: 'sttusLndcgrDivNm', value: e.sttusLndcgrDivNm), // 현황지
          // 면적
          DataGridCell<String>(columnName: 'ofcbkAra', value: e.ofcbkAra.toString()), // 공부
          DataGridCell<String>(columnName: 'incrprAra', value: e.incrprAra.toString()), // 편입
          DataGridCell<String>(columnName: 'cmpnstnInvstgAra', value: e.cmpnstnInvstgAra.toString()), // 보상
          // 취득용도
          DataGridCell<String>(columnName: 'acqsPrpDivNm', value: e.acqsPrpDivNm), // 취득용도
          DataGridCell<String>(columnName: 'aceptncUseDivNm', value: e.aceptncUseDivNm), // 수용사용
          DataGridCell<String>(columnName: 'accdtInvstgSqnc', value: e.accdtInvstgSqnc.toString()), // 조사차수
          DataGridCell<String>(columnName: 'invstgDt', value: e.invstgDt.toString()), // 조사차수
          DataGridCell<String>(columnName: 'cmpnstnStepDivCdNm', value: e.cmpnstnStepDivCdNm), // 보상진행단계
          DataGridCell<String>(columnName: 'accdtInvstgRm', value: e.accdtInvstgRm), // 실태조사비고

        ]))
        .toList();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: row.getCells().map<Widget>((dataGridCell) {

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