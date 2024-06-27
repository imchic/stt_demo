import 'package:flutter/cupertino.dart';
import 'package:stt_demo/item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ItemDataSource extends DataGridSource {

  ItemDataSource({required List<Item> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
              // no
              DataGridCell<int>(columnName: 'no', value: e.no),
              // areaNo
              DataGridCell<int>(columnName: 'areaNo', value: e.areaNo),
              // bizName
              DataGridCell<String>(columnName: 'bizName', value: e.bizName),
              // bizCount
              DataGridCell<String>(columnName: 'bizCount', value: e.bizCount),
              // bizArea
              DataGridCell<String>(columnName: 'bizArea', value: e.bizArea),
              // bizDate
              DataGridCell<String>(columnName: 'bizDate', value: e.bizDate),
            ]))
        .toList();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
            // alignment: dataGridCell.columnName == 'isListening'
            //     ? Alignment.center
            //     : dataGridCell.columnName == 'id'
            //         ? Alignment.centerRight
            //         : Alignment.centerLeft,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: Text(dataGridCell.value.toString()),
          );
        }).toList());
  }

}