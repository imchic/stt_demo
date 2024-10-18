import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldm/utils/applog.dart';
import 'package:ldm/utils/common_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/accdtlnvstg_lad_model.dart';

/// [AccdtlnvstgLadDatasource] 는 [DataGridSource] 를 상속받아 구현한 데이터 소스 클래스이다.

class AccdtlnvstgLadDatasource extends DataGridSource {
  AccdtlnvstgLadDatasource({required List<AccdtlnvstgLadModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'thingSerNo', value: e.thingSerNo),
              DataGridCell<String>(columnName: 'lgdongCd', value: e.lgdongCd),
              DataGridCell<String>(columnName: 'lgdongNm', value: e.lgdongNm),
              DataGridCell<String>(columnName: 'lcrtsDivCd', value: e.lcrtsDivCd),
              DataGridCell<String>(columnName: 'lcrtsDivNm', value: e.lcrtsDivCdNm),
              DataGridCell<String>(columnName: 'mlnoLtno', value: e.mlnoLtno),
              DataGridCell<String>(columnName: 'slnoLtno', value: e.slnoLtno),
              DataGridCell<String>(columnName: 'ofcbkLndcgrDivNm', value: e.ofcbkLndcgrDivNm),
              DataGridCell<String>(columnName: 'sttusLndcgrDivNm', value: e.sttusLndcgrDivNm),
              DataGridCell<String>(columnName: 'ofcbkAra', value: e.ofcbkAra.toString()),
              DataGridCell<String>(columnName: 'incrprAra', value: e.incrprAra.toString()),
              DataGridCell<String>(columnName: 'cmpnstnInvstgAra', value: e.cmpnstnInvstgAra.toString()),
              DataGridCell<String>(columnName: 'acqsPrpDivNm', value: e.acqsPrpDivNm),
              DataGridCell<String>(columnName: 'aceptncUseDivNm', value: e.aceptncUseDivNm),
              DataGridCell<String>(columnName: 'accdtInvstgSqnc', value: e.accdtInvstgSqnc.toString()),
              DataGridCell<String>(columnName: 'invstgDt', value: e.invstgDt.toString()),
              DataGridCell<String>(columnName: 'cmpnstnStepDivNm', value: e.cmpnstnStepDivNm.toString()),
              DataGridCell<String>(columnName: 'accdtInvstgRm', value: e.accdtInvstgRm.toString()),
            ]))
        .toList();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(color: Colors.white, cells: row.getCells().map<Widget>((dataGridCell) {

      if(dataGridCell.columnName == 'lgdongNm') {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
        );
      }

      if (dataGridCell.columnName == 'invstgDt') {
        return Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.all(8.0),
          child: Center(child: AutoSizeText(CommonUtil.convertToDateTime(dataGridCell.value.toString()), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp))),
        );
      }

      if (dataGridCell.columnName == 'cmpnstnStepDivNm') {
        return Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              height: 80.h,
              decoration: BoxDecoration(
                color: CommonUtil.getBadgeColor(dataGridCell.value.toString()),
                borderRadius: BorderRadius.circular(5.0),
              ), child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500, color: Colors.white)),
            ));
      }

      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: AutoSizeText(dataGridCell.value.toString(),
                overflow: TextOverflow.ellipsis,
                maxFontSize: 20,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.sp)),
          );
    }).toList());
  }

}