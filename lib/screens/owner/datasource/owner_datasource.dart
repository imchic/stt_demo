import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ldm/utils/common_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'model/owner_datasource_model.dart';

/// TM_LP20040 (LP_실태조사기본소유자정보)
///
/// 실태조사기본소유자정보 그리드 데이터소스

class OwnerDatasource extends DataGridSource {
  OwnerDatasource({required List<OwnerDataSourceModel> items}) {
    _items = items
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell(columnName: 'ownerNo', value: e.ownerNo),
              DataGridCell(columnName: 'ownerNm', value: e.ownerNm),
              //DataGridCell(columnName: 'posesnDivCd', value: e.posesnDivCd),
              DataGridCell(columnName: 'posesnDivNm', value: e.posesnDivNm),
              // DataGridCell(columnName: 'bsnsNo', value: e.bsnsNo),
              // DataGridCell(columnName: 'bsnsZoneNo', value: e.bsnsZoneNo),
              DataGridCell(columnName: 'ownerRgsbukAddr', value: e.ownerRgsbukAddr),
              DataGridCell(columnName: 'ownerRrnEnc', value: e.ownerRrnEnc),
              // DataGridCell(columnName: 'oldRegno', value: e.oldRegno),
              DataGridCell(columnName: 'ownerTelno', value: e.ownerTelno),
              DataGridCell(columnName: 'ownerMbtlnum', value: e.ownerMbtlnum),
              // DataGridCell(columnName: 'rgsbukZip', value: e.rgsbukZip),
              // DataGridCell(columnName: 'delvyZip', value: e.delvyZip),
              // DataGridCell(columnName: 'moisZip', value: e.moisZip)
              // DataGridCell(columnName: 'ownerDelvyAddr', value: e.ownerDelvyAddr),
              // DataGridCell(columnName: 'ownerMoisAddr', value: e.ownerMoisAddr),
              // DataGridCell(columnName: 'accdtInvstgRm', value: e.accdtInvstgRm),
              // DataGridCell(columnName: 'frstRgstrId', value: e.frstRgstrId),
              // DataGridCell(columnName: 'frstRegistDt', value: e.frstRegistDt),
              // DataGridCell(columnName: 'lastUpdusrId', value: e.lastUpdusrId),
              // DataGridCell(columnName: 'lastUpdtDt', value: e.lastUpdtDt),
              // DataGridCell(columnName: 'conectIp', value: e.conectIp),
              // DataGridCell(columnName: 'thingCnt', value: e.thingCnt),
              // DataGridCell(columnName: 'bsnsCnt', value: e.bsnsCnt),
              // DataGridCell(columnName: 'realOwnerNo', value: e.realOwnerNo),
              // DataGridCell(columnName: 'ownerDivCd', value: e.ownerDivCd),
              // DataGridCell(columnName: 'ownerRgsbukAddrFull', value: e.ownerRgsbukAddrFull),
              // DataGridCell(columnName: 'ownerDelvyAddrFull', value: e.ownerDelvyAddrFull),
              // DataGridCell(columnName: 'ownerMoisAddrFull', value: e.ownerMoisAddrFull),
            ]))
        .toList();
  }

  List<DataGridRow> _items = [];

  @override
  List<DataGridRow> get rows => _items;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(color: Colors.white,
        cells: row.getCells().map<Widget>((dataGridCell) {
      if(dataGridCell.columnName == 'ownerNo') {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 30.sp, color: Color(0xFF1D56BC))),
        );
      }

      if(dataGridCell.columnName == 'ownerNm') {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 30.sp)),
        );
      }

      if(dataGridCell.columnName == 'ownerRgsbukAddr') {
        return Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, maxLines: 3, style: TextStyle(fontSize: 30.sp)),
        );
      }
      
      if(dataGridCell.columnName == 'ownerRrnEnc') {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(maxFontSize: 20, CommonUtil.maskOwnerRegisterNo(dataGridCell.value.toString()), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp)),
        );
      }
      
      if(dataGridCell.columnName == 'ownerTelno' || dataGridCell.columnName == 'ownerMbtlnum') {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: AutoSizeText(maxFontSize: 20, CommonUtil.phoneHyphen(dataGridCell.value.toString()), overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 30.sp)),
        );
      }

      if(dataGridCell.columnName == 'posesnDivNm') {
        return Container(
          alignment: Alignment.center,
          //padding: const EdgeInsets.all(3.0),
          child: Container(
            alignment: Alignment.center,
            width: 70.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: dataGridCell.value.toString() == '국유'
                  ? Color(0xffFFBF00)
                  : dataGridCell.value.toString() == '공유'
                  ? Color(0xffFF7F50)
                  : dataGridCell.value.toString() == '사유'
                  ? Color(0xffFF4500)
                  : Color(0xffFF69B4),
              borderRadius: BorderRadius.circular(5.0),
            ), child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400, color: Colors.white)),
          ),
        );
      }

      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: AutoSizeText(maxFontSize: 20, dataGridCell.value.toString(), overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w400)),
      );
    }).toList());
  }

  // 주민등록번호 마스킹 처리
  // String maskOwnerRegisterNo(String ownerRegisterNo) {
  //   // 891208-1******
  //   print('ownerRegisterNo: $ownerRegisterNo');
  //   if(ownerRegisterNo.length == 13) {
  //     return '${ownerRegisterNo.substring(0, 7)}-1${'*' * 6}';
  //   }
  //   return ownerRegisterNo;
  // }

}