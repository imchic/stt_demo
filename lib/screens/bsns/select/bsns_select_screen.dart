import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ldi/screens/bsns/sqnc/model/bsns_sqnc_datasource_model.dart';
import 'package:ldi/screens/owner/obst/model/owner_obst_info_datasource_model.dart';
import 'package:ldi/utils/applog.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../components/base_header.dart';
import '../../../components/custom_grid.dart';
import '../../../components/custom_radio.dart';
import '../../../components/custom_textfield.dart';
import '../../../utils/colors.dart';
import '../../../utils/dialog_util.dart';
import '../../../widget/accdt_invstg_widget.dart';
import '../../../widget/bsns_widget.dart';
import '../../../widget/customercard_widget.dart';
import '../../../widget/owner_widget.dart';
import '../../../widget/sttus_widget.dart';
import '../../owner/lad/model/owner_lad_info_datasource_model.dart';
import '../bsns_controller.dart';
import '../sqnc/model/bsns_accdtinvstg_sqnc_model.dart';
import 'bsns_plan_select_area_model.dart';

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
            Expanded(
              child: Row(
                children: [
                  // 왼쪽 메뉴 버튼
                  Container(child: lnbWidget()),
                  // 메인 뷰
                  Expanded(
                    child: Obx(
                      () => PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: controller.pageController,
                        onPageChanged: (index) {
                          controller.selectedIndex.value = index;
                          controller.isBsnsZoneSelectFlag.value = false;
                          controller.isBsnsSqncSelectFlag.value = false;
                          controller.isBsnsSelectFlag.value = false;

                          // 사업구역 선택이 안됐을 경우
                          if (controller.selectedBsnsSelectArea.value.bsnsNo ==
                                  null &&
                              controller.selectedBsnsSelectArea.value
                                      .bsnsZoneNo ==
                                  null) {
                            DialogUtil.showSnackBar(
                                context, '사업구역', '사업구역을 선택해주세요.');
                            controller.pageController.jumpToPage(0);
                            return;
                          }

                          if (index == 1 || index == 4) {
                            /// [소유자 및 관리인] 조회
                            controller.fetchBsnsOwnerDataSource();
                          }

                          if (index == 3) {
                            /// [통계정보] 조회
                            controller.fetchLadSttusInqireDataSource();
                            controller.fetchObstSttusInqireDataSource();
                          }
                        },
                        children: [
                          /// [사업선택] 화면
                          Column(
                            children: [
                              BaseHeader(),
                              Expanded(
                                  child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: BsnsWidget.buildBsnsListView(
                                          controller)),
                                  // 오른쪽 뷰
                                  Obx(() {
                                    return Expanded(
                                      flex: controller.isBsnsSelectFlag == true
                                          ? 1
                                          : 0,
                                      child: Column(
                                        children: [
                                          if (controller.selectedIndex.value ==
                                              0)

                                            // 사업구역
                                            controller.isBsnsSelectFlag == true
                                                ? BsnsWidget
                                                    .buildBsnsSelectZoneContainer(
                                                        controller)
                                                : Container(),

                                          // 조사차수
                                          controller.isBsnsZoneSelectFlag ==
                                                  true
                                              ? BsnsWidget
                                                  .buildBsnsSelectSqncContainer(
                                                      controller)
                                              : Container(),
                                        ],
                                      ),
                                    );
                                  }),
                                ],
                              )),
                            ],
                          ),

                          /// [소유자관리] 화면
                          Column(
                            children: [
                              BaseHeader(),
                              Expanded(
                                  child:
                                      OwnerWidget.buildOwnerView(controller)),
                            ],
                          ),

                          /// [실태조사] 화면
                          Column(
                            children: [
                              BaseHeader(),
                              Expanded(
                                  child: AccdtInvstgWidget.buildAccdtInvstgView(
                                      controller)),
                            ],
                          ),

                          /// [통계정보] 화면
                          //Center(child: AutoSizeText('통계정보 개발 준비중입니다 😃')),
                          Column(
                            children: [
                              BaseHeader(),
                              Expanded(
                                  child:
                                      SttusWidget.buildSttusView(controller)),
                            ],
                          ),

                          /// [고객카드] 화면
                          // Center(child: AutoSizeText('고객카드 개발 준비중입니다 😃')),
                          Column(
                            children: [
                              BaseHeader(),
                              Expanded(
                                  child: CustomerCardWidget.buildCustomerCard(
                                      controller))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // // 오른쪽 뷰
                  // Obx(() {
                  //   return Expanded(
                  //     flex: controller.isBsnsSelectFlag == true ? 4 : 0,
                  //     child: Column(
                  //       children: [
                  //         if (controller.selectedIndex.value == 0)
                  //
                  //           // 사업구역
                  //           controller.isBsnsSelectFlag == true
                  //               ? BsnsWidget.buildBsnsSelectZoneContainer(controller)
                  //               : Container(),
                  //
                  //           // 조사차수
                  //           controller.isBsnsZoneSelectFlag == true
                  //               ? BsnsWidget.buildBsnsSelectSqncContainer(controller)
                  //               : Container(),
                  //
                  //       ],
                  //     ),
                  //   );
                  // }),

                  /// 슬라이드 패널
                  Builder(
                    builder: (context) => InkWell(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/ic_gis_open.svg',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // right drawer
          ],
        ),
      ),
      endDrawer: Drawer(
        width: Get.width * 0.95,
        child: NaverMap(
          options: NaverMapViewOptions(
            initialCameraPosition: NCameraPosition(
              target: NLatLng(37.3595704, 127.105399),
              zoom: 15,
            ),
            mapType: NMapType.hybrid,
          ),
          onMapReady: (controller) {
            debugPrint("네이버 맵 로딩됨!");
          },
        ),
      ),
    );
  }

  /// [lnbWidget] 왼쪽 메뉴 버튼
  Widget lnbWidget() {
    return Obx(
      () => Container(
        width: 1.w > 1.h ? 210.w : 308.w,
        decoration: BoxDecoration(
          color: lnbBg,
        ),
        child: Column(
          children: [
            Container(
              //width: 208.w,
              width: 1.w > 1.h ? 208.w : 308.w,
              height: 160.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Color(0xFF667185),
                // color: Colors.red,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //color: Colors.green,
                    child: SvgPicture.asset(
                      'assets/icons/ic_kwater_logo.svg',
                      width: 136.w,
                      height: 64.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.leftNavItems.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    return InkWell(
                        onTap: () {
                          //controller.selectedIndex.value = index;
                          controller.pageController.jumpToPage(index);
                        },
                        child: Container(
                          width: 1.w > 1.h ? 208.w : 308.w,
                          height: 160.h,
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          decoration: BoxDecoration(
                            color: controller.selectedIndex.value == index
                                ? Color(0xFF2287EF)
                                : Colors.transparent,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 1.w > 1.h ? 40.w : 60.w,
                                height: 1.w > 1.h ? 40.h : 60.h,
                                child: SvgPicture.asset(
                                    'assets/icons/ic_menu_${index + 1}.svg',
                                    width: 1.w > 1.h ? 40.w : 60.w,
                                    height: 1.w > 1.h ? 40.h : 60.h,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 8.h),
                              AutoSizeText(controller.leftNavItems[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 1.w > 1.h ? 30.sp : 42.sp,
                                      fontWeight: FontWeight.w500),
                                  //overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center),
                            ],
                          ),
                        ));
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
    return Container(
      width: double.infinity,
      child: Table(
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
                verticalAlignment: TableCellVerticalAlignment.fill,
                child: Container(
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E8ED),
                    border: Border.all(color: gray300),
                  ),
                  child: Center(
                      child: AutoSizeText(
                    '관련고시번호',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1D1D1D),
                      fontSize: 1.w > 1.h ? 30.sp : 50.sp,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  )),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: AutoSizeText(
                    controller.selectBsnsPlan.value.gztNtfcNoDtls ?? '-',
                    style: TextStyle(
                      color: Color(0xFF555555),
                      fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.fill,
                child: Container(
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E8ED),
                    border: Border.all(color: gray300),
                  ),
                  child: Center(
                      child: AutoSizeText(
                    '시행방법',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1D1D1D),
                      fontSize: 1.w > 1.h ? 30.sp : 50.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.fill,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: AutoSizeText(
                    controller.selectBsnsPlan.value.enfcMthDtls ?? '-',
                    style: TextStyle(
                      color: Color(0xFF555555),
                      fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.fill,
                child: Container(
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E8ED),
                    border: Border.all(color: gray300),
                  ),
                  child: Center(
                    child: AutoSizeText(
                      '사업목적',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1D1D1D),
                        fontSize: 1.w > 1.h ? 30.sp : 50.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: AutoSizeText(
                    controller.selectBsnsPlan.value.bsnsPurpsDtls ?? '-',
                    style: TextStyle(
                      color: Color(0xFF555555),
                      fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.fill,
                child: Container(
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E8ED),
                    border: Border.all(color: gray300),
                  ),
                  child: Center(
                      child: AutoSizeText(
                    '사업규모',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1D1D1D),
                      fontSize: 1.w > 1.h ? 30.sp : 50.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: AutoSizeText(
                    controller.selectBsnsPlan.value.bsnsScaleInfo ?? '-',
                    style: TextStyle(
                      color: Color(0xFF555555),
                      fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.fill,
                child: Container(
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E8ED),
                    border: Border.all(color: gray300),
                  ),
                  child: Center(
                      child: AutoSizeText(
                    '근거법령',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1D1D1D),
                      fontSize: 1.w > 1.h ? 30.sp : 50.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                ),
              ),
              TableCell(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: AutoSizeText(
                    controller.selectBsnsPlan.value.bsnsBasisLawordInfo ?? '-',
                    style: TextStyle(
                      color: Color(0xFF555555),
                      fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// [gridColumn] 데이터그리드 컬럼
  GridColumn gridColumn(String columnName, String label,
      {bool? isVisble, double? width}) {
    return GridColumn(
        //width: controller.columnWidths[columnName ?? ''] ?? 80,
        //width: controller.columnWidths[columnName] ?? width ?? 80,
        width: width ?? double.nan,
        columnName: columnName,
        visible: isVisble ?? true,
        label: SizedBox(
            child: Center(
                child: AutoSizeText(label,
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        overflow: TextOverflow.ellipsis,
                        color: tableTextColor)))));
  }

  ///  사업선택 -> 사업구역 선택
  Widget buildBsnsSelectAreaListDataGrid() {
    return CustomGrid(
      dataSource: controller.bsnsListDataSource.value,
      controller: controller.bsnsListDataGridController,
      isSort: false,
      columnWidthMode: ColumnWidthMode.fill,
      columns: [
        gridColumn('bsnsZoneNo', '사업구역번호'),
        gridColumn('bsnsZoneNm', '사업구역명'),
        gridColumn('lotCnt', '필지수'),
        gridColumn('bsnsAra', '면적(㎡)'),
        gridColumn('bsnsReadngPblancDe', '열람공고일'),
      ],
      selectionEvent:
          ((List<DataGridRow> addedRows, List<DataGridRow> removedRows) async {
        if (addedRows.isEmpty) return;

        final index =
            controller.bsnsListDataSource.value.rows.indexOf(addedRows.first);
        var getRow = controller.bsnsListDataSource.value.rows[index];

        var bsnsNo = controller.selectBsnsPlan.value.bsnsNo;
        var bsnsZoneNo = getRow.getCells()[0].value;
        var bsnsZoneNm = getRow.getCells()[1].value;
        var lotCnt = getRow.getCells()[2].value;
        var bsnsAra = getRow.getCells()[3].value;
        var bsnsReadngPblancDe = getRow.getCells()[4].value;

        debugPrint(
            '사업구역 선택: $bsnsNo, $bsnsZoneNo, $bsnsZoneNm, $lotCnt, $bsnsAra, $bsnsReadngPblancDe');

        debugPrint('선택된 사업번호: ${controller.selectBsnsPlan.value.bsnsNo}');
        debugPrint('선택된 사업구역번호: $bsnsZoneNo');

        controller.selectedBsnsSelectArea.value = BsnsPlanSelectAreaModel(
          bsnsNo: num.parse(bsnsNo.toString()),
          bsnsZoneNo: bsnsZoneNo,
          bsnsZoneNm: bsnsZoneNm,
          lotCnt: lotCnt.toString(),
          bsnsAra: bsnsAra.toString(),
          bsnsReadngPblancDe: bsnsReadngPblancDe,
        );

        await controller.autoSqnc();

        controller.isBsnsZoneSelectFlag.value = true;
        controller.isBsnsSqncSelectFlag.value = false;
      }),
    );
  }

  // 사업선택 -> 조사 차수
  Widget buildBsnsSqncDataGrid() {
    return CustomGrid(
      dataSource: controller.bsnsAccdtinvstgSqncDataSource.value,
      controller: controller.bsnsOrderDataGridController,
      columnWidthMode: ColumnWidthMode.fill,
      //isSelect: false,
      isSort: false,
      selectionEvent: ((List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
        if (addedRows.isEmpty) return;

        final index = controller.bsnsAccdtinvstgSqncDataSource.value.rows.indexOf(addedRows.first);
        var getRow = controller.bsnsAccdtinvstgSqncDataSource.value.rows[index];

        var accdtInvstgSqnc = getRow.getCells()[2].value;
        var accdtInvstgNm = getRow.getCells()[3].value;
        var frstRgstrId = getRow.getCells()[5].value;
        var frstRegistDt = getRow.getCells()[6].value;
        var lastUpdusrId = getRow.getCells()[7].value;
        var lastUpdtDt = getRow.getCells()[8].value;

        var sqnc = BsnsAccdtinvstgSqncModel(
          accdtInvstgSqnc: accdtInvstgSqnc,
          accdtInvstgNm: accdtInvstgNm,
          frstRgstrId: frstRgstrId,
          frstRegistDt: frstRegistDt,
          lastUpdusrId: lastUpdusrId,
          lastUpdtDt: lastUpdtDt,
        );

        controller.selectSqnc.value = sqnc;

        // controller.selectedBsnsSelectArea.value.accdtInvstgSqnc = accdtInvstgSqnc;
        // controller.selectedBsnsSelectArea.value.accdtInvstgNm = accdtInvstgNm;
        //
        // controller.isBsnsSqncSelectFlag.value = true;
      }),
      columns: [
        // gridColumn('bsnsNo', '사업번호', isVisble: false),
        // gridColumn('bsnsZoneNo', '사업구역번호', isVisble: false),
        // gridColumn('accdtInvstgSqnc', '조사차수', width: 60),
        // gridColumn('accdtInvstgNm', '조사명', width: 300),
        // gridColumn('delYn', '삭제여부', isVisble: false),
        // gridColumn('frstRgstrId', '최초등록자', width: 60),
        // gridColumn('frstRegistDt', '등록일', width: 80),
        // gridColumn('lastUpdusrId', '최종수정자', width: 60),
        // gridColumn('lastUpdtDt', '수정일', width: 80),
        // gridColumn('conectIp', '접속IP', isVisble: false),

        gridColumn('bsnsNo', '사업번호', isVisble: false),
        gridColumn('bsnsZoneNo', '사업구역번호', isVisble: false),
        gridColumn('accdtInvstgSqnc', '차수', width: 60),
        gridColumn('accdtInvstgNm', '조사명', width: double.nan),
        gridColumn('delYn', '삭제여부', isVisble: false),
        gridColumn('frstRgstrId', '최초등록자', isVisble: false),
        gridColumn('frstRegistDt', '등록일'),
        gridColumn('lastUpdusrId', '최종수정자', isVisble: false),
        gridColumn('lastUpdtDt', '수정일'),
        gridColumn('conectIp', '접속IP', isVisble: false),
      ],
    );
  }

  /// 소유자관리 -> 소유자검색
  Widget buildOwnerListDataGrid() {
    return CustomGrid(
      dataSource: controller.ownerListDataSource.value,
      controller: controller.ownerListDataGridController,
      isSort: false,
      columnWidthMode: ColumnWidthMode.fill,
      selectionEvent:
          ((List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
        debugPrint(
            'buildBsnsOwnerDataGrid> 선택된 소유자번호 > ${addedRows.first.getCells()[0].value}');
        var ownerNum = addedRows.first.getCells()[0].value;

        controller.fetchOwnerLadInfoDataSource(ownerNum);
        controller.fetchOwnerObstInfoDataSource(ownerNum);
        controller.fetchOwnerInfo(ownerNum);

        if (controller.selectedIndex.value == 1) {
          controller.bsnsOwnerTabController.animateTo(1);
        }
      }),
      columns: [
        gridColumn('ownerNo', '소유자번호', width: 100),
        gridColumn('ownerNm', '소유자명', width: 180),
        // gridColumn('posesnDivCd', '소유자구분', width: 60),
        gridColumn('posesnDivNm', '구분', width: 60),
        // gridColumn('bsnsNo', '사업번호', isVisble: false),
        // gridColumn('bsnsZoneNo', '사업구역번호', isVisble: false),
        gridColumn('ownerRgsbukAddr', '등기부주소', width: double.nan),
        gridColumn('ownerRrnEnc', '주민등록번호', width: 150),
        // gridColumn('oldRegno', '구주민등록번호', isVisble: false),
        gridColumn('ownerTelno', '전화번호', width: 100),
        gridColumn('ownerMbtlnum', '휴대폰번호', width: 100),
        // gridColumn('rgsbukZip', '등기부번지', isVisble: false),
        // gridColumn('delvyZip', '전송부번지', isVisble: false),
        // gridColumn('moisZip', '모임부번지', isVisble: false),
        // gridColumn('ownerDelvyAddr', '전송부주소', isVisble: false),
        // gridColumn('ownerMoisAddr', '모임부주소', isVisble: false),
        // gridColumn('accdtInvstgRm', '조사실', isVisble: false),
        // gridColumn('frstRgstrId', '최초등록자', isVisble: false),
        // gridColumn('frstRegistDt', '등록일', isVisble: false),
        // gridColumn('lastUpdusrId', '최종수정자', isVisble: false),
        // gridColumn('lastUpdtDt', '수정일', isVisble: false),
        // gridColumn('conectIp', '접속IP', isVisble: false),
        // gridColumn('thingCnt', '물건수', isVisble: false),
        // gridColumn('bsnsCnt', '사업수', isVisble: false),
        // gridColumn('realOwnerNo', '실소유자번호', isVisble: false),
        // gridColumn('ownerDivCd', '소유자구분', isVisble: false),
        // gridColumn('ownerRgsbukAddrFull', '등기부주소전체', isVisble: false),
        // gridColumn('ownerDelvyAddrFull', '전송부주소전체', isVisble: false),
        // gridColumn('ownerMoisAddrFull', '모임부주소전체', isVisble: false),
      ],
    );
  }

  /// 소유자관리 -> 소유자검색 -> 토지
  Widget buildOwnerLadInfoDataGrid() {
    return CustomGrid(
      dataSource: controller.ownerLadInfoDataSource.value,
      controller: controller.ownerLadInfoDataGridController,
      isSort: false,
      columnWidthMode: ColumnWidthMode.auto,
      freezeColumnCount: 4,
      stackedHeaderRows: [
        StackedHeaderRow(cells: [
          StackedHeaderCell(
              columnNames: ['ofcbkLndcgrDivNm', 'sttusLndcgrDivNm'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('지목',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                          color: Color(0xFF1D1D1D))))),
          StackedHeaderCell(
              columnNames: ['ofcbkAra', 'incrprAra', 'cmpnstnInvstgAra'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('면적(㎡)',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                          color: Color(0xFF1D1D1D))))),
        ]),
      ],
      selectionEvent:
          ((List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
        final index = controller.ownerLadInfoDataSource.value.rows
            .indexOf(addedRows.first);
        var getRow = controller.ownerLadInfoDataSource.value.rows[index];

        var data = OwnerLadInfoDatasourceModel(
          lgdongNm: getRow.getCells()[0].value,
          lcrtsDivNm: getRow.getCells()[1].value,
          mlnoLtno: getRow.getCells()[2].value,
          slnoLtno: getRow.getCells()[3].value,
          ofcbkLndcgrDivCd: getRow.getCells()[4].value,
          sttusLndcgrDivCd: getRow.getCells()[5].value,
          ofcbkAra: getRow.getCells()[6].value,
          incrprAra: getRow.getCells()[7].value,
          cmpnstnInvstgAra: getRow.getCells()[8].value,
          acqsPrpDivCd: getRow.getCells()[9].value,
          aceptncUseDivCd: getRow.getCells()[10].value,
          accdtInvstgSqnc: num.parse(getRow.getCells()[11].value),
          invstgDt: getRow.getCells()[12].value,
          cmpnstnStepDivCd: getRow.getCells()[13].value,
          cmpnstnDtaChnStatDivCd: getRow.getCells()[13].value,
          accdtInvstgRm: getRow.getCells()[14].value,
        );

        AppLog.i('buildOwnerLadInfoDataGrid > 선택된 토지 정보: ${data.toJson()}');

        /***
         * 고객카드의 토지, 지장물, 고객정보를 조회한다.
         * land - 토지,
         * obst - 지장물,
         * List - 내역,
         * Partcpnt - 관계인,
         * Cmpnstn - 협의내역,
         * Aceptnc - 수용재결,
         * Objc - 이의재결,
         * Lwst - 소송,
         * Reprchs - 환매,
         * Confirm - 수용확인원,
         * Fobjct - 이의신청
         */

        // 관계인 (토지)
        //controller.fetchCstmrCardLadPartcpntInfo(data);
        // 관계인 (지장물)
        //controller.fetchCstmrCardObstPartcpntInfo(data);

        // 협의내역
        // controller.fetchCstmrCardCmpnstnInfo(data);
        // 수용재결
        // controller.fetchCstmrCardAceptncInfo(data);
        // 이의재결
        // controller.fetchCstmrCardObjctnInfo(data);
        // 소송
        // controller.fetchCstmrCardLwstInfo(data);
        // 환매
        // controller.fetchCstmrCardReprchsInfo(data);
      }),
      columns: [
        gridColumn('lgdongNm', '소재지', width: 200),
        gridColumn('lcrtsDivNm', '특지', width: 60),
        gridColumn('mlnoLtno', '본번', width: 60),
        gridColumn('slnoLtno', '부번', width: 60),
        gridColumn('ofcbkLndcgrDivNm', '공부', width: 80),
        gridColumn('sttusLndcgrDivNm', '현황', width: 80),
        gridColumn('ofcbkAra', '공부', width: 80),
        gridColumn('incrprAra', '편입', width: 80),
        gridColumn('cmpnstnInvstgAra', '조사', width: 80),
        gridColumn('acqsPrpDivNm', '취득용도', width: 80),
        gridColumn('aceptncUseDivNm', '수용/사용', width: 60),
        gridColumn('accdtInvstgSqnc', '조사차수', width: 60),
        gridColumn('invstgDt', '조사일', width: 80),
        gridColumn('cmpnstnStepDivCdNm', '보상진행단계', width: 80),
        gridColumn('eaccdtInvstgRmtc', '비고', width: 80),
      ],
    );
  }

  /// 소유자관리 -> 소유자검색 -> 지장물
  Widget buildOwnerObstInfoDataGrid() {
    return CustomGrid(
      dataSource: controller.ownerObstInfoDataSource.value,
      controller: controller.ownerObstInfoDataGridController,
      columnWidthMode: ColumnWidthMode.fill,
      freezeColumnCount: 4,
      isSort: false,
      selectionEvent:
          ((List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
        final index = controller.ownerObstInfoDataSource.value.rows
            .indexOf(addedRows.first);
        var getRow = controller.ownerObstInfoDataSource.value.rows[index];

        // var data = OwnerObstInfoDatasourceModel(
        //   lgdongNm: getRow.getCells()[0].value,
        //   lcrtsDivCd: getRow.getCells()[1].value,
        //   mlnoLtno: getRow.getCells()[2].value,
        //   slnoLtno: getRow.getCells()[3].value,
        //   ofcbkLndcgrDivCd: getRow.getCells()[4].value,
        //   sttusLndcgrDivCd: getRow.getCells()[5].value,
        //   ofcbkAra: getRow.getCells()[6].value,
        //   incrprAra: getRow.getCells()[7].value,
        //   cmpnstnInvstgAra: getRow.getCells()[8].value,
        //   acqsPrpDivCd: getRow.getCells()[9].value,
        //   aceptncUseDivCd: getRow.getCells()[10].value,
        //   accdtInvstgSqnc: num.parse(getRow.getCells()[11].value),
        //   invstgDt: getRow.getCells()[12].value,
        //   cmpnstnStepDivCd: getRow.getCells()[13].value,
        //   cmpnstnDtaChnStatDivCd: getRow.getCells()[13].value,
        //   accdtInvstgRm: getRow.getCells()[14].value,
        // );
        //
        // print('선택된 토지 정보: ${data.toJson()}');
      }),
      columns: [
        gridColumn('lgdongNm', '소재지', width: 200),
        gridColumn('lcrtsDivNm', '특지', width: 60),
        gridColumn('mlnoLtno', '본번', width: 60),
        gridColumn('slnoLtno', '부번', width: 60),
        gridColumn('cmpnstnObstNo', '지장물순번', width: 80),
        gridColumn('obstDivNm', '지장물구분', width: 80),
        gridColumn('cmpnstnThingKndDtls', '물건의종류', width: 80),
        gridColumn('obstStrctStndrdInfo', '구조 및 규격', width: 80),
        gridColumn('cmpnstnQtyAraVu', '수량(면적)', width: 80),
        gridColumn('cmpnstnThingUnitDivNm', '단위', width: 60),
        gridColumn('acqsPrpDivCd', '취득용도', width: 80),
        gridColumn('accdtInvstgSqnc', '조사차수', width: 60),
        gridColumn('invstgDt', '조사일', width: 80),
        gridColumn('cmpnstnStepDivNm', '보상진행단계', width: 80),
        gridColumn('spcitm', '특이사항', width: 80),
      ],
    );
  }

  // 실태조사 -> 토지 -> 토지보상 대상 기준 정보
  Widget buildAccdtlnvstgDataGrid() {
    return CustomGrid(
      dataSource: controller.accdtlnvstgLadDataSource.value,
      controller: controller.accdtlnvstgLadDataGridController,
      isSort: false,
      columnWidthMode: ColumnWidthMode.fitByColumnName,
      freezeColumnCount: 6,
      stackedHeaderRows: [
        StackedHeaderRow(cells: [
          StackedHeaderCell(
              columnNames: ['col1', 'col2', 'col3', 'col4', 'col5', 'col6'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('토지보상 대상 기준 정보',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: ['col7', 'col8'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('지목',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: ['col9', 'col10'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('면적(㎡)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
        ]),
      ],
      columns: [
        gridColumn('col1', '건축물대장\n내용확인'),
        gridColumn('col2', '건축물개수'),
        gridColumn('col3', '소재지'),
        gridColumn('col4', '특지'),
        gridColumn('col5', '본번'),
        gridColumn('col6', '부번'),
        gridColumn('col7', '공부'),
        gridColumn('col8', '현황'),
        gridColumn('col9', '공부'),
        gridColumn('col10', '편입'),
        gridColumn('col11', '조사'),
        gridColumn('col12', '취득용도'),
        gridColumn('col13', '수용/사용'),
        gridColumn('col14', '조사차수'),
        gridColumn('col15', '조사일'),
        gridColumn('col16', '보상진행단계'),
        gridColumn('col17', '비고'),
      ],
    );
  }

  /// 실태조사 -> 토지 -> 소유자
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

  /// 실태조사 -> 토지 -> 소유자/관계인 -> 소유자 현황
  Widget buildAccdtlnvstgLadOwnerStatusDataGrid() {
    return CustomGrid(
      dataSource: controller.accdtlnvstgLadOwnerDataSource.value,
      controller: controller.accdtlnvstgLadOwnerDataGridController,
      isSort: false,
      columnWidthMode: ColumnWidthMode.fill,
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

  /// 실태조사 -> 토지 -> 소유자/관계인 -> 관계인 현황
  Widget buildAccdtlnvstgLadPartcpntStatusDataGrid() {
    return CustomGrid(
      dataSource: controller.accdtlnvstgLadPartcpntDataSource.value,
      controller: controller.accdtlnvstgLadPartcpntDataGridController,
      isSort: false,
      columnWidthMode: ColumnWidthMode.fill,
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
                  child: AutoSizeText('조사자',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: ['obsrverNm', 'accdtInvstgObsrverAddr'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('입회자',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
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

  /// [buildAccdtlnvstgObstDataGrid] 데이터그리드
  /// [통계정보 > 토지현황조회]
  Widget buildLadSttusInqireDataGrid(List<GridColumn> columns) {
    return CustomGrid(
      dataSource: controller.ladSttusInqireDataSource.value,
      controller: controller.ladSttusInqireDataGridController,
      columnWidthMode: ColumnWidthMode.auto,
      // isSort: true,
      freezeColumnCount: 4,
      stackedHeaderRows: [
        StackedHeaderRow(cells: [
          StackedHeaderCell(
              columnNames: ['lgdongNm', 'lcrtsDivNm', 'mlnoLtno', 'slnoLtno'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('토지기본정보',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: ['ofcbkLndcgrDivNm', 'sttusLndcgrDivNm'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('지목',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: ['ofcbkAra', 'incrprAra'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('면적(㎡)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: ['aceptncUseDivCd', 'invstgDt', 'accdtInvstgSqnc'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('실태조사',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: [
                'ownerNo',
                'posesnDivNm',
                'ownerNm',
                'ownerRgsbukAddr',
                'posesnShreNmrtrInfo',
                'posesnShreDnmntrInfo'
              ],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('소유자정보',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: ['apasmtDivCd', 'apasmtSqnc', 'prcPnttmDe'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('감정평가',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: [
                'apasmtInsttNm1',
                'apasmtInsttEvlUpc1',
                'apasmtInsttEvlAmt1'
              ],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('A평가법인',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: [
                'apasmtInsttNm2',
                'apasmtInsttEvlUpc2',
                'apasmtInsttEvlAmt2'
              ],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('B평가법인',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: [
                'apasmtInsttNm3',
                'apasmtInsttEvlUpc3',
                'apasmtInsttEvlAmt3'
              ],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('C평가법인',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: ['cmpnstnCmptnUpc', 'cpsmnCmptnAmt'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('보상비산정',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: [
                'caPymntRequstDe',
                'cmpnstnDscssUpc',
                'cmpnstnDscssTotAmt',
                'caRgistDt'
              ],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('보상비지급',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: [
                'aceptncAdjdcUpc',
                'aceptncAdjdcAmt',
                'aceptncAdjdcDt',
                'aceptncUseBeginDe',
                'ldPymntRequstDe',
                'ldRgistDt',
                'ldCpsmnPymntLdgmntDivCd'
              ],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('수용재결',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: [
                'obadUpc',
                'objcRstAmt',
                'objcAdjdcDt',
                'proPymntRequstDe',
                'proCpsmnPymntLdgmntDivCd'
              ],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('이의재결',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
        ]),
      ],
      columns: columns,
    );
  }

  /// [buildAccdtlnvstgObstDataGrid] 데이터그리드
  /// [통계정보 > 지장물현황조회]
  Widget buildObstSttusInqireDataGrid(List<GridColumn> columns) {
    return CustomGrid(
      dataSource: controller.obstSttusInqireDataSource.value,
      controller: controller.ladSttusInqireDataGridController,
      columnWidthMode: ColumnWidthMode.fill,
      isSort: false,
      freezeColumnCount: 4,
      stackedHeaderRows: [
        StackedHeaderRow(cells: [
          StackedHeaderCell(
              columnNames: ['lgdongNm', 'lcrtsDivCd', 'mlnoLtno', 'slnoLtno'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('토지기본정보',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: ['rqest', 'invstgDe', 'accdtInvstgSqnc'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('실태조사',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: [
                'ownerNo',
                'posesnDivCd',
                'ownerNm',
                'ownerRgsbukAddr',
                'posesnShreNmrtrInfo',
                'posesnShreDnmntrInfo'
              ],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('소유자정보',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: ['apasmtReqestDivCd', 'apasmtSqnc', 'prcPnttmDe'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('감정평가',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: [
                'apasmtInsttNm1',
                'apasmtInsttEvlUpc1',
                'apasmtInsttEvlAmt1'
              ],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('A평가법인',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: [
                'apasmtInsttNm2',
                'apasmtInsttEvlUpc2',
                'apasmtInsttEvlAmt2'
              ],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('B평가법인',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: [
                'apasmtInsttNm3',
                'apasmtInsttEvlUpc3',
                'apasmtInsttEvlAmt3'
              ],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('C평가법인',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: ['cmpnstnCmptnUpc', 'cpsmnCmptnAmt'],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('보상비산정',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: [
                'caPymntRequstDe',
                'cmpnstnDscssUpc',
                'cmpnstnDscssTotAmt'
              ],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('보상비지급',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: [
                'dcsUpc',
                'dcsAmt',
                'dcsDt',
                'aceptncUseBeginDe',
                'ldPymntRequstDe',
                'ldCpsmnPymntLdgmntDivCd'
              ],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('수용재결',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
          StackedHeaderCell(
              columnNames: [
                'proUpc',
                'proAmt',
                'proDt',
                'proPymntRequstDe',
                'proCpsmnPymntLdgmntDivCd'
              ],
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText('이의재결',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: Color(0xFF1D1D1D),
                      )))),
        ]),
      ],
      columns: columns,
    );
  }

  /// [buildBsnsRadio] 라디오 버튼
  Widget buildBsnsRadio() {
    return Container(
      //color: Colors.green,
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 120.w,
                child: AutoSizeText('사업구분',
                    style: TextStyle(
                        color: tableTextColor,
                        fontSize: 1.w > 1.h ? 32.sp : 22.sp,
                        fontWeight: FontWeight.w500))),
            SizedBox(width: 20.w),
            CustomRadio(
              value: 0,
              groupValue: controller.radioValue.value,
              onChanged: (value) {
                controller.handleRadioValueChange(value ?? 0);
              },
              label: '댐',
            ),
            CustomRadio(
              value: 1,
              groupValue: controller.radioValue.value,
              onChanged: (value) {
                controller.handleRadioValueChange(value ?? 1);
              },
              label: '수도용지',
            ),
            CustomRadio(
              value: 2,
              groupValue: controller.radioValue.value,
              onChanged: (value) {
                controller.handleRadioValueChange(value ?? 2);
              },
              label: '택지개발',
            ),
            CustomRadio(
              value: 3,
              groupValue: controller.radioValue.value,
              onChanged: (value) {
                controller.handleRadioValueChange(value ?? 3);
              },
              label: '기타',
            ),
          ],
        ),
      ),
    );
  }

  /// [buildOwnerMngRadio] 라디오 버튼
  Widget buildOwnerMngRadio() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            child: Radio(
              value: 0,
              groupValue: controller.radioValue.value,
              onChanged: (value) {
                controller.handleRadioValueChange(value ?? 0);
              },
            ),
          ),
          SizedBox(width: 16.w),
          AutoSizeText('소유자',
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                  color: tableTextColor)),
          SizedBox(width: 40.w),
          Container(
            width: 40.w,
            height: 40.h,
            child: Radio(
              value: 1,
              groupValue: controller.radioValue.value,
              onChanged: (value) {
                controller.handleRadioValueChange(value ?? 1);
              },
            ),
          ),
          SizedBox(width: 16.w),
          AutoSizeText('관계인',
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                  color: tableTextColor)),
        ],
      ),
    );
  }
}
