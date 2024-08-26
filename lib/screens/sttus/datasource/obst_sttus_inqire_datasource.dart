import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldi/screens/sttus/datasource/model/lad_sttus_inqire_model.dart';
import 'package:ldi/screens/sttus/datasource/model/obst_sttus_inqire_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// [ObstSttusInqireDatasource] is a datasource class for [SfDataGrid] widget

class ObstSttusInqireDatasource extends DataGridSource {
  ObstSttusInqireDatasource({required List<ObstSttusInqireModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'lgdongNm', value: e.lgdongNm),
              DataGridCell<String>(columnName: 'lcrtsDivCd', value: e.lcrtsDivCd),
              DataGridCell<String>(columnName: 'mlnoLtno', value: e.mlnoLtno),
              DataGridCell<String>(columnName: 'slnoLtno', value: e.slnoLtno),

              DataGridCell<String>(columnName: 'cmpnstnStepDivCd', value: e.cmpnstnStepDivCd),
              DataGridCell<String>(columnName: 'acqsPrpDivCd', value: e.acqsPrpDivCd),

              DataGridCell<String>(columnName: 'rqestNo', value: e.rqestNo.toString()),
              DataGridCell<String>(columnName: 'invstgDe', value: e.invstgDe),
              DataGridCell<num>(columnName: 'accdtInvstgSqnc', value: e.accdtInvstgSqnc),

              DataGridCell<String>(columnName: 'ownerNo', value: e.ownerNo.toString()),
              DataGridCell<String>(columnName: 'posesnDivCd', value: e.posesnDivCd),
              DataGridCell<String>(columnName: 'ownerNm', value: e.ownerNm),
              DataGridCell<String>(columnName: 'ownerRgsbukAddr', value: e.ownerRgsbukAddr),
              DataGridCell<String>(columnName: 'posesnShreNmrtrInfo', value: e.posesnShreNmrtrInfo.toString()),
              DataGridCell<String>(columnName: 'posesnShreDnmntrInfo', value: e.posesnShreDnmntrInfo.toString()),

              DataGridCell<String>(columnName: 'apasmtReqestDivCd', value: e.apasmtReqestDivCd),
              DataGridCell<num>(columnName:   'apasmtSqnc', value: e.apasmtSqnc),
              DataGridCell<String>(columnName: 'prcPnttmDe', value: e.prcPnttmDe),

              DataGridCell<String>(columnName: 'apasmtInsttNm1', value: e.apasmtInsttNm1),
              DataGridCell<String>(columnName: 'apasmtInsttEvlUpc1', value: e.apasmtInsttEvlUpc1.toString()),
              DataGridCell<String>(columnName: 'apasmtInsttEvamt1', value: e.apasmtInsttEvamt1.toString()),

              DataGridCell<String>(columnName: 'apasmtInsttNm2', value: e.apasmtInsttNm2),
              DataGridCell<String>(columnName: 'apasmtInsttEvlUpc2', value: e.apasmtInsttEvlUpc2.toString()),
              DataGridCell<String>(columnName: 'apasmtInsttEvamt2', value: e.apasmtInsttEvamt2.toString()),

              DataGridCell<String>(columnName: 'apasmtInsttNm3', value: e.apasmtInsttNm3),
              DataGridCell<String>(columnName: 'apasmtInsttEvlUpc3', value: e.apasmtInsttEvlUpc3.toString()),
              DataGridCell<String>(columnName: 'apasmtInsttEvamt3', value: e.apasmtInsttEvamt3.toString()),

              DataGridCell<String>(columnName: 'cmpnstnCmptnUpc', value: e.cmpnstnCmptnUpc.toString()),
              DataGridCell<String>(columnName: 'cpsmnCmptnAmt', value: e.cpsmnCmptnAmt.toString()),

              DataGridCell<String>(columnName: 'caPymntRequstDe', value: e.caPymntRequstDe),
              DataGridCell<String>(columnName: 'cmpnstnDscssUpc', value: e.cmpnstnDscssUpc.toString()),
              DataGridCell<String>(columnName: 'cmpnstnDscssTotAmt', value: e.cmpnstnDscssTotAmt.toString()),

              DataGridCell<String>(columnName: 'dcsUpc', value: e.dcsUpc.toString()),
              DataGridCell<String>(columnName: 'dcsAmt', value: e.dcsAmt.toString()),
              DataGridCell<String>(columnName: 'dcsDt', value: e.dcsDt),
              DataGridCell<String>(columnName: 'aceptncUseBeginDe', value: e.aceptncUseBeginDe),
              DataGridCell<String>(columnName: 'ldPymntRequstDe', value: e.ldPymntRequstDe),
              DataGridCell<String>(columnName: 'ldCpsmnPymntLdgmntDivCd', value: e.ldCpsmnPymntLdgmntDivCd),

              DataGridCell<String>(columnName: 'proUpc', value: e.proUpc.toString()),
              DataGridCell<String>(columnName: 'proAmt', value: e.proAmt.toString()),
              DataGridCell<String>(columnName: 'proDt', value: e.proDt),
              DataGridCell<String>(columnName: 'proPymntRequstDe', value: e.proPymntRequstDe),
              DataGridCell<String>(columnName: 'proCpsmnPymntLdgmntDivCd', value: e.proCpsmnPymntLdgmntDivCd),
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