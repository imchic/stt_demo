import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/accdtlnvstg_lad_partcpnt_model.dart';

/// [AccdtlnvstgLadDatasource] 는 [DataGridSource] 를 상속받아 구현한 데이터 소스 클래스이다.

class AccdtlnvstgLadPartcpntDatasource extends DataGridSource {
  AccdtlnvstgLadPartcpntDatasource({required List<AccdtlnvstgLadPartcpntModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'ownerNo', value: e.ownerNo),
              DataGridCell<String>(columnName: 'partcpntNm', value: e.partcpntNm),
              DataGridCell<String>(columnName: 'cmpnstnPartcpntRsn', value: e.cmpnstnPartcpntRsn),
              DataGridCell<String>(columnName: 'partcpntAddr', value: e.partcpntAddr),
              DataGridCell<String>(columnName: 'partcpntZip', value: e.partcpntZip),
              DataGridCell<String>(columnName: 'partcpntTelno', value: e.partcpntTelno),
              DataGridCell<String>(columnName: 'partcpntMbtlnum', value: e.partcpntMbtlnum),
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
        child: Text(dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.sp)),
      );
    }).toList());
  }
}