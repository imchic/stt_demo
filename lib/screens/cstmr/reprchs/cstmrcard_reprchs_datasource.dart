import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldi/screens/cstmr/reprchs/model/cstmrcard_reprchs_datasource_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CstmrcardReprchsDatasource extends DataGridSource {
  CstmrcardReprchsDatasource({required List<CstmrcardReprchsDatasourceModel> items}) {
    _items = items
        .map<DataGridRow>((e) =>
        DataGridRow(cells: [
          DataGridCell<String>(columnName: 'lgdongNm', value: e.lgdongNm),
          DataGridCell<String>(columnName: 'lcrtsDivNm', value: e.lcrtsDivNm),
          DataGridCell<String>(columnName: 'mlnoLtno', value: e.mlnoLtno),
          DataGridCell<String>(columnName: 'slnoLtno', value: e.slnoLtno),
          DataGridCell<String>(columnName: 'acqsPrpDivNm', value: e.acqsPrpDivNm.toString()),
          DataGridCell<String>(columnName: 'ofcbkLndcgrDivNm', value: e.ofcbkLndcgrDivNm),
          DataGridCell<String>(columnName: 'sttusLndcgrDivNm', value: e.sttusLndcgrDivNm),
          DataGridCell<String>(columnName: 'ofcbkAra', value: e.ofcbkAra.toString()),
          DataGridCell<String>(columnName: 'incrprAra', value: e.incrprAra.toString()),
          DataGridCell<String>(columnName: 'cmpnstnInvstgAra', value: e.cmpnstnInvstgAra.toString()),
          DataGridCell<String>(columnName: 'posesnShreNmrtrInfo', value: e.posesnShreNmrtrInfo.toString()),
          DataGridCell<String>(columnName: 'posesnShreDnmntrInfo', value: e.posesnShreDnmntrInfo.toString()),
          DataGridCell<String>(columnName: 'cpsmn', value: e.cpsmn.toString()),
          DataGridCell<String>(columnName: 'ownerNm', value: e.ownerNm),
          DataGridCell<String>(columnName: 'reprchsNotieRecptDe', value: e.reprchsNotieRecptDe.toString()),
          DataGridCell<String>(columnName: 'reprchsOpinionAnswerDe', value: e.reprchsOpinionAnswerDe.toString()),
          DataGridCell<String>(columnName: 'apasmtReqestDt', value: e.apasmtReqestDt.toString()),
          DataGridCell<String>(columnName: 'apasmtSqnc', value: e.apasmtSqnc.toString()),
          DataGridCell<String>(columnName: 'prcPnttmDe', value: e.prcPnttmDe.toString()),
          DataGridCell<String>(columnName: 'apasmtInsttEvlUpc1', value: e.apasmtInsttEvlUpc1.toString()),
          DataGridCell<String>(columnName: 'apasmtInsttEvamt1', value: e.apasmtInsttEvamt1.toString()),
          DataGridCell<String>(columnName: 'apasmtInsttEvlUpc2', value: e.apasmtInsttEvlUpc2.toString()),
          DataGridCell<String>(columnName: 'apasmtInsttEvamt2', value: e.apasmtInsttEvamt2.toString()),
          DataGridCell<String>(columnName: 'reprchsCmptnUpc', value: e.reprchsCmptnUpc.toString()),
          DataGridCell<String>(columnName: 'reprchsCmptnAmt', value: e.reprchsCmptnAmt.toString()),
          DataGridCell<String>(columnName: 'sanctnDe', value: e.sanctnDe.toString()),
          DataGridCell<String>(columnName: 'reprchsRctcDivCd', value: e.reprchsRctcDivCd.toString()),
          DataGridCell<String>(columnName: 'rctcAmt', value: e.rctcAmt.toString()),
          DataGridCell<String>(columnName: 'rctcDe', value: e.rctcDe.toString()),
        ]))
        .toList();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: AutoSizeText(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
      );
    }).toList());
  }
}