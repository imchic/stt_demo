import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ldi/components/base_np_header.dart';
import 'package:ldi/screens/gis/gis_screen.dart';
import 'package:ldi/screens/lp_screen.dart';
import 'package:ldi/screens/np_controller.dart';
import 'package:ldi/utils/dialog_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../components/base_header.dart';
import '../components/base_tabbar.dart';
import '../components/custom_grid.dart';
import '../routes/app_route.dart';
import '../utils/applog.dart';
import '../utils/colors.dart';
import '../widget/selectLad_widget.dart';
import '../widget/wtwk_accdt_invstg_widget.dart';
import 'login/login_controller.dart';

class npScreen extends GetView<NpController> {
  const npScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawerEnableOpenDragGesture: false, // 엣지 스와이프 비활성화
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
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: controller.pageController,
                      onPageChanged: (index) {
                        controller.selectedIndex.value = index;
                      },
                      children: [
                        Container(
                          color: bsnsListViewBg,
                          width: Get.width,
                          height: Get.height,
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Column(
                            children: [
                              BaseNpHeader(''),
                              Padding(
                                padding: EdgeInsets.only(right: 48.w),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: BaseTabBar(
                                        controller:
                                            controller.tabController1,
                                        tabItems: controller.tabItems1,
                                        labelColor: Color(0xFF2287EF),
                                        indicatorColor: Color(0xFF2287EF),
                                        isScrollable: true,
                                        activeColor: Color(0xFF2287EF),
                                        unActiveTextColor: Color(0xFF555555),
                                        activeTextColor: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: TabBarView(
                                controller: controller.tabController1,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: GisScreen(
                                              ),
                                            ),
                                            Expanded(
                                                flex: 2,
                                                child: Obx(() =>
                                                    Column(
                                                      children: [
                                                        Expanded(
                                                            child: SelectLadWidget.buildSelectLad(controller)),
                                                        Expanded(
                                                            child: SelectLadWidget.buildSelectLadDetail(controller)),
                                                      ],
                                                    ),
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Obx(() =>
                                        Expanded(
                                          child: WtwkAccdtInvstgWidget.buildWtwkAccdtInvstg(controller),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Expanded(
                                        child: WtwkAccdtInvstgWidget.buildWtwkAccdtInvstg(controller),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// [lnbWidget] 왼쪽 메뉴 버튼
  Widget lnbWidget() {
    return Obx(
      () => Container(
        width: 210.w,
        decoration: BoxDecoration(
          color: lnbBg,
        ),
        child: Column(
          children: [
            Container(
              //width: 208.w,
              width: 208.w,
              height: 176.h,
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
                          width: 208.w,
                          height: 176.h,
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
                                width: 40.w,
                                height: 40.h,
                                child: SvgPicture.asset(
                                    'assets/icons/ic_menu_${index + 1}.svg',
                                    color: Colors.white),
                              ),
                              SizedBox(height: 8.h),
                              AutoSizeText(controller.leftNavItems[index],
                                  maxFontSize: 20,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.sp,
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

  // 사용허가 조회 그리드
  Widget buildUsePrmisnCanclAprvDataGrid() {
    return CustomGrid(
      dataSource: controller.usePrmisnCanclAprvModelDataSource.value,
      controller: controller.usePrmisnCanclAprvDataGridController,
      isSort: false,
      columnWidthMode: ColumnWidthMode.fill,
      columns: [
        lpScreen().gridColumn('plotUseNo', '대지사용번호', isVisble: false),
        lpScreen().gridColumn('applcntNm', '신청자명', width: 100),
        lpScreen().gridColumn('applcntAddr', '주소', width: 300),
        lpScreen().gridColumn('applcntTelno', '전화번호',  width: 120),
        lpScreen().gridColumn('applcntMbtlnum', '핸드폰', width: 120),
      ],
      selectionEvent:
          ((List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
        if (addedRows.isEmpty) return;

        final index = controller.usePrmisnCanclAprvModelDataSource.value.rows
            .indexOf(addedRows.first);
        var getRow =
            controller.usePrmisnCanclAprvModelDataSource.value.rows[index];

        // 대지사용번호
        var plotUseNo = getRow.getCells()[0].value;

        controller.fetchUsePrmisnCanclAprvDetailList(plotUseNo);
      }),
    );
  }

  // 신청자정보별 허가 상세현황 그리드
  Widget buildUsePrmisnCanclAprvDetailDataGrid() {
    return CustomGrid(
      dataSource: controller.usePrmisnCanclAprvDetailModelDataSource.value,
      controller: controller.usePrmisnCanclAprvDetailDataGridController,
      isSort: false,
      columnWidthMode: ColumnWidthMode.fill,
      columns: [
        lpScreen().gridColumn('plotUseNo', '대지사용번호', isVisble: false),
        lpScreen().gridColumn('ladSeq', '토지순번', isVisble: false),
        lpScreen().gridColumn('rqstSeq', '신청순번', isVisble: false),
        lpScreen().gridColumn('usePrmisnPurpsSclsNm', '점유(사용)목적'),
        lpScreen().gridColumn('prmisnRqstAra', '신청면적(㎡)'),
        lpScreen().gridColumn('useAprvAra', '승인면적(㎡)'),
      ],
      selectionEvent:
          ((List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
        if (addedRows.isEmpty) return;

        final index = controller.usePrmisnCanclAprvDetailModelDataSource.value.rows
            .indexOf(addedRows.first);
        var getRow =
            controller.usePrmisnCanclAprvDetailModelDataSource.value.rows[index];

        // 대지사용번호
        var plotUseNo = getRow.getCells()[0].value;
        AppLog.i('plotUseNo: $plotUseNo');
        controller.selectPlotUseNo.value = plotUseNo;
        // 토지순번
        var ladSeq = getRow.getCells()[1].value;
        controller.selectedladSeq.value = ladSeq;
        AppLog.i('ladSeq: $ladSeq');
        // 신청순번
        var rqstSeq = getRow.getCells()[2].value;
        controller.selectRqstSeq.value = rqstSeq;
        AppLog.i('rqstSeq: $rqstSeq');

        controller.fetchUsePrmisnCanclAprvDocList(plotUseNo);
      }),
    );
  }

  // [무단점유 정보] 실태조사현황
  Widget buildWtwkAccdtInvstgDataGrid() {
    return CustomGrid(
      dataSource: controller.wtwkAccdtInvstgModelDataSource.value,
      controller: controller.wtwkAccdtInvstgDataGridController,
      isSort: false,
      columnWidthMode: ColumnWidthMode.fill,
      columns: [
        lpScreen().gridColumn('usePurpsLclsCd', '점유목적'),
        lpScreen().gridColumn('squatAra', '점유면적(㎡)'),
        lpScreen().gridColumn('dtlDtls', '점유물 상세내용'),
        lpScreen().gridColumn('referMtt', '점유\n참고사항'),
        lpScreen().gridColumn('etcMtt', '기타사항'),
        lpScreen().gridColumn('possesnStrtDe', '점유시작일'),
        lpScreen().gridColumn('possesnEndDe', '점유종료일'),
      ],
      selectionEvent:
          ((List<DataGridRow> addedRows, List<DataGridRow> removedRows) {
        if (addedRows.isEmpty) return;

        final index = controller.wtwkAccdtInvstgModelDataSource.value.rows
            .indexOf(addedRows.first);
        var getRow =
            controller.wtwkAccdtInvstgModelDataSource.value.rows[index];

        AppLog.i('${controller.selectPlotUseNo}');
        AppLog.i('${controller.selectedladSeq}');
        AppLog.i('${controller.selectRqstSeq}');

        controller.fetchWtwkAccdtInvstgThingInfoList(controller.selectPlotUseNo, controller.selectedladSeq, controller.selectRqstSeq);
      }),
    );
  }

  // [무단점유 정보] 설치물 현황
  Widget buildWtwkAccdtInvstgThingInfoDataGrid() {
    return CustomGrid(
      dataSource: controller.wtwkAccdtInvstgThingInfoModelDataSource.value,
      controller: controller.wtwkAccdtInvstgThingInfoDataGridController,
      isSort: false,
      columnWidthMode: ColumnWidthMode.fill,
      columns: [
        lpScreen().gridColumn('instDe', '설치일자'),
        lpScreen().gridColumn('instThingStndrdInfo', '규격'),
        lpScreen().gridColumn('pdm', '관경(mm)'),
        lpScreen().gridColumn('instWidthLcNo', '단'),
        lpScreen().gridColumn('instHighLcNo', '열'),
        lpScreen().gridColumn('instThingLt', '길이(m)'),
        lpScreen().gridColumn('rlwayNm', '선로명'),
        lpScreen().gridColumn('gisRefrnKeyInfo', 'GIS좌표'),
        lpScreen().gridColumn('drwDc', '도면'),
        lpScreen().gridColumn('instThingRm', '비고'),
      ],
    );
  }

}
