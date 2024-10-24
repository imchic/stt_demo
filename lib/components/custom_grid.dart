import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../screens/lp_controller.dart';
import '../utils/applog.dart';

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
  ColumnWidthMode columnWidthMode = ColumnWidthMode.fill;
  Function(List<DataGridRow> addedRows, List<DataGridRow> removedRows) selectionEvent = _selectionEvent;
  List<StackedHeaderRow> stackedHeaderRows = [];
  int freezeColumnCount = 0;
  bool isSelect = true;
  ScrollController? horizontalScrollController;

  CustomGrid({
    required this.dataSource,
    required this.columns,
    this.isShowCheckbox = false,
    this.isSort = true,
    required this.controller,
    this.columnWidthMode = ColumnWidthMode.fill,
    this.selectionEvent = _selectionEvent,
    this.stackedHeaderRows = const [],
    this.freezeColumnCount = 0,
    this.isSelect = true,
    this.horizontalScrollController
  });

  static void _selectionEvent(List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
    AppLog.d('addedRows: $addedRows');
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
        sortIconColor: Colors.grey[800],
        selectionColor: Colors.blue.withOpacity(0.2),
        indentColumnWidth: 0,
        headerHoverColor: Color(0xFFE5E8ED),
      ),
      child: SfDataGrid(
        headerRowHeight: 1.w > 1.h ? 80.sp : 100.sp,
        // rowHeight: 1.w > 1.h ? 60.sp : 100.sp,
        source: widget.dataSource,
        controller: widget.controller,
        columns: widget.columns,
        allowPullToRefresh: false,
        frozenColumnsCount: widget.freezeColumnCount,
        highlightRowOnHover: true,
        headerGridLinesVisibility: GridLinesVisibility.both,
        gridLinesVisibility: GridLinesVisibility.both,
        showCheckboxColumn: widget.isShowCheckbox,
        stackedHeaderRows: widget.stackedHeaderRows,
        allowEditing: true,
        navigationMode: GridNavigationMode.cell,
        columnWidthMode: widget.columnWidthMode,
        columnSizer: ColumnSizer(),
        // showHorizontalScrollbar: false,
        // showVerticalScrollbar: false,
        showSortNumbers: true,
        allowSorting: widget.isSort,
        allowColumnsResizing: true,
        // allowFiltering: true,
        horizontalScrollController: widget.horizontalScrollController,
        onColumnResizeStart: (ColumnResizeStartDetails details) {
          return true;
        },
        onColumnResizeUpdate: (ColumnResizeUpdateDetails details) {
          setState(() {
            //LpController.to.columnWidths[details.column.columnName] = details.width;
          });
          return true;
        },
        onColumnResizeEnd: (ColumnResizeEndDetails details) {
          //LpController.to.columnWidths[details.column.columnName] = details.width;
        },
        // onQueryRowHeight: (details) {
        //   return details.getIntrinsicRowHeight(details.rowIndex,
        //       excludedColumns: ['bsnsZoneNm'], canIncludeHiddenColumns: true);
        // },
        // onQueryRowHeight: (details) {
        //   return details.getIntrinsicRowHeight(details.rowIndex);
        // },
        columnResizeMode: ColumnResizeMode.onResizeEnd,
        showColumnHeaderIconOnHover: true,
        selectionMode: widget.isSelect ? SelectionMode.single : SelectionMode.singleDeselect,
        //selectionMode: SelectionMode.single,
        onSelectionChanged: widget.selectionEvent,
        footerHeight: 0,
        editingGestureType: EditingGestureType.doubleTap,
      ),
    );
  }
}
