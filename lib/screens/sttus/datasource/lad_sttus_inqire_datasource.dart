import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldi/screens/sttus/datasource/model/lad_sttus_inqire_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class LadSttusInqireDatasource extends DataGridSource {
  LadSttusInqireDatasource({required List<LadSttusInqireModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'addr', value: e.addr),
              DataGridCell<String>(columnName: 'lcrtsNm', value: e.lcrtsNm),
              DataGridCell<String>(columnName: 'mlnoLtno', value: e.mlnoLtno),
              DataGridCell<String>(columnName: 'slnoLtno', value: e.slnoLtno),

              DataGridCell<String>(columnName: 'ofcbkLndcgrDivCd', value: e.ofcbkLndcgrDivCd),
              DataGridCell<String>(columnName: 'sttusLndcgrDivCd', value: e.sttusLndcgrDivCd),

              DataGridCell<String>(columnName: 'prgsStepInfo', value: e.prgsStepInfo),
              DataGridCell<String>(columnName: 'acqsPrpDivCd', value: e.acqsPrpDivCd),

              DataGridCell<String>(columnName: 'ofcbkAra', value: e.ofcbkAra),
              DataGridCell<String>(columnName: 'incrprAra', value: e.incrprAra),

              DataGridCell<String>(columnName: 'cmpnstnInvstgAra', value: e.cmpnstnInvstgAra),
              DataGridCell<String>(columnName: 'aceptncUseDivCd', value: e.aceptncUseDivCd),
              DataGridCell<String>(columnName: 'accdtInvstgDe', value: e.accdtInvstgDe),
              DataGridCell<String>(columnName: 'accdtInvstgSqnc', value: e.accdtInvstgSqnc),

              DataGridCell<String>(columnName: 'ownerNo', value: e.ownerNo),
              DataGridCell<String>(columnName: 'ownerDivCd', value: e.ownerDivCd),
              DataGridCell<String>(columnName: 'ownerNm', value: e.ownerNm),
              DataGridCell<String>(columnName: 'ownerRgsbukAddr', value: e.ownerRgsbukAddr),
              DataGridCell<String>(columnName: 'posesnShreNmrtrInfo', value: e.posesnShreNmrtrInfo),
              DataGridCell<String>(columnName: 'posesnShreDnmntrInfo', value: e.posesnShreDnmntrInfo),

              DataGridCell<String>(columnName: 'apasmtDivCd', value: e.apasmtDivCd),
              DataGridCell<String>(columnName: 'apasmtSqnc', value: e.apasmtSqnc),
              DataGridCell<String>(columnName: 'prceDt', value: e.prceDt),

              DataGridCell<String>(columnName: 'apasmtInsttNm1', value: e.apasmtInsttNm1),
              DataGridCell<String>(columnName: 'apasmtInsttEvlUpc1', value: e.apasmtInsttEvlUpc1),
              DataGridCell<String>(columnName: 'apasmtInsttEvlAmt1', value: e.apasmtInsttEvlAmt1),

              DataGridCell<String>(columnName: 'apasmtInsttNm2', value: e.apasmtInsttNm2),
              DataGridCell<String>(columnName: 'apasmtInsttEvlUpc2', value: e.apasmtInsttEvlUpc2),
              DataGridCell<String>(columnName: 'apasmtInsttEvlAmt2', value: e.apasmtInsttEvlAmt2),

              DataGridCell<String>(columnName: 'apasmtInsttNm3', value: e.apasmtInsttNm3),
              DataGridCell<String>(columnName: 'apasmtInsttEvlUpc3', value: e.apasmtInsttEvlUpc3),
              DataGridCell<String>(columnName: 'apasmtInsttEvlAmt3', value: e.apasmtInsttEvlAmt3),

              DataGridCell<String>(columnName: 'cmpnstnCmptnUpc', value: e.cmpnstnCmptnUpc),
              DataGridCell<String>(columnName: 'cmpnstnCmptnAmt', value: e.cpsmnCmptnAmt),

              DataGridCell<String>(columnName: 'pymntRequstDt', value: e.pymntRequstDt),
              DataGridCell<String>(columnName: 'cpsmnUpc', value: e.cpsmnUpc),
              DataGridCell<String>(columnName: 'cpsmnPymamt', value: e.cpsmnPymamt),
              DataGridCell<String>(columnName: 'rgistDt', value: e.rgistDt),

              DataGridCell<String>(columnName: 'aceptncAdjdcUpc', value: e.aceptncAdjdcUpc),
              DataGridCell<String>(columnName: 'aceptncAdjdcAmt', value: e.aceptncAdjdcAmt),
              DataGridCell<String>(columnName: 'aceptncAdjdcDt', value: e.aceptncAdjdcDt),
              DataGridCell<String>(columnName: 'aceptncUseBeginDe', value: e.aceptncUseBeginDe),
              DataGridCell<String>(columnName: 'aceptncAdjdcPymntDe', value: e.aceptncAdjdcPymntDe),
              DataGridCell<String>(columnName: 'aceptncRgistDt', value: e.rgistDt),
              DataGridCell<String>(columnName: 'cpsmnPymntLdgmntDivCd', value: e.cpsmnPymntLdgmntDivCd),

              DataGridCell<String>(columnName: 'objctnAdjdcUpc', value: e.objctnAdjdcUpc),
              DataGridCell<String>(columnName: 'objctnAdjdcAmt', value: e.objctnAdjdcAmt),
              DataGridCell<String>(columnName: 'objctnAdjdcDt', value: e.objctnAdjdcDt),
              DataGridCell<String>(columnName: 'objctnPymntRequstDt', value: e.pymntRequstDt),
              DataGridCell<String>(columnName: 'objctncpsmnPymntLdgmntDivCd', value: e.cpsmnPymntLdgmntDivCd),


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
        child: AutoSizeText(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
      );
    }).toList());
  }

}