import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldm/screens/lp_controller.dart';
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

      if(dataGridCell.columnName == 'ofcbkLndcgrDivNm') {
        return Container(
          // padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          // dropdown button
          child: DropdownButton<String>(
            isExpanded: true,
            value: dataGridCell.value.toString(),
            icon: const Icon(Icons.arrow_drop_down),
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? newValue) {
              // 현재 행 가져옴
              final rowIndex = _items.indexOf(row);
              // 변경된 값으로 업데이트
              _items[rowIndex] = DataGridRow(cells: [
                DataGridCell<String>(columnName: 'thingSerNo', value: row.getCells()[0].value),
                DataGridCell<String>(columnName: 'lgdongCd', value: row.getCells()[1].value),
                DataGridCell<String>(columnName: 'lgdongNm', value: row.getCells()[2].value),
                DataGridCell<String>(columnName: 'lcrtsDivCd', value: row.getCells()[3].value),
                DataGridCell<String>(columnName: 'lcrtsDivNm', value: row.getCells()[4].value),
                DataGridCell<String>(columnName: 'mlnoLtno', value: row.getCells()[5].value),
                DataGridCell<String>(columnName: 'slnoLtno', value: row.getCells()[6].value),
                DataGridCell<String>(columnName: 'ofcbkLndcgrDivNm', value: newValue!),
                DataGridCell<String>(columnName: 'sttusLndcgrDivNm', value: row.getCells()[8].value),
                DataGridCell<String>(columnName: 'ofcbkAra', value: row.getCells()[9].value),
                DataGridCell<String>(columnName: 'incrprAra', value: row.getCells()[10].value),
                DataGridCell<String>(columnName: 'cmpnstnInvstgAra', value: row.getCells()[11].value),
                DataGridCell<String>(columnName: 'acqsPrpDivNm', value: row.getCells()[12].value),
                DataGridCell<String>(columnName: 'aceptncUseDivNm', value: row.getCells()[13].value),
                DataGridCell<String>(columnName: 'accdtInvstgSqnc', value: row.getCells()[14].value),
                DataGridCell<String>(columnName: 'invstgDt', value: row.getCells()[15].value),
                DataGridCell<String>(columnName: 'cmpnstnStepDivNm', value: row.getCells()[16].value),
                DataGridCell<String>(columnName: 'accdtInvstgRm', value: row.getCells()[17].value),
              ]);
              notifyListeners();
            },
            items: LpController.to.ladRealUseList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(fontSize: 30.sp)),
              );
            }).toList(),
          ),
          //child: AutoSizeText(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
        );
      }

      if(dataGridCell.columnName == 'sttusLndcgrDivNm') {
        return Container(
          // padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          // dropdown button
          child: DropdownButton<String>(
            isExpanded: true,
            value: dataGridCell.value.toString(),
            icon: const Icon(Icons.arrow_drop_down),
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? newValue) {
              // 현재 행 가져옴
              final rowIndex = _items.indexOf(row);
              // 변경된 값으로 업데이트
              _items[rowIndex] = DataGridRow(cells: [
                DataGridCell<String>(columnName: 'thingSerNo', value: row.getCells()[0].value),
                DataGridCell<String>(columnName: 'lgdongCd', value: row.getCells()[1].value),
                DataGridCell<String>(columnName: 'lgdongNm', value: row.getCells()[2].value),
                DataGridCell<String>(columnName: 'lcrtsDivCd', value: row.getCells()[3].value),
                DataGridCell<String>(columnName: 'lcrtsDivNm', value: row.getCells()[4].value),
                DataGridCell<String>(columnName: 'mlnoLtno', value: row.getCells()[5].value),
                DataGridCell<String>(columnName: 'slnoLtno', value: row.getCells()[6].value),
                DataGridCell<String>(columnName: 'ofcbkLndcgrDivNm', value: row.getCells()[7].value),
                DataGridCell<String>(columnName: 'sttusLndcgrDivNm', value: newValue!),
                DataGridCell<String>(columnName: 'ofcbkAra', value: row.getCells()[9].value),
                DataGridCell<String>(columnName: 'incrprAra', value: row.getCells()[10].value),
                DataGridCell<String>(columnName: 'cmpnstnInvstgAra', value: row.getCells()[11].value),
                DataGridCell<String>(columnName: 'acqsPrpDivNm', value: row.getCells()[12].value),
                DataGridCell<String>(columnName: 'aceptncUseDivNm', value: row.getCells()[13].value),
                DataGridCell<String>(columnName: 'accdtInvstgSqnc', value: row.getCells()[14].value),
                DataGridCell<String>(columnName: 'invstgDt', value: row.getCells()[15].value),
                DataGridCell<String>(columnName: 'cmpnstnStepDivNm', value: row.getCells()[16].value),
                DataGridCell<String>(columnName: 'accdtInvstgRm', value: row.getCells()[17].value),
              ]);
              notifyListeners();
            },
            items: LpController.to.ladRealUseList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: TextStyle(fontSize: 30.sp)),
              );
            }).toList(),
          ),
          //child: AutoSizeText(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
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