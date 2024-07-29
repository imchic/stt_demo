import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stt_demo/screens/accdtlnvstg/datasource/accdtlnvstg_lad_owner_datasource.dart';
import 'package:stt_demo/screens/accdtlnvstg/datasource/model/accdtlnvstg_lad_owner_model.dart';
import 'package:stt_demo/screens/accdtlnvstg/datasource/model/accdtlnvstg_lad_partcpnt_model.dart';


import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../utils/dialog_util.dart';
import '../../utils/custom_textfiled.dart';
import '../accdtlnvstg/datasource/accdtlnvstg_lad_datasource.dart';
import '../accdtlnvstg/datasource/accdtlnvstg_lad_partcpnt_datasource.dart';
import '../accdtlnvstg/datasource/model/accdtlnvstg_lad_model.dart';
import '../owner/datasource/owner_datasource.dart';
import '../owner/datasource/model/owner_datasource_model.dart';
import '../owner/lad/model/owner_lad_info_datasource_model.dart';
import '../owner/lad/owner_lad_info_datasource.dart';
import '../owner/obst/model/owner_obst_info_datasource_model.dart';
import '../owner/obst/owner_obst_info_datasource.dart';
import 'datasource/bsns_select_area_datasource.dart';
import 'datasource/model/bsns_select_area_datasource_model.dart';
import 'select/bsns_select_model.dart';
import 'sqnc/bsns_sqnc_datasource.dart';
import 'sqnc/model/bsns_sqnc_datasource_model.dart';

class BsnsController extends GetxController with GetTickerProviderStateMixin {
  static BsnsController get to => Get.find();

  late TextEditingController bsnsNameSearchController; // 사업명 검색
  late TextEditingController bsnsNoSearchController; // 사업번호 검색

  // 소유자관리 소재지 검색
  late TextEditingController ownerLctnSearchController;

  // 소유자관리 본번 검색
  late TextEditingController ownerMlnoLtnoSearchController;

  // 소유자관리 부번 검색
  late TextEditingController ownerSlnoLtnoSearchController;

  // 소유자관리 정보변경 특이사항
  late TextEditingController ownerEtcController;

  late TextEditingController orderAutoController;
  late TextEditingController orderStartDtController;
  late TextEditingController orderEndDtController;
  late TextEditingController orderController;

  // 소유자 관리
  late TextEditingController ownerNameSearchController;
  late TextEditingController ownerRegisterNoSearchController;

  late ScrollController bsnsListScrollController;

  // debounce
  Timer? _debounce;

  // 사업선택 탭 아이템
  final bsnsSelectTabItems = [
    Tab(text: '사업선택'),
    Tab(text: '사업구역'),
    Tab(text: '조사차수')
  ];

  final bsnsSelectTabIsSelected = [true, false, false].obs;
  final bsnsOwnerTabIsSelected = [true, false, false, false].obs;
  final accdtlnvstgTabIsSelected = [true, false].obs;
  final accdtlnvstgTabLadSelected = [true, false, false].obs;
  final accdtlnvstgTabObstSelected = [true, false].obs;

  // 소유자 관리 탭 아이템
  final bsnsOwnerTabItems = [
    Tab(text: '소유자검색'),
    Tab(text: '토지정보'),
    Tab(text: '지장물정보'),
    Tab(text: '정보변경')
  ];

  // 실태조사 탭 아이템
  final accdtlnvstgTabItems = [Tab(text: '토지조사'), Tab(text: '지장물 조사')];

  // 실태조사 토지조서 탭 아이템
  final accdtlnvstgLadTabItems = [
    Tab(text: '토지검색'),
    Tab(text: '소유자/관계인'),
    Tab(text: '조사내용')
  ];

  // 실태조사 지장물 조사 탭 아이템
  final accdtlnvstgObstTabItems = [Tab(text: '지장물검색'), Tab(text: '조사내용')];

  late TabController bsnsTabController;
  late TabController accdtlnvstgTabController;
  late TabController accdtlnvstgLadTabController;
  late TabController accdtlnvstgObstTabController;

  late TabController bsnsOwnerTabController;

  /// [DataGridController] 는 데이터 그리드의 상태를 제어하는 컨트롤러 클래스이다.

  late DataGridController bsnsListDataGridController;
  late DataGridController bsnsOwnerDataGridController;
  late DataGridController bsnsOrderDataGridController;

  late DataGridController ownerLadInfoDataGridController;
  late DataGridController ownerObstInfoDataGridController;

  late DataGridController accdtlnvstgLadSelectDataGridController;
  late DataGridController accdtlnvstgLadOwnerDataGridController;
  late DataGridController accdtlnvstgLadPartcpntDataGridController;

  /// [BsnsSelectAreaDataSource] 는 [DataGridSource] 를 상속받아 구현한 데이터 소스 클래스이다.
  final bsnsListDataSource = BsnsSelectAreaDataSource(items: []).obs; // 사업구역선택

  final bsnsOwnerDataSource = OwnerDatasource(items: []).obs; // 소유자
  RxList<OwnerDataSourceModel> bsnsOwner = <OwnerDataSourceModel>[].obs;

  final ownerLadInfoDataSource = OwnerLadInfoDatasource(items: []).obs; // 소유자 및 관계인
  final ownerObstInfoDataSource = OwnerObstInfoDatasource(items: []).obs; // 지장물정보

  final bsnsSqncDataSource = BsnsSqncDatasource(items: []).obs; // 조사차수
  RxList<BsnsSqncDatasourceModel> bsnsSqnc = <BsnsSqncDatasourceModel>[].obs;

  // 실태조사 > 토지내역
  final accdtlnvstgLadDataSource = AccdtlnvstgLadDatasource(items: []).obs;

  // 실태조사 > 소유자/관계인

  // 실태조사 > 소유자/관계인 > 토지
  final accdtlnvstgOwnerLadDataSource = OwnerLadInfoDatasource(items: []).obs;
  Rx<OwnerLadInfoDatasourceModel> selectedOwnerLadInfoData = OwnerLadInfoDatasourceModel().obs;

  // 실태조사 > 소유자/관계인 > 소유자 현황
  final accdtlnvstgLadOwnerDataSource = AccdtlnvstgLadOwnerDatasource(items: []).obs;

  // 실태조사 > 소유자/관계인 > 소유자별 관계인 현황
  final accdtlnvstgLadPartcpntDataSource = AccdtlnvstgLadPartcpntDatasource(items: []).obs;

  /// [Rx] 는 [GetxController] 에서 사용하는 반응형 변수이다.
  RxInt radioValue = 0.obs;

  RxBool isExpanded = false.obs;
  RxBool isRightSideExpanded = false.obs;

  RxInt selectedIndex = 0.obs;
  RxBool isNavOpen = false.obs;

  RxList<BsnsSelectModel> bsnsList = <BsnsSelectModel>[].obs;
  RxList<BsnsSelectModel> searchBsnsList = <BsnsSelectModel>[].obs;

  Rx<BsnsSelectModel> bsns = BsnsSelectModel().obs;
  Rx<BsnsSelectModel> selectedBsns = BsnsSelectModel().obs;

  Rx<BsnsSelectAreaDataSourceModel> bsnsSelectAreaDataSource =
      BsnsSelectAreaDataSourceModel().obs;

  //Rx<BsnsSelectModel> selectedBsns = BsnsSelectModel().obs;

  RxList<String> leftNavItems = ['사업선택', '소유자관리', '실태조사', '통계정보', '고객카드'].obs;
  RxList businessList = [].obs;

  // select order
  RxInt selectOrder = 0.obs;

  // RxDouble surveyDateWidth = 100.0.obs;

  RxMap<String, double> columnWidths = {
    'bsnsZoneNo': 40.w,
    'bsnsZoneNm': 850.w,
    'lotCnt': 60.w,
    'bsnsAra': 60.w,
    'bsnsReadngPblancDe': 120.w,
    'surveyDate': double.nan,
    'surveyOrder': double.nan,
    'location': double.nan,
    'mainNumber': double.nan,
    'subNumber': double.nan,
    'publicLandType': double.nan,
    'gdongNm': double.nan,
    'gdongCd': double.nan,
    'crtsDivCd': double.nan,
    'lnoLtno': double.nan,
    'lnoLtno': double.nan,
    'bstSeq': double.nan,
    'bstDivCd': double.nan,
    'mpnstnThingKndDtls': double.nan,
    'bstStrctStndrdInfo': double.nan,
    'mpnstnQtyAraVu': double.nan,
    'mpnstnThingUnitDivCd': double.nan,
    'ttusLndcgrDivCd': double.nan,
    'cqsPrpDivCd': double.nan,
    'ceptncUseDivCd': double.nan,
    'ccdtInvstgSqnc': double.nan,
    'nvstgDt': double.nan,
    'mpnstnStepDivCd': double.nan,
    'pcitm': double.nan,
    'bsnsSqnc': 60.w,
    'bsnsStrtDe': 120.w,
    'bsnsEndDe': 120.w,
    'ownerNo': double.nan,
    'ladLdgrOwnerNm': double.nan,
    'ladLdgrPosesnDivCd': double.nan,
    'ownerRegisterNo': double.nan,
    'ownerTelNo': double.nan,
    'ownerPhoneNo': double.nan,
    'lgdongNm': 300.w,
    'lcrtsDivCd': 100.w,
    'mlnoLtno': double.nan,
    'slnoLtno': double.nan,
    'ofcbkLndcgrDivCd': double.nan,
    'sttusLndcgrDivCd': double.nan,
    'ofcbkAra': double.nan,
    'incrprAra': double.nan,
    'cmpnstnInvstgAra': double.nan,
    'acqsPrpDivCd': double.nan,
    'aceptncPrpDivCd': double.nan,
    'accdtInvstgSqnc': double.nan,
    'invstgDt': double.nan,
    'cmpnstnDtaChnStatDivCd': double.nan,
    'etc': double.nan,
    'obstSeq': double.nan,
    'obstDivCd': double.nan,
    'cmpnstnThingKndDtls': double.nan,
    'obstStrctStndrdInfo': double.nan,
    'cmpnstnQtyAraVu': double.nan,
    'cmpnstnThingUnitDivCd': double.nan,
    'sttusLndcgrDivCd': double.nan,
    'acqsPrpDivCd': double.nan,
    'aceptncUseDivCd': double.nan,
    'accdtInvstgSqnc': double.nan,
    'invstgDt': double.nan,
    'cmpnstnStepDivCd': double.nan,
    'spcitm': double.nan,
  }.obs;

  RxString selectedPurpose = '단지구역'.obs;

  // purpose list
  RxList<String> purposeList = [
    '단지구역',
    '토취장',
    '진입도로',
    '문화재구역',
    '도로',
    '침수구역',
    '잔여부지',
    '정수시설',
    '송수관로',
    '도수관로',
    '가압시설',
    '일시사용'
  ].obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    bsnsNameSearchController = TextEditingController();
    bsnsNoSearchController = TextEditingController();

    orderAutoController = TextEditingController();
    orderStartDtController = TextEditingController();
    orderEndDtController = TextEditingController();

    ownerNameSearchController = TextEditingController();
    ownerRegisterNoSearchController = TextEditingController();

    ownerLctnSearchController = TextEditingController();
    ownerMlnoLtnoSearchController = TextEditingController();
    ownerSlnoLtnoSearchController = TextEditingController();
    ownerEtcController = TextEditingController();

    accdtlnvstgTabController = TabController(length: accdtlnvstgTabItems.length, vsync: this);
    bsnsTabController = TabController(length: bsnsSelectTabItems.length, vsync: this);
    bsnsOwnerTabController = TabController(length: bsnsOwnerTabItems.length, vsync: this);
    accdtlnvstgLadTabController = TabController(length: accdtlnvstgLadTabItems.length, vsync: this);
    accdtlnvstgObstTabController = TabController(length: accdtlnvstgObstTabItems.length, vsync: this);

    orderController = TextEditingController();

    bsnsListScrollController = ScrollController();

    /// [DataGridController] 는 데이터 그리드의 상태를 제어하는 컨트롤러 클래스이다.
    bsnsListDataGridController = DataGridController();
    bsnsOwnerDataGridController = DataGridController();
    bsnsOrderDataGridController = DataGridController();

    // 소유자관리 > 토지정보
    ownerLadInfoDataGridController = DataGridController();
    // 소유자관리 > 지장물정보
    ownerObstInfoDataGridController = DataGridController();

    accdtlnvstgLadSelectDataGridController = DataGridController();
    accdtlnvstgLadOwnerDataGridController = DataGridController();
    accdtlnvstgLadPartcpntDataGridController = DataGridController();

    bsnsTabController.addListener(() {
      print('bsnsTabController.index : ${bsnsTabController.index}');
      // 해당위치로 이동

      // 사업구역 없이는 탭 1번, 2번 이동 불가능
      if (selectedBsns.value.title == null && bsnsTabController.index > 0) {
        bsnsTabController.index = 0;
        DialogUtil.showSnackBar(Get.context!, '사업을 선택해주세요.');
        return;
      }

      // 이전 탭 선택시 초기화
      if (bsnsTabController.index == 0) {
        selectedBsns.value = BsnsSelectModel();
      }
    });

    bsnsListScrollController.addListener(() {
      print(
          'bsnsListScrollController.offset : ${bsnsListScrollController.offset}');
    });

    /// [사업목록] 조회
    await fetchBsnsSelectAreaGridDataSource();

    /// [소유자 및 관리인] 조회
    await fetchBsnsOwnerDataSource();

    /// [소유자 및 관리인] 조회
    await fetchAccdtlnvstgLadDataSource();

    /// [차수] 조회
    await fetchBsnsSqncDataSource();

    /// [자동 차수] 조회
    await autoSqnc();

    /// [소유자관리 > 토지정보] 조회
    await fetchOwnerLadInfoDataSource();

    /// [소유자관리 > 지장물정보] 조회
    await fetchOwnerObstInfoDataSource();
  }

  @override
  void dispose() {
    super.dispose();
    bsnsTabController.dispose();
    bsnsNameSearchController.dispose();
    bsnsNoSearchController.dispose();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  Future<void> onClose() async {
    super.onClose();
  }

  /// [사업선택] 라디오버튼
  void handleRadioValueChange(int value) {
    radioValue.value = value;
  }

  void handleSelectListTab(RxList<bool> tabSelected, int index) {
    for (var i = 0; i < tabSelected.length; i++) {
      tabSelected[i] = false;
    }
    tabSelected[index] = true;
  }

  /// [사업목록] 조회
  Future<List<BsnsSelectModel>> fetchBsnsList() async {
    await Future.delayed(Duration(milliseconds: 500));

    var bsns = <BsnsSelectModel>[];
    for (var i = 0; i < 10; i++) {
      bsns.add(BsnsSelectModel(
          no: i.toString(),
          areaNo: i.toString(),
          title: '(5101102)대교천 재해예상사업(차수 : $i)',
          bizName: '사업구역 $i',
          bizArea: '장군면 도계리 34$i 연기면 세종리 금강합류점검',
          isExpand: false,
          isSelect: false,
          bizDate: DateTime.now().toString()));
    }

    bsnsList.value = bsns;
    searchBsnsList.value = bsns;

    return bsnsList;
  }

  /// [소유자 및 관리인] 조회
  fetchBsnsOwnerDataSource() async {
    for (var i = 0; i < 10; i++) {
      bsnsOwner.add(OwnerDataSourceModel(
          no: i,
          ownerNo: 'Owner-00$i',
          ladLdgrOwnerNm: '홍길동',
          ladLdgrPosesnDivCd: '개인',
          ownerRegisterNo: '891208-1000000',
          ownerTelNo: '042-1234-5678',
          ownerPhoneNo: '010-1234-5678'));
    }

    bsnsOwnerDataSource.value = OwnerDatasource(items: bsnsOwner);
  }

  /// [차수] 조회
  fetchBsnsSqncDataSource() async {
    for (var i = 1; i < 3; i++) {
      bsnsSqnc.add(BsnsSqncDatasourceModel(
          no: i,
          bsnsSqnc: i,
          bsnsStrtDe: '2021-10-0$i',
          bsnsEndDe: '2021-10-0$i'));
    }

    bsnsSqncDataSource.value = BsnsSqncDatasource(items: bsnsSqnc);
  }

  /// [사업구역선택] 조회
  fetchBsnsSelectAreaGridDataSource() async {
    var bsns = <BsnsSelectAreaDataSourceModel>[];
    for (var i = 0; i < 10; i++) {
      bsns.add(BsnsSelectAreaDataSourceModel(
          bsnsNo: i,
          bsnsZoneNo: i,
          bsnsZoneNm: '사업구역 $i',
          lotCnt: i,
          bsnsAra: i,
          bsnsReadngPblancDe: '2021-10-0$i'));
    }

    bsnsListDataSource.value = BsnsSelectAreaDataSource(items: bsns);
  }

  /// [소유자관리 > 토지정보] 조회
  fetchOwnerLadInfoDataSource() async {
    var ownerLadInfo = <OwnerLadInfoDatasourceModel>[];
    for (var i = 0; i < 10; i++) {
      ownerLadInfo.add(OwnerLadInfoDatasourceModel(
          lgdongNm: '대전광역시 유성구 봉명동',
          lcrtsDivCd: '공부지목',
          mlnoLtno: '12$i',
          slnoLtno: '45$i',
          ofcbkLndcgrDivCd: '공부지목',
          sttusLndcgrDivCd: '현황지목',
          ofcbkAra: 1000,
          incrprAra: 2000,
          cmpnstnInvstgAra: 3000,
          acqsPrpDivCd: '취득소유구분코드',
          aceptncPrpDivCd: '수용사용구분코드',
          accdtInvstgSqnc: i,
          accdtInvstgDe: '2021-10-0$i',
          invstgDt: '2021-10-0$i',
          cmpnstnDtaChnStatDivCd: '보상자료변경상태구분코드',
          etc: '기타'));

      ownerLadInfoDataSource.value =
          OwnerLadInfoDatasource(items: ownerLadInfo);
    }
  }

  /// [소유자관리 > 지장물정보] 조회
  fetchOwnerObstInfoDataSource() async {
    var ownerObstInfo = <OwnerObstInfoDatasourceModel>[];
    for (var i = 0; i < 10; i++) {
      ownerObstInfo.add(OwnerObstInfoDatasourceModel(
          lgdongNm: '대전광역시 유성구 봉명동',
          lcrtsDivCd: '공부지목',
          mlnoLtno: '12$i',
          slnoLtno: '45$i',
          obstSeq: '$i번',
          obstDivCd: '지장물구분코드',
          cmpnstnThingKndDtls: '물건의종류',
          obstStrctStndrdInfo: '구조규격정보',
          cmpnstnQtyAraVu: '보상수량면적값',
          cmpnstnThingUnitDivCd: '보상물건단위구분코드',
          sttusLndcgrDivCd: '현황지목구분코드',
          acqsPrpDivCd: '취득용도구분코드',
          aceptncUseDivCd: '수용용도구분코드',
          accdtInvstgSqnc: i,
          invstgDt: '2021-10-0$i',
          cmpnstnStepDivCd: '보상단계구분코드',
          spcitm: '특이사항'));

      ownerObstInfoDataSource.value =
          OwnerObstInfoDatasource(items: ownerObstInfo);
    }
  }

  /// [실태조사 > 토지내역] 조회
  fetchAccdtlnvstgLadDataSource() async {
    var accdtlnvstgLad = <AccdtlnvstgLadModel>[];
    for (var i = 0; i < 10; i++) {
      accdtlnvstgLad.add(AccdtlnvstgLadModel(
          surveyDate: '2021-10-0$i',
          surveyOrder: '$i차',
          location: '대전광역시 유성구 봉명동',
          mainNumber: '12$i',
          subNumber: '45$i',
          publicLandType: '공부지목'));
    }

    accdtlnvstgLadDataSource.value =
        AccdtlnvstgLadDatasource(items: accdtlnvstgLad);
  }

  /// [실태조사 > 소유자/관계인] 조회
  fetchAccdtlnvstgOwnerDataSource() async {
    var accdtlnvstgOwner = selectedOwnerLadInfoData.value;
    accdtlnvstgOwnerLadDataSource.value = OwnerLadInfoDatasource(items: [accdtlnvstgOwner]);


    var accdtlnvstgOwnerDataSource = <AccdtlnvstgLadOwnerModel>[];
    for (var i = 0; i < 1; i++) {
      accdtlnvstgOwnerDataSource.add(AccdtlnvstgLadOwnerModel(
          ownerNo: '$i',
          ownerName: '홍길동',
          ownerType: '개인',
          ownerTypeDetail: '개인',
          ownerDetail2: '조회',
          ownerRegisterNo: '891208-1000000'));
    }
    this.accdtlnvstgLadOwnerDataSource.value = AccdtlnvstgLadOwnerDatasource(items: accdtlnvstgOwnerDataSource);


    var accdtlnvstgPartcpntDataSource = <AccdtlnvstgLadPartcpntModel>[];
    for (var i = 0; i < 1; i++) {
      accdtlnvstgPartcpntDataSource.add(AccdtlnvstgLadPartcpntModel(
          ownerNo: '$i',
          ladLdgrOwnerNm: '조회',
          ladLdgrPosesnDivCd: '홍길순',
          ownerTypeDetail: '대전광역시 유성구 봉명동',
          ownerDetail2: '13510',
          ownerRegisterNo: '010-0000-0000'));
    }

    this.accdtlnvstgLadPartcpntDataSource.value = AccdtlnvstgLadPartcpntDatasource(items: accdtlnvstgPartcpntDataSource);

  }

  /// 사업 선택
  getBusinessList() async {
    for (var i = 0; i < 10; i++) {
      businessList.add('사업 $i');
    }

    DialogUtil.showBottomSheet(
      Get.context!,
      '사업선택',
      ListView.builder(
        itemCount: businessList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(businessList[index]),
            onTap: () {
              isNavOpen.value = false;
            },
          );
        },
      ),
    );
  }

  /// [차수] 선택
  getSelectOrder() async {
    DialogUtil.showBottomSheet(
      Get.context!,
      '신규 조사 차수 등록',
      // 차수 자동입력
      Container(
        width: double.infinity,
        height: 228.h,
        padding: EdgeInsets.only(top: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 140.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 40.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80.w,
                          height: 24.h,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '차수등록',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: SizedBox(
                            height: 40.h,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: CustomTextFiled(
                                      controller: orderAutoController,
                                      hintText: '차수는 순차적으로 자동입력됩니다.',
                                      isPassword: false,
                                      isReadOnly: true,
                                      onChanged: (value) {
                                        print('orderAutoController : $value');
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: double.infinity,
                    height: 40.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80.w,
                          height: 24.h,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '시작일',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: SizedBox(
                            height: 40.h,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: CustomTextFiled(
                                      controller: orderStartDtController,
                                      hintText: '현재 날짜로 자동입력됩니다.',
                                      isPassword: false,
                                      isReadOnly: true,
                                      onChanged: (value) {},
                                      onTap: () {
                                        showDatePicker(
                                          context: Get.context!,
                                          initialDate: orderStartDtController
                                                  .text.isEmpty
                                              ? DateTime.now()
                                              : DateTime.parse(
                                                  orderStartDtController.text),
                                          firstDate: DateTime(2024),
                                          lastDate: DateTime(2034),
                                          initialDatePickerMode:
                                              DatePickerMode.day,
                                        ).then((value) {
                                          print('start dt : $value');
                                          var year = value!.year;
                                          var month = value.month < 10
                                              ? '0${value.month}'
                                              : value.month;
                                          var day = value.day < 10
                                              ? '0${value.day}'
                                              : value.day;

                                          orderStartDtController.text =
                                              '$year-$month-$day';
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: double.infinity,
                    height: 40.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 80.w,
                          height: 24.h,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '종료일',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 16.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: SizedBox(
                            height: 40.h,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: CustomTextFiled(
                                        controller: orderEndDtController,
                                        hintText: '종료일을 입력해주세요.',
                                        isPassword: false,
                                        isReadOnly: true,
                                        onChanged: (value) {},
                                        onTap: () {
                                          showDatePicker(
                                            context: Get.context!,
                                            initialDate: orderEndDtController
                                                    .text.isEmpty
                                                ? DateTime.now()
                                                : DateTime.parse(
                                                    orderEndDtController.text),
                                            firstDate: DateTime(2024),
                                            lastDate: DateTime(2034),
                                            initialDatePickerMode:
                                                DatePickerMode.day,
                                          ).then((value) {
                                            print('end dt : $value');
                                            var year = value!.year;
                                            var month = value.month < 10
                                                ? '0${value.month}'
                                                : value.month;
                                            var day = value.day < 10
                                                ? '0${value.day}'
                                                : value.day;

                                            orderEndDtController.text =
                                                '$year-$month-$day';
                                          });
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            InkWell(
              onTap: () {
                Get.back();
                if (orderStartDtController.text == "") {
                  return DialogUtil.showSnackBar(Get.context!, '시작일을 입력해주세요.');
                }

                if (orderEndDtController.text == "") {
                  return DialogUtil.showSnackBar(Get.context!, '종료일을 입력해주세요.');
                }

                DialogUtil.showAlertDialog(
                  Get.context!,
                  '실태조사 시작',
                  // '실태조사 ${orderAutoController.text}차수를 선택하셨습니다.',
                  // '${orderStartDtController.text} ~ ${orderEndDtController.text}\현장 실태조사를 시작하시겠습니까?',
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '실태조사 ${orderAutoController.text}차수를 선택하셨습니다.\n',
                          style: TextStyle(
                            color: Theme.of(Get.context!).colorScheme.primary,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                        ),
                        TextSpan(
                          text:
                              '사업기간: ${orderStartDtController.text} ~ ${orderEndDtController.text}\n현장 실태조사를 시작하시겠습니까?',
                          style: TextStyle(
                            color: Color(0xFF1D1D1D),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  () {
                    print('실태조사 시작');
                    selectedIndex.value = 2;
                    Get.back();
                  },
                  () {
                    Get.back();
                  },
                );
              },
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 40.h,
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: ShapeDecoration(
                          color: Color(0xFF246AEA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '저장',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// [사업명] 검색
  Future<void> searchBsnsName(String value) async {
    print('searchBsnsName : $value');
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () async {
      if (value.isEmpty) {
        searchBsnsList.value = bsnsList;
      } else {
        // 검색결과가 없을 경우
        //searchBsnsList.value = bsnsList.where((element) => element.title?.contains(value) ?? false).toList();
        bsnsList.where((element) => element.title?.contains(value) ?? false) !=
                null
            ? searchBsnsList.value = bsnsList
                .where((element) => element.title?.contains(value) ?? false)
                .toList()
            : searchBsnsList.value = [];

        print('searchBsnsList : ${searchBsnsList}');
      }
    });
  }

  /// [차수 자동 입력]
  Future<void> autoSqnc() async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () async {
      // 마지막 차수 가져오기
      var lastSqnc = bsnsSqnc.last.bsnsSqnc;
      print('lastOrder : $lastSqnc');
      orderAutoController.text =
          (int.parse(lastSqnc.toString()) + 1).toString();
    });
  }

  /// 실태조사 -> 토지조사 -> 토지검색
  void handleAccdtlnvstgLadTabSelected(int index) {
    for (var i = 0; i < accdtlnvstgTabLadSelected.length; i++) {
      accdtlnvstgTabLadSelected[i] = false;
    }
    accdtlnvstgTabLadSelected[index] = true;
  }
}
