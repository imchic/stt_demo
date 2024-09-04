import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldi/screens/cstmr/aceptnc/model/cstmrcard_obst_aceptnc_datasource_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


class CstmrcardObstAceptncDatasource extends DataGridSource {
  CstmrcardObstAceptncDatasource({required List<CstmrcardObstAceptncDatasourceModel> items}) {
    _items = items
        .map<DataGridRow>((e) =>
        DataGridRow(cells: [
          DataGridCell<String>(columnName: 'lgdongNm', value: e.lgdongNm),
          DataGridCell<String>(columnName: 'lcrtsDivNm', value: e.lcrtsDivNm),
          DataGridCell<String>(columnName: 'mlnoLtno', value: e.mlnoLtno),
          DataGridCell<String>(columnName: 'slnoLtno', value: e.slnoLtno),
          DataGridCell<String>(columnName: 'acqsPrpDivNm', value: e.acqsPrpDivNm),
          DataGridCell<String>(columnName: 'cmpnstnThingKndDtls', value: e.cmpnstnThingKndDtls),
          DataGridCell<String>(columnName: 'obstDivNm', value: e.obstDivNm),
          DataGridCell<String>(columnName: 'obstStrctStndrdInfo', value: e.obstStrctStndrdInfo),
          DataGridCell<String>(columnName: 'dtaPrcsSittnCtnt', value: e.dtaPrcsSittnCtnt),
          DataGridCell<String>(columnName: 'cmpnstnQtyAraVu', value: e.cmpnstnQtyAraVu.toString()),
          DataGridCell<String>(columnName: 'cmpnstnThingUnitDivNm', value: e.cmpnstnThingUnitDivNm),
          DataGridCell<String>(columnName: 'aceptncUseBeginDe', value: e.aceptncUseBeginDe),
          DataGridCell<String>(columnName: 'aceptncAdjdcDt', value: e.aceptncAdjdcDt),
          DataGridCell<String>(columnName: 'aceptncAdjdcUpc', value: e.aceptncAdjdcUpc),
          DataGridCell<String>(columnName: 'aceptncAdjdcAmt', value: e.aceptncAdjdcAmt.toString()),
          DataGridCell<String>(columnName: 'adjdcRqstSqnc', value: e.adjdcRqstSqnc.toString()),
          DataGridCell<String>(columnName: 'cpsmnPymntStepDivCd', value: e.cpsmnPymntStepDivCd),
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