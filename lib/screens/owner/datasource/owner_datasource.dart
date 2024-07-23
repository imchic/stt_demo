import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/owner_datasource_model.dart';

/// TM_LP20040 (LP_실태조사기본소유자정보)
///
/// 실태조사기본소유자정보 그리드 데이터소스

class OwnerDatasource extends DataGridSource {
  OwnerDatasource({required List<OwnerDataSourceModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
              // DataGridCell<int>(columnName: 'no', value: e.no),
              DataGridCell<String>(columnName: 'ownerNo', value: e.ownerNo),
              DataGridCell<String>(columnName: 'ladLdgrOwnerNm', value: e.ladLdgrOwnerNm),
              DataGridCell<String>(columnName: 'ladLdgrPosesnDivCd', value: e.ladLdgrPosesnDivCd),
              DataGridCell<String>(columnName: 'ownerRegisterNo', value: e.ownerRegisterNo ?? ''),
              DataGridCell<String>(columnName: 'ownerTelNo', value: e.ownerTelNo),
              DataGridCell<String>(columnName: 'ownerPhoneNo', value: e.ownerPhoneNo),
            ]))
        .toList();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: row.getCells().map<Widget>((dataGridCell) {

      if(dataGridCell.columnName == 'ownerRegisterNo') {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(maskOwnerRegisterNo(dataGridCell.value.toString()), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.sp)),
        );
      }

      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.sp)),
      );
    }).toList());
  }

  // 주민등록번호 마스킹 처리
  String maskOwnerRegisterNo(String ownerRegisterNo) {
    // 891208-1******
    if(ownerRegisterNo.length == 14) {
      return '${ownerRegisterNo.substring(0, 7)}-1${'*' * 5}';
    }
    return ownerRegisterNo;
  }

}