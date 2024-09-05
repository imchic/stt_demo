import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../utils/common_util.dart';
import 'model/accdtlnvstg_lad_owner_model.dart';

/// [AccdtlnvstgLadDatasource] 는 [DataGridSource] 를 상속받아 구현한 데이터 소스 클래스이다.

class AccdtlnvstgLadOwnerDatasource extends DataGridSource {
  AccdtlnvstgLadOwnerDatasource({required List<AccdtlnvstgLadOwnerModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'ownerNo', value: e.ownerNo),
              DataGridCell<String>(columnName: 'ownerNm', value: e.ownerNm),
              DataGridCell<String>(columnName: 'posesnDivNm', value: e.posesnDivNm),
              DataGridCell<String>(columnName: 'posesnShreDnmntrInfo', value: e.posesnShreDnmntrInfo),
              DataGridCell<String>(columnName: 'posesnShreNmrtrInfo', value: e.posesnShreNmrtrInfo),
              DataGridCell<String>(columnName: 'ownerRrnEnc', value: e.ownerRrnEnc),
              DataGridCell<String>(columnName: 'ownerRgsbukAddr', value: e.ownerRgsbukAddr),
              DataGridCell<String>(columnName: 'rgsbukZip', value: e.rgsbukZip),
              DataGridCell<String>(columnName: 'ownerTelno', value: e.ownerTelno),
              DataGridCell<String>(columnName: 'ownerMbtlnum', value: e.ownerMbtlnum),
            ]))
        .toList();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(color: Colors.white, cells: row.getCells().map<Widget>((dataGridCell) {

      if(dataGridCell.columnName == 'ownerRrnEnc') {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(CommonUtil.maskOwnerRegisterNo(dataGridCell.value.toString()), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
        );
      }

      if(dataGridCell.columnName == 'ownerTelno' || dataGridCell.columnName == 'ownerMbtlnum') {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(CommonUtil.phoneHyphen(dataGridCell.value.toString()), overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 30.sp)),
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