import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../screens/bsns/bsns_controller.dart';

/// [CustomGrid] 는 [StatefulWidget] 를 상속받아 구현한 데이터 그리드 위젯이다.
///
/// [dataSource] 는 [BsnsSelectAreaDataSource] 를 상속받아 구현한 데이터 소스 클래스이다.
/// [columns] 는 [GridColumn] 을 상속받아 구현한 컬럼 클래스이다.
/// [isShowCheckbox] 는 체크박스를 표시할지 여부를 결정한다.
/// [isSort] 는 정렬을 허용할지 여부를 결정한다.
/// [controller] 는 [DataGridController] 를 상속받아 구현한 컨트롤러 클래스이다.
/// [selectionEvent] 는 선택 이벤트를 처리하는 함수이다.
/// [stackedHeaderRows] 는 헤더를 그룹화하는 클래스이다.

class CustomGrid extends StatefulWidget {

  final DataGridSource dataSource;
  final List<GridColumn> columns;
  bool isShowCheckbox = false;
  bool isSort = true;
  final DataGridController controller;
  ColumnWidthMode columnWidthMode = ColumnWidthMode.none;
  Function(List<DataGridRow> addedRows, List<DataGridRow> removedRows) selectionEvent = _selectionEvent;
  List<StackedHeaderRow> stackedHeaderRows = [];

  CustomGrid({
    required this.dataSource,
    required this.columns,
    this.isShowCheckbox = false,
    this.isSort = true,
    required this.controller,
    this.columnWidthMode = ColumnWidthMode.fill,
    this.selectionEvent = _selectionEvent,
    this.stackedHeaderRows = const [],
  });

  static void _selectionEvent(List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
    print('addedRows: $addedRows');
  }

  @override
  State<CustomGrid> createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {

  @override
  Widget build(BuildContext context) {
    return SfDataGridTheme(
      data: SfDataGridThemeData(
        headerColor: Color(0xFFE5E8ED),
        sortIconColor: Theme.of(Get.context!).colorScheme.secondary,
        selectionColor: Colors.grey[200],
        indentColumnWidth: 0,
      ),
      child: SizedBox(
        child: SfDataGrid(
          headerRowHeight: 48.h,
          highlightRowOnHover: true,
          headerGridLinesVisibility: GridLinesVisibility.both,
          gridLinesVisibility: GridLinesVisibility.both,
          showCheckboxColumn: widget.isShowCheckbox,
          source: widget.dataSource,
          controller: widget.controller,
          columns: widget.columns,
          stackedHeaderRows: widget.stackedHeaderRows,
          navigationMode: GridNavigationMode.row,
          columnWidthMode: widget.columnWidthMode,
          columnSizer: ColumnSizer(),
          showHorizontalScrollbar: false,
          showVerticalScrollbar: false,
          showSortNumbers: true,
          allowSorting: widget.isSort,
          allowColumnsResizing: true,
          // allowFiltering: true,
          onColumnResizeStart: (ColumnResizeStartDetails details) {
            return true;
          },
          onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
            setState(() {
              BsnsController.to.columnWidths[details.column.columnName] = details.width;
            });
            return true;
          },
          onColumnResizeEnd: (ColumnResizeEndDetails details) {
            BsnsController.to.columnWidths[details.column.columnName] = details.width;
          },
          columnResizeMode: ColumnResizeMode.onResizeEnd,
          showColumnHeaderIconOnHover: true,
          selectionMode: SelectionMode.singleDeselect,
          onSelectionChanged: widget.selectionEvent,
        ),
      ),
    );
  }
}
