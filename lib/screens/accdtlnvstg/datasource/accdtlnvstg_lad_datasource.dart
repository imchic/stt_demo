import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldm/screens/lp_controller.dart';
import 'package:ldm/utils/applog.dart';
import 'package:ldm/utils/common_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../components/custom_textfield.dart';
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
              DataGridCell<String>(columnName: 'addRow', value: ''),
            ]))
        .toList();
    notifyListeners();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  int rowIndex = 0;

  String? selectedValue;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(color: Colors.white, cells: row.getCells().map<Widget>((dataGridCell) {

      // cmpnstnInvstgAra 수정
      if(dataGridCell.columnName == 'cmpnstnInvstgAra') {
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: TextEditingController(text: dataGridCell.value.toString()),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
            ),
            // style
            style: TextStyle(fontSize: 30.sp, color: Colors.red, fontWeight: FontWeight.w500),
            keyboardType: TextInputType.number,
            onChanged: (String value) {

            },
            onSubmitted: (String value) {
              AppLog.d('cmpnstnInvstgAra edit text: $value');
              rowIndex = _items.indexOf(row);
              _items[rowIndex] = DataGridRow(cells: [
                DataGridCell<String>(columnName: 'thingSerNo', value: row.getCells()[0].value),
                DataGridCell<String>(columnName: 'lgdongCd', value: row.getCells()[1].value),
                DataGridCell<String>(columnName: 'lgdongNm', value: row.getCells()[2].value),
                DataGridCell<String>(columnName: 'lcrtsDivCd', value: row.getCells()[3].value),
                DataGridCell<String>(columnName: 'lcrtsDivNm', value: row.getCells()[4].value),
                DataGridCell<String>(columnName: 'mlnoLtno', value: row.getCells()[5].value),
                DataGridCell<String>(columnName: 'slnoLtno', value: row.getCells()[6].value),
                DataGridCell<String>(columnName: 'ofcbkLndcgrDivNm', value: row.getCells()[7].value),
                DataGridCell<String>(columnName: 'sttusLndcgrDivNm', value: row.getCells()[8].value),
                DataGridCell<String>(columnName: 'ofcbkAra', value: row.getCells()[9].value),
                DataGridCell<String>(columnName: 'incrprAra', value: row.getCells()[10].value),
                DataGridCell<String>(columnName: 'cmpnstnInvstgAra', value: value),
                DataGridCell<String>(columnName: 'acqsPrpDivNm', value: row.getCells()[12].value),
                DataGridCell<String>(columnName: 'aceptncUseDivNm', value: row.getCells()[13].value),
                DataGridCell<String>(columnName: 'accdtInvstgSqnc', value: row.getCells()[14].value),
                DataGridCell<String>(columnName: 'invstgDt', value: row.getCells()[15].value),
                DataGridCell<String>(columnName: 'cmpnstnStepDivNm', value: row.getCells()[16].value),
                DataGridCell<String>(columnName: 'accdtInvstgRm', value: row.getCells()[17].value),
                DataGridCell<String>(columnName: 'addRow', value: ''),
              ]);
              notifyListeners();
              AppLog.d('cmpnstnInvstgAra edit text: $value');
              //controller.update();
            },
          ),
        );
      }

      if(dataGridCell.columnName == 'addRow') {
        return Container(
          color: dataGridCell.value.toString() == '' ? Colors.white : Colors.blue,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
        );
      }

      if(dataGridCell.columnName == 'lgdongNm') {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
        );
      }

      if(dataGridCell.columnName == 'sttusLndcgrDivNm') {

        if(!LpController.to.accdtlnvstgLadRealUseList.contains(dataGridCell.value.toString())) {
          LpController.to.accdtlnvstgLadRealUseList.add(dataGridCell.value.toString());
        }

        return Container(
          alignment: Alignment.center,
          child: DropdownButton<String>(
            isExpanded: true,
            value: dataGridCell.value.toString(),
            icon: Icon(Icons.arrow_drop_down),
            style: TextStyle(color: Colors.deepPurple, fontSize: 30.sp, fontWeight: FontWeight.w500),
            onChanged: (String? newValue) {

              // 현재 행
              final rowIndex = _items.indexOf(row);
              AppLog.d('rowIndex: $rowIndex');

              _items[rowIndex] = DataGridRow(cells: [
                DataGridCell<String>(columnName: 'thingSerNo', value: row.getCells()[0].value),
                DataGridCell<String>(columnName: 'lgdongCd', value: row.getCells()[1].value),
                DataGridCell<String>(columnName: 'lgdongNm', value: row.getCells()[2].value),
                DataGridCell<String>(columnName: 'lcrtsDivCd', value: row.getCells()[3].value),
                DataGridCell<String>(columnName: 'lcrtsDivNm', value: row.getCells()[4].value),
                DataGridCell<String>(columnName: 'mlnoLtno', value: row.getCells()[5].value),
                DataGridCell<String>(columnName: 'slnoLtno', value: row.getCells()[6].value),
                DataGridCell<String>(columnName: 'ofcbkLndcgrDivNm', value: row.getCells()[7].value),
                DataGridCell<String>(columnName: 'sttusLndcgrDivNm', value: newValue ?? ''),
                DataGridCell<String>(columnName: 'ofcbkAra', value: row.getCells()[9].value),
                DataGridCell<String>(columnName: 'incrprAra', value: row.getCells()[10].value),
                DataGridCell<String>(columnName: 'cmpnstnInvstgAra', value: row.getCells()[11].value),
                DataGridCell<String>(columnName: 'acqsPrpDivNm', value: row.getCells()[12].value),
                DataGridCell<String>(columnName: 'aceptncUseDivNm', value: row.getCells()[13].value),
                DataGridCell<String>(columnName: 'accdtInvstgSqnc', value: row.getCells()[14].value),
                DataGridCell<String>(columnName: 'invstgDt', value: row.getCells()[15].value),
                DataGridCell<String>(columnName: 'cmpnstnStepDivNm', value: row.getCells()[16].value),
                DataGridCell<String>(columnName: 'accdtInvstgRm', value: row.getCells()[17].value),
                DataGridCell<String>(columnName: 'addRow', value: ''),
              ]);

              notifyListeners();
            }, items:
              LpController.to.accdtlnvstgLadRealUseList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: AutoSizeText(value, style: TextStyle(fontSize: 30.sp)),
                );
              }).toList(),
          ),
          //child: AutoSizeText(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
        );
      }

      if(dataGridCell.columnName == 'acqsPrpDivNm') {
        // return Container(
        //   alignment: Alignment.center,
        //   padding: const EdgeInsets.all(8.0),
        //   child: AutoSizeText(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
        // );
        if(!LpController.to.accdtlnvstgAcqstnPrpsList.contains(dataGridCell.value.toString())) {
          LpController.to.accdtlnvstgAcqstnPrpsList.add(dataGridCell.value.toString());
        }

        return Container(
          alignment: Alignment.center,
          child: DropdownButton<String>(
            isExpanded: true,
            value: dataGridCell.value.toString(),
            icon: Icon(Icons.arrow_drop_down),
            style: TextStyle(color: Colors.deepPurple, fontSize: 30.sp, fontWeight: FontWeight.w500),
            onChanged: (String? newValue) {

              // 현재 행
              final rowIndex = _items.indexOf(row);
              AppLog.d('rowIndex: $rowIndex');

              _items[rowIndex] = DataGridRow(cells: [
                DataGridCell<String>(columnName: 'thingSerNo', value: row.getCells()[0].value),
                DataGridCell<String>(columnName: 'lgdongCd', value: row.getCells()[1].value),
                DataGridCell<String>(columnName: 'lgdongNm', value: row.getCells()[2].value),
                DataGridCell<String>(columnName: 'lcrtsDivCd', value: row.getCells()[3].value),
                DataGridCell<String>(columnName: 'lcrtsDivNm', value: row.getCells()[4].value),
                DataGridCell<String>(columnName: 'mlnoLtno', value: row.getCells()[5].value),
                DataGridCell<String>(columnName: 'slnoLtno', value: row.getCells()[6].value),
                DataGridCell<String>(columnName: 'ofcbkLndcgrDivNm', value: row.getCells()[7].value),
                DataGridCell<String>(columnName: 'sttusLndcgrDivNm', value: row.getCells()[8].value),
                DataGridCell<String>(columnName: 'ofcbkAra', value: row.getCells()[9].value),
                DataGridCell<String>(columnName: 'incrprAra', value: row.getCells()[10].value),
                DataGridCell<String>(columnName: 'cmpnstnInvstgAra', value: row.getCells()[11].value),
                DataGridCell<String>(columnName: 'acqsPrpDivNm', value: newValue ?? ''),
                DataGridCell<String>(columnName: 'aceptncUseDivNm', value: row.getCells()[13].value),
                DataGridCell<String>(columnName: 'accdtInvstgSqnc', value: row.getCells()[14].value),
                DataGridCell<String>(columnName: 'invstgDt', value: row.getCells()[15].value),
                DataGridCell<String>(columnName: 'cmpnstnStepDivNm', value: row.getCells()[16].value),
                DataGridCell<String>(columnName: 'accdtInvstgRm', value: row.getCells()[17].value),
                DataGridCell<String>(columnName: 'addRow', value: ''),
              ]);

              notifyListeners();
            }, items:
          LpController.to.accdtlnvstgAcqstnPrpsList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: AutoSizeText(value, style: TextStyle(fontSize: 30.sp)),
            );
          }).toList(),
          ),
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
                //color: CommonUtil.getBadgeColor(dataGridCell.value.toString()),
                borderRadius: BorderRadius.circular(5.0),
              ), child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500)),
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

  // 선택한 행 복사
  void copySelectedRow() {

    final rowData = _items.map((e) => e.getCells().map((e) => e.value).toList()).toList();

    AppLog.d('rowData: $rowData');

    // 행 추가한뒤 새로고침
    _items.add(DataGridRow(cells: [
      DataGridCell<String>(columnName: 'thingSerNo', value: ''),
      DataGridCell<String>(columnName: 'lgdongCd', value: ''),
      DataGridCell<String>(columnName: 'lgdongNm', value: ''),
      DataGridCell<String>(columnName: 'lcrtsDivCd', value: ''),
      DataGridCell<String>(columnName: 'lcrtsDivNm', value: ''),
      DataGridCell<String>(columnName: 'mlnoLtno', value: ''),
      DataGridCell<String>(columnName: 'slnoLtno', value: ''),
      DataGridCell<String>(columnName: 'ofcbkLndcgrDivNm', value: ''),
      DataGridCell<String>(columnName: 'sttusLndcgrDivNm', value: ''),
      DataGridCell<String>(columnName: 'ofcbkAra', value: ''),
      DataGridCell<String>(columnName: 'incrprAra', value: ''),
      DataGridCell<String>(columnName: 'cmpnstnInvstgAra', value: ''),
      DataGridCell<String>(columnName: 'acqsPrpDivNm', value: ''),
      DataGridCell<String>(columnName: 'aceptncUseDivNm', value: ''),
      DataGridCell<String>(columnName: 'accdtInvstgSqnc', value: ''),
      DataGridCell<String>(columnName: 'invstgDt', value: ''),
      DataGridCell<String>(columnName: 'cmpnstnStepDivNm', value: ''),
      DataGridCell<String>(columnName: 'accdtInvstgRm', value: ''),
    ]));

    notifyListeners();

  }

}