import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stt_demo/item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ItemDataSource extends DataGridSource {

  ItemDataSource({required List<Item> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
              // select
              DataGridCell<bool>(columnName: 'select', value: e.select),
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
          if (dataGridCell.columnName == 'select') {
            return Container(
              alignment: Alignment.center,
              child: Checkbox(
                value: dataGridCell.value,
                onChanged: (value) {
                  final rowIndex = _items.indexOf(row);
                  final dataGridRow = _items[rowIndex];
                  _items[rowIndex] = DataGridRow(
                      cells: dataGridRow.getCells()
                        ..replaceRange(
                            0,
                            1,
                            [
                              DataGridCell<bool>(
                                  columnName: 'select', value: value)
                            ]));
                  notifyListeners();
                },
              ),
            );
          }
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(dataGridCell.value.toString()),
          );
        }).toList());
  }

}