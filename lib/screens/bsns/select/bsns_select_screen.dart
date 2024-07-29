
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:stt_demo/screens/owner/lad/model/owner_lad_info_datasource_model.dart';
import 'package:stt_demo/widget/bsns_widget.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../components/base_header.dart';
import '../../../utils/custom_textfiled.dart';
import '../../../utils/dialog_util.dart';
import '../../../utils/colors.dart';
import '../../../utils/custom_grid.dart';
import '../../../widget/accdt_invstg_widget.dart';
import '../../../widget/owner_widget.dart';
import '../bsns_controller.dart';
import '../datasource/model/bsns_select_area_datasource_model.dart';

/// [BsnsSelectScreen] 사업선택 화면
class BsnsSelectScreen extends GetView<BsnsController> {
  const BsnsSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BsnsController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            // BaseHeader(),
            Expanded(
              child: Row(
                children: [
                  // 왼쪽 메뉴 버튼
                  Container(child: lnbWidget()),
                  // 메인 뷰
                  Expanded(
                    child: FutureBuilder(
                      future: controller.fetchBsnsList(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Obx(
                          () => IndexedStack(
                            index: controller.selectedIndex.value,
                            children: [
                              /// [사업선택] 화면
                              Column(
                                children: [
                                  BaseHeader(),
                                  Expanded(child: BsnsWidget.buildBsnsListView(controller)),
                                ],
                              ),
                              /// [소유자관리] 화면
                              Column(
                                children: [
                                  BaseHeader(),
                                  Expanded(child: OwnerWidget.buildOwnerView(controller)),
                                ],
                              ),
                              /// [실태조사] 화면
                              Column(
                                children: [
                                  BaseHeader(),
                                  Expanded(child: AccdtInvstgWidget.buildAccdtInvstgView(controller)),
                                ],
                              ),
                              /// [통계정보] 화면
                              Center(child: Text('통계정보')),
                              /// [고객카드] 화면
                              Center(child: Text('고객카드')),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  // 오른쪽 뷰
                  Obx(
                    () => controller.isRightSideExpanded.value
                        ? InkWell(
                            onTap: () {
                              if (controller.isRightSideExpanded.value) {
                                controller.isRightSideExpanded.toggle();
                              }
                            },
                            child: // fade out effect
                                // flutter animate slide
                                AnimatedContainer(
                              duration: const Duration(milliseconds: 5000),
                              curve: Curves.easeInOut,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text('지도영역'),
                              ),
                            ))
                        : AnimatedContainer(
                            duration: const Duration(milliseconds: 5000),
                            curve: Curves.easeInOut,
                            child: Container(
                              width: 0,
                            ),
                          ),
                  ),
                  Image.asset('assets/images/btn_gis.png'),
                ],
              ),
            ),
            // right drawer
          ],
        ),
      ),
      endDrawer: Drawer(
        width: Get.width * 0.85,
        child: Container(
          height: Get.height,
          color: Colors.white,
          child: Center(
            child: NaverMap(
              options: NaverMapViewOptions(
                  initialCameraPosition: NCameraPosition(
                      target: NLatLng(37.3595704, 127.105399),
                      zoom: 20),
                  indoorEnable: true,
                  locationButtonEnable: false,
                  consumeSymbolTapEvents: false),
                  onMapReady: (controller) async {
                  print('Map ready');
              },
            ),
          ),
        ),
      ),
    );
  }

  /// [lnbWidget] 왼쪽 메뉴 버튼
  Widget lnbWidget() {
    return Obx(
      () => Container(
        width: 104.w,
        decoration: BoxDecoration(
          color: lnbBg,
        ),
        child: Column(
          children: [
            Container(
              width: 104.w,
              height: 84.h,
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0XFF667185),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                child: SvgPicture.asset(
                  'assets/images/ic_kwater_logo.svg',
                  width: 68.w,
                  height: 48.h,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.leftNavItems.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    return InkWell(
                      onTap: () {
                        controller.selectedIndex.value = index;
                      },
                      child: Container(
                        width: 120.w,
                        height: 80.h,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: controller.selectedIndex.value == index
                              ? Color(0xFF2287EF)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/images/ic_menu_${index + 1}.svg',
                                width: 20.w,
                                height: 20.h,
                                color: Colors.white),
                            SizedBox(height: 4.h),
                            Text(controller.leftNavItems[index],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// [buildTable] 테이블
  Widget buildTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(0.35),
        1: FlexColumnWidth(2),
      },
      //defaultColumnWidth: const FlexColumnWidth(1),
      border: TableBorder.all(color: gray300),
      children: [
        TableRow(
          children: [
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: AutoSizeText('관련고시번호',
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp))),
              ),
            ),
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: Center(
                    child: Text('세종특별자치시 고시 2022호 2021-01-01',
                        style: TextStyle(fontSize: 12.sp))),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text('시행방법',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp))),
              ),
            ),
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child:
                    Center(child: Text('-', style: TextStyle(fontSize: 12.sp))),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Container(
                // height: 120,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text('사업목적',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2)),
              ),
            ),
            TableCell(
              child: Container(
                // height: 120,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: Center(
                    child: Text(
                        '홍수 범람 및 피해 등 재해발생 위험성이 높은 하천(대교천)에 대하여 제방축조 및 호안정비 등 하천정비를 시행하여 재해를 사전에 예방하고자 함',
                        style: TextStyle(fontSize: 12.sp))),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text('사업규모',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp))),
              ),
            ),
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child:
                    Center(child: Text('-', style: TextStyle(fontSize: 12.sp))),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text('근거법령',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp))),
              ),
            ),
            TableCell(
              child: Container(
                // height: 40,
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child:
                    Center(child: Text('-', style: TextStyle(fontSize: 12.sp))),
              ),
            ),
          ],
        ),
      ],
    );
  }

  ///  사업선택 -> 사업구역 선택
  Widget buildBsnsSelectAreaListDataGrid() {
    return CustomGrid(
      dataSource: controller.bsnsListDataSource.value,
      controller: controller.bsnsListDataGridController,
      isSort: false,
      columnWidthMode: ColumnWidthMode.fill,
      columns: [
        gridColumn('bsnsZoneNo', 'No.'),
        gridColumn('bsnsZoneNm', '사업구역명'),
        gridColumn('lotCnt', '필지수'),
        gridColumn('bsnsAra', '면적(㎡)'),
        gridColumn('bsnsReadngPblancDe', '열람공고일'),
      ],
      selectionEvent:
          ((List<DataGridRow> addedRows, List<DataGridRow> removedRows) async {
        final index =
            controller.bsnsListDataSource.value.rows.indexOf(addedRows.first);
        var getRow = controller.bsnsListDataSource.value.rows[index];

        var bsnsZoneNo = getRow.getCells()[0].value;
        var bsnsZoneNm = getRow.getCells()[1].value;
        var lotCnt = getRow.getCells()[2].value;
        var bsnsAra = getRow.getCells()[3].value;
        var bsnsReadngPblancDe = getRow.getCells()[4].value;

        controller.bsnsSelectAreaDataSource.value =
            BsnsSelectAreaDataSourceModel(
                bsnsZoneNo: bsnsZoneNo,
                bsnsZoneNm: bsnsZoneNm,
                lotCnt: lotCnt,
                bsnsAra: bsnsAra,
                bsnsReadngPblancDe: bsnsReadngPblancDe);

        print(
            '사업구역 선택: $bsnsZoneNo, $bsnsZoneNm, $lotCnt, $bsnsAra, $bsnsReadngPblancDe');

        DialogUtil.showAlertDialog(
          Get.context!,
          '사업 구역 선택',
          RichText(text: TextSpan(
            children: [
              TextSpan(
                text: '${controller.bsnsSelectAreaDataSource.value.bsnsZoneNm}',
                style: TextStyle(
                  color: Theme.of(Get.context!).colorScheme.primary,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: ' 사업구역을 선택하시겠습니까?',
                style: TextStyle(
                  color: Color(0xFF1D1D1D),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )),
          () {
            controller.bsnsTabController.animateTo(2);
            controller.handleSelectListTab(controller.bsnsSelectTabIsSelected, 2);
            Get.back();
          },
          () {
            Get.back();
          },
        );
      }),
    );
  }

  // 사업선택 -> 조사 차수
  /// [buildBsnsSqncDataGrid] 데이터그리드
  Widget buildBsnsSqncDataGrid() {
    return CustomGrid(
      dataSource: controller.bsnsSqncDataSource.value,
      controller: controller.bsnsOrderDataGridController,
      columnWidthMode: ColumnWidthMode.fill,
      isSort: false,
      columns: [
        gridColumn('bsnsSqnc', '차수'),
        gridColumn('bsnsStrtDe', '시작날짜'),
        gridColumn('bsnsEndDe', '종료날짜'),
      ],
    );
  }

  /// 소유자관리 -> 소유자검색
  /// [buildBsnsOwnerDataGrid] 데이터그리드
  Widget buildBsnsOwnerDataGrid() {
    return CustomGrid(
      dataSource: controller.bsnsOwnerDataSource.value,
      controller: controller.bsnsOwnerDataGridController,
      isSort: false,
      columnWidthMode: ColumnWidthMode.fill,
      selectionEvent:
          ((List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
        print('선택된 소유자: ${addedRows.first.getCells()[2].value}');
      }),
      columns: [
        gridColumn('ownerNo', '소유자번호'),
        gridColumn('ladLdgrOwnerNm', '소유자명'),
        gridColumn('ladLdgrPosesnDivCd', '소유자구분'),
        gridColumn('ownerRegisterNo', '등록번호'),
        gridColumn('ownerTelNo', '전화번호'),
        gridColumn('ownerPhoneNo', '핸드폰번호'),
      ],
    );
  }

  /// [buildOwnerMngSearch] 소유자 관리 -> 토지정보 검색
  Widget buildOwnerLadInfoDataGrid() {
    return CustomGrid(
      dataSource: controller.ownerLadInfoDataSource.value,
      controller: controller.ownerLadInfoDataGridController,
      isSort: false,
      freezeColumnCount: 0,
      stackedHeaderRows: [
        StackedHeaderRow(cells: [
          StackedHeaderCell(
              columnNames: ['ofcbkLndcgrDivCd', 'sttusLndcgrDivCd'],
              child: Container(
                  alignment: Alignment.center,
                  child: Text('지목',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: gray700)))),
          StackedHeaderCell(
              columnNames: ['ofcbkAra', 'incrprAra', 'cmpnstnInvstgAra'],
              child: Container(
                  alignment: Alignment.center,
                  child: Text('면적(㎡)',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: gray700)))),
        ]),
      ],
      selectionEvent: ((List<DataGridRow> addedRows, List<DataGridRow> removedRows) {

        final index = controller.ownerLadInfoDataSource.value.rows.indexOf(addedRows.first);
        var getRow = controller.ownerLadInfoDataSource.value.rows[index];

       var data = OwnerLadInfoDatasourceModel(
          lgdongNm: getRow.getCells()[0].value,
          lcrtsDivCd: getRow.getCells()[1].value,
          mlnoLtno: getRow.getCells()[2].value,
          slnoLtno: getRow.getCells()[3].value,
          ofcbkLndcgrDivCd: getRow.getCells()[4].value,
          sttusLndcgrDivCd: getRow.getCells()[5].value,
          ofcbkAra: getRow.getCells()[6].value,
          incrprAra: getRow.getCells()[7].value,
          cmpnstnInvstgAra: getRow.getCells()[8].value,
          acqsPrpDivCd: getRow.getCells()[9].value,
          aceptncPrpDivCd: getRow.getCells()[10].value,
          accdtInvstgSqnc: getRow.getCells()[11].value,
          invstgDt: getRow.getCells()[12].value,
          cmpnstnDtaChnStatDivCd: getRow.getCells()[13].value,
          etc: getRow.getCells()[14].value,
        );

        print('선택된 소유자: ${data.toString()}');

        controller.selectedOwnerLadInfoData.value = data;
        controller.fetchAccdtlnvstgOwnerDataSource();

        controller.handleAccdtlnvstgLadTabSelected(1);

      }),
      columns: [
        gridColumn('lgdongNm', '소재지'),
        gridColumn('lcrtsDivCd', '특지'),
        gridColumn('mlnoLtno', '본번'),
        gridColumn('slnoLtno', '부번'),
        gridColumn('ofcbkLndcgrDivCd', '공부'),
        gridColumn('sttusLndcgrDivCd', '현황'),
        gridColumn('ofcbkAra', '공부'),
        gridColumn('incrprAra', '편입'),
        gridColumn('cmpnstnInvstgAra', '조사'),
        gridColumn('acqsPrpDivCd', '취득용도'),
        gridColumn('aceptncPrpDivCd', '수용/사용'),
        gridColumn('accdtInvstgSqnc', '조사차수'),
        gridColumn('invstgDt', '조사일'),
        gridColumn('cmpnstnDtaChnStatDivCd', '보상진행단계'),
        gridColumn('etc', '비고'),
      ],
    );
  }

  /// [buildOwnerObstInfoDataGrid] 데이터그리드
  Widget buildOwnerObstInfoDataGrid() {
    return CustomGrid(
      dataSource: controller.ownerObstInfoDataSource.value,
      controller: controller.ownerObstInfoDataGridController,
      isSort: false,
      columns: [
        gridColumn('lgdongNm', '소재지'),
        gridColumn('lcrtsDivCd', '특지'),
        gridColumn('mlnoLtno', '본번'),
        gridColumn('slnoLtno', '부번'),
        gridColumn('obstSeq', '지장물순번'),
        gridColumn('obstDivCd', '지장물구분'),
        gridColumn('cmpnstnThingKndDtls', '물건의종류'),
        gridColumn('obstStrctStndrdInfo', '구조 및 규격'),
        gridColumn('cmpnstnQtyAraVu', '수량(면적)'),
        gridColumn('cmpnstnThingUnitDivCd', '단위'),
        gridColumn('sttusLndcgrDivCd', '현황지목'),
        gridColumn('acqsPrpDivCd', '취득용도'),
        gridColumn('aceptncUseDivCd', '수용용도'),
        gridColumn('accdtInvstgSqnc', '조사차수'),
        gridColumn('invstgDt', '조사일'),
        gridColumn('cmpnstnStepDivCd', '보상진행단계'),
        gridColumn('spcitm', '특이사항'),
      ],
    );
  }

  Widget buildAccdtlnvstgOwnerDataGrid() {
    return CustomGrid(
      dataSource: controller.accdtlnvstgOwnerLadDataSource.value,
      controller: controller.accdtlnvstgLadOwnerDataGridController,
      isSort: false,
      columns: [
        gridColumn('lgdongNm', '소재지'),
        gridColumn('lcrtsDivCd', '특지'),
        gridColumn('mlnoLtno', '본번'),
        gridColumn('slnoLtno', '부번'),
        gridColumn('ofcbkLndcgrDivCd', '공부'),
        gridColumn('sttusLndcgrDivCd', '현황'),
        gridColumn('ofcbkAra', '공부'),
        gridColumn('incrprAra', '편입'),
        gridColumn('cmpnstnInvstgAra', '조사'),
        gridColumn('acqsPrpDivCd', '취득용도'),
        gridColumn('aceptncPrpDivCd', '수용/사용'),
        gridColumn('accdtInvstgSqnc', '조사차수'),
        gridColumn('invstgDt', '조사일'),
        gridColumn('cmpnstnDtaChnStatDivCd', '보상진행단계'),
        gridColumn('etc', '비고'),
      ],
    );
  }

  Widget buildAccdtlnvstgLadOwnerStatusDataGrid() {
    return CustomGrid(
      dataSource: controller.accdtlnvstgLadOwnerDataSource.value,
      controller: controller.accdtlnvstgLadOwnerDataGridController,
      isSort: false,
      columns: [
        gridColumn('ownerNo', '소유자번호'),
        gridColumn('ladLdgrOwnerNm', '소유자명'),
        gridColumn('ladLdgrPosesnDivCd', '소유자구분'),
        gridColumn('ownerTypeDetail', '지분분자'),
        gridColumn('ownerDetail2', '지분분모'),
        gridColumn('ownerRegisterNo', '등록번호'),
      ],
    );
  }

  /// [buildAccdtlnvstgLadPartcpntStatusDataGrid] 데이터그리드
  Widget buildAccdtlnvstgLadPartcpntStatusDataGrid() {
    return CustomGrid(
      dataSource: controller.accdtlnvstgLadPartcpntDataSource.value,
      controller: controller.accdtlnvstgLadPartcpntDataGridController,
      isSort: false,
      columns: [
        gridColumn('ownerNo', '소유자번호'),
        gridColumn('ownerName', '관계구분'),
        gridColumn('ownerType', '성명'),
        gridColumn('ownerTypeDetail', '주소'),
        gridColumn('ownerDetail2', '우편번호'),
        gridColumn('ownerRegisterNo', '전화번호'),
      ],
    );
  }

  /// [buildAccdtlnvstgObstDataGrid] 데이터그리드
  /// [실태조사 > 지장물현황]
  Widget buildAccdtlnvstgObstDataGrid() {
    return CustomGrid(
      dataSource: controller.accdtlnvstgObstDataSource.value,
      controller: controller.accdtlnvstgObstDataGridController,
      isSort: false,
      stackedHeaderRows: [
        StackedHeaderRow(cells: [
          StackedHeaderCell(
              columnNames: ['invstrEmpNo', 'invstrJgrdNm', 'invstrNm'],
              child: Container(
                  alignment: Alignment.center,
                  child: Text('조사자',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: gray700)))),
          StackedHeaderCell(
              columnNames: ['obsrverNm', 'accdtInvstgObsrverAddr'],
              child: Container(
                  alignment: Alignment.center,
                  child: Text('입회자',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: gray700)))),
        ]),
      ],
      columns: [
        gridColumn('obstSeq', '지장물순번'),
        gridColumn('obstDivCd', '지장물구분'),
        gridColumn('cmpnstnThingKndDtls', '물건의종류'),
        gridColumn('obstStrctStndrdInfo', '구조 및 규격'),
        gridColumn('cmpnstnQtyAraVu', '수량(면적)'),
        gridColumn('cmpnstnThingUnitDivCd', '단위'),
        gridColumn('invstrEmpNo', '사번'),
        gridColumn('invstrJgrdNm', '직급'),
        gridColumn('invstrNm', '성명'),
        gridColumn('obsrverNm', '성명'),
        gridColumn('accdtInvstgObsrverAddr', '주소'),
        gridColumn('acddtInvstgSqnc', '조사차수'),
        gridColumn('invstgDt', '조사일'),
        gridColumn('spcitm', '비고'),
      ],
    );
  }

  GridColumn gridColumn(String columnName, String label) {
    return GridColumn(
        //width: controller.columnWidths[columnName]!,
        columnName: columnName,
        visible: true,
        label: Container(
            height: 48.h,
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: Text(label,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                    color: Color(0xFF1D1D1D)))));
  }

  /// [buildBsnsSearch] 검색
  Widget buildBsnsSearch() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text('사업명',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: gray600)),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: gray300),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: TextField(
                    controller: controller.bsnsNameSearchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '사업명을 입력하세요',
                      hintStyle: TextStyle(fontSize: 12.sp, color: gray500),
                      // contentPadding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.all(12.r),
                      suffixIcon: IconButton(
                        onPressed: () {
                          //controller.search();
                        },
                        icon: Icon(Icons.search, size: 20.sp, color: gray500),
                      ),
                    ),
                    onChanged: (value) {
                      controller.searchBsnsName(value);
                    },
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                flex: 1,
                child: Text('사업번호',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: gray600)),
              ),
              SizedBox(width: 10.w),
              Expanded(
                flex: 8,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: gray300),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: TextField(
                    controller: controller.bsnsNoSearchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '사업번호를 입력하세요',
                      hintStyle: TextStyle(fontSize: 12.sp, color: gray500),
                      contentPadding: EdgeInsets.all(12.r),
                      suffixIcon: IconButton(
                        onPressed: () {
                          //controller.search();
                        },
                        icon: Icon(Icons.search, size: 20.sp, color: gray500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          buildBsnsRadio(),
        ],
      ),
    );
  }

  /// [buildOwnerMngSearch] 소유자관리 검색
  Widget buildOwnerMngSearch() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text('소재지',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: gray600)),
              ),
              Expanded(
                flex: 8,
                child: CustomTextFiled(
                  controller: controller.ownerNameSearchController,
                  hintText: '소유자명을 입력하세요',
                  onChanged: (value) {
                    //controller.searchOwnerName(value);
                  },
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Row(
                  children: [
                    Text('본번',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: gray600)),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomTextFiled(
                        controller: controller.ownerRegisterNoSearchController,
                        hintText: '본번',
                        onChanged: (value) {
                          //controller.searchOwnerName(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Row(
                  children: [
                    Text('부번',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: gray600)),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomTextFiled(
                        controller: controller.ownerRegisterNoSearchController,
                        hintText: '부번',
                        onChanged: (value) {
                          //controller.searchOwnerName(value);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          buildOwnerMngRadio(),
        ],
      ),
    );
  }

  /// [buildBsnsRadio] 라디오 버튼
  Widget buildBsnsRadio() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('사업구분',
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff1D1D1D))),
        SizedBox(width: 10.w),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Radio(
            value: 0,
            groupValue: controller.radioValue.value,
            onChanged: (value) {
              controller.handleRadioValueChange(value ?? 0);
            },
          ),
        ),
        SizedBox(width: 5.w),
        Text('댐',
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff1D1D1D))),
        SizedBox(width: 10.w),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Radio(
            value: 1,
            groupValue: controller.radioValue.value,
            onChanged: (value) {
              controller.handleRadioValueChange(value ?? 0);
            },
          ),
        ),
        SizedBox(width: 8.w),
        Text('수도용지',
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff1D1D1D))),
        SizedBox(width: 10.w),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Radio(
            value: 2,
            groupValue: controller.radioValue.value,
            onChanged: (value) {
              controller.handleRadioValueChange(value ?? 0);
            },
          ),
        ),
        SizedBox(width: 5.w),
        Text('택지개발',
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff1D1D1D))),
        SizedBox(width: 10.w),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Radio(
            value: 3,
            groupValue: controller.radioValue.value,
            onChanged: (value) {
              controller.handleRadioValueChange(value ?? 0);
            },
          ),
        ),
        SizedBox(width: 5.w),
        Text('기타',
            style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff1D1D1D))),
      ],
    );
  }

  /// [buildOwnerMngRadio] 라디오 버튼
  Widget buildOwnerMngRadio() {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('소유자구분',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff1D1D1D))),
          SizedBox(width: 10.w),
          Container(
            width: 24.w,
            height: 24.h,
            child: Radio(
              value: 0,
              groupValue: controller.radioValue.value,
              onChanged: (value) {
                //controller.changeRadioValue(value);
              },
            ),
          ),
          SizedBox(width: 5.w),
          Text('소유자',
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff1D1D1D))),
          SizedBox(width: 10.w),
          Container(
            width: 24.w,
            height: 24.h,
            child: Radio(
              value: 1,
              groupValue: controller.radioValue.value,
              onChanged: (value) {
                //controller.changeRadioValue(value);
              },
            ),
          ),
          SizedBox(width: 8.w),
          Text('관계인',
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff1D1D1D))),
        ],
      ),
    );
  }
}
