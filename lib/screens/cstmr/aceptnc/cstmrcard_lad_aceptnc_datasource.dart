import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldi/screens/cstmr/aceptnc/model/cstmrcard_lad_aceptnc_datasource_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CstmrcardLadAceptncDatasource extends DataGridSource {
  CstmrcardLadAceptncDatasource({required List<CstmrcardLadAceptncDatasourceModel> items}) {
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
          DataGridCell<String>(columnName: 'aceptncUseBeginDe', value: e.aceptncUseBeginDe.toString()),
          DataGridCell<String>(columnName: 'aceptncAdjdcDt', value: e.aceptncAdjdcDt.toString()),
          DataGridCell<String>(columnName: 'aceptncAdjdcUpc', value: e.aceptncAdjdcUpc.toString()),
          DataGridCell<String>(columnName: 'aceptncAdjdcAmt', value: e.aceptncAdjdcAmt.toString()),
          DataGridCell<String>(columnName: 'adjdcRqstSqnc', value: e.adjdcRqstSqnc.toString()),
          DataGridCell<String>(columnName: 'cpsmnPymntStepDivCd', value: e.cpsmnPymntStepDivCd.toString()),

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