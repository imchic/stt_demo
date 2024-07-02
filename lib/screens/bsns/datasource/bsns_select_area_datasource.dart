import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stt_demo/screens/bsns/datasource/model/bsns_select_area_datasource_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// TD_LP10111 (LP_사업계획구역정보)
///
/// 사업계획구역정보 그리드 데이터소스

class BsnsSelectAreaDataSource extends DataGridSource {
  BsnsSelectAreaDataSource(
      {required List<BsnsSelectAreaDataSourceModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
              // 사업번호
              DataGridCell<int>(columnName: 'bsnsZoneNo', value: e.bsnsZoneNo),
              // 사업구역 명
              DataGridCell<String>(columnName: 'bsnsZoneNm', value: e.bsnsZoneNm),
              // 필지 수
              DataGridCell<int>(columnName: 'lotCnt', value: e.lotCnt),
              // 면적
              DataGridCell<int>(columnName: 'bsnsAra', value: e.bsnsAra),
              // 열람공고일
              DataGridCell<String>(
                  columnName: 'bsnsReadngPblancDe',
                  value: e.bsnsReadngPblancDe),
            ]))
        .toList();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.sp)),
      );
    }).toList());
  }
}
