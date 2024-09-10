import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldi/utils/common_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../select/bsns_plan_select_area_model.dart';

/// TD_LP10111 (LP_사업계획구역정보)
///
/// 사업계획구역정보 그리드 데이터소스

class BsnsSelectAreaDataSource extends DataGridSource {
  BsnsSelectAreaDataSource(
      {required List<BsnsPlanSelectAreaModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
              // 사업번호
              DataGridCell<num>(columnName: 'bsnsZoneNo', value: e.bsnsZoneNo),
              // 사업구역 명
              DataGridCell<String>(columnName: 'bsnsZoneNm', value: e.bsnsZoneNm),
              // 필지 수
              DataGridCell<String>(columnName: 'lotCnt', value: e.lotCnt),
              // 면적
              DataGridCell<String>(columnName: 'bsnsAra', value: e.bsnsAra),
              // 열람공고일
              DataGridCell<String>(columnName: 'bsnsReadngPblancDe', value: e.bsnsReadngPblancDe),
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
          if(dataGridCell.columnName == 'bsnsZoneNm') {
            return Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, maxLines: 3, style: TextStyle(fontSize: 30.sp, color: Color(0xFF1D56BC))),
            );
          }
          
          // 필지수, 면적
          if(dataGridCell.columnName == 'lotCnt' || dataGridCell.columnName == 'bsnsAra') {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(maxFontSize: 20, CommonUtil.comma3(num.parse(dataGridCell.value.toString())), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
            );
          }
          
          if(dataGridCell.columnName == 'bsnsReadngPblancDe') {
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(maxFontSize: 20, CommonUtil.convertToDateTime(dataGridCell.value.toString()), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
            );
          }
          
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
          );
          

        }).toList());
  }

}
