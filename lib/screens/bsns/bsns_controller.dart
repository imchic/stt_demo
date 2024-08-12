import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ldi/components/CustomGridColumn.dart';
import 'package:ldi/components/custom_button.dart';
import 'package:ldi/components/custom_grid.dart';
import 'package:ldi/screens/sttus/datasource/lad_sttus_inqire_datasource.dart';
import 'package:ldi/screens/sttus/datasource/model/lad_sttus_inqire_model.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../utils/colors.dart';
import '../../utils/dialog_util.dart';
import '../../components/custom_textfield.dart';
import '../accdtlnvstg/datasource/accdtlnvstg_lad_datasource.dart';
import '../accdtlnvstg/datasource/accdtlnvstg_lad_owner_datasource.dart';
import '../accdtlnvstg/datasource/accdtlnvstg_lad_partcpnt_datasource.dart';
import '../accdtlnvstg/datasource/accdtlnvstg_obst_datasource.dart';
import '../accdtlnvstg/datasource/model/accdtlnvstg_lad_model.dart';
import '../accdtlnvstg/datasource/model/accdtlnvstg_lad_owner_model.dart';
import '../accdtlnvstg/datasource/model/accdtlnvstg_lad_partcpnt_model.dart';
import '../accdtlnvstg/datasource/model/accdtlnvstg_obst_model.dart';
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

  late PageController pageController; // 페이지 컨트롤러
  late ScrollController bsnsListScrollController;

  // navermap controller
  late NaverMapController naverMapController;

  // debounce
  Timer? _debounce;

  // 사업선택 탭 아이템
  final bsnsSelectTabItems = [
    Tab(text: '사업선택'),
    // Tab(text: '사업구역'),
    // Tab(text: '조사차수')
  ];

  final bsnsSelectTabIsSelected = [true, false, false].obs;
  final bsnsOwnerTabIsSelected = [true, false, false, false].obs;
  final accdtlnvstgTabIsSelected = [true, false].obs;
  final accdtlnvstgTabLadSelected = [true, false, false].obs;
  final accdtlnvstgTabObstSelected = [true, false].obs;

  final ladSttusInqireTabIsSelected = [false, false, false, false, false, false, false, false, false, false].obs;

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

  // 통계 정보 탭 아이템
  final sttusTabItems = [Tab(text: '토지현황'), Tab(text: '지장물현황')];

  late TabController bsnsTabController;
  late TabController accdtlnvstgTabController;
  late TabController accdtlnvstgLadTabController;
  late TabController accdtlnvstgObstTabController;

  late TabController bsnsOwnerTabController;
  late TabController sttusTabController;

  /// [DataGridController] 는 데이터 그리드의 상태를 제어하는 컨트롤러 클래스이다.

  late DataGridController bsnsListDataGridController;
  late DataGridController bsnsOwnerDataGridController;
  late DataGridController bsnsOrderDataGridController;

  late DataGridController ownerLadInfoDataGridController;
  late DataGridController ownerObstInfoDataGridController;

  late DataGridController accdtlnvstgLadSelectDataGridController;
  late DataGridController accdtlnvstgLadOwnerDataGridController;
  late DataGridController accdtlnvstgLadPartcpntDataGridController;

  late DataGridController accdtlnvstgObstDataGridController;

  late DataGridController ladSttusInqireDataGridController;

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

  // 실태조사 > 소유자/관계인 > 토지
  final accdtlnvstgOwnerLadDataSource = OwnerLadInfoDatasource(items: []).obs;
  Rx<OwnerLadInfoDatasourceModel> selectedOwnerLadInfoData = OwnerLadInfoDatasourceModel().obs;

  // 실태조사 > 소유자/관계인 > 소유자 현황
  final accdtlnvstgLadOwnerDataSource = AccdtlnvstgLadOwnerDatasource(items: []).obs;

  // 실태조사 > 소유자/관계인 > 소유자별 관계인 현황
  final accdtlnvstgLadPartcpntDataSource = AccdtlnvstgLadPartcpntDatasource(items: []).obs;

  // 실태조사 > 지장물내역
  final accdtlnvstgObstDataSource = AccdtlnvstgObstDatasource(items: []).obs;

  // 통계정보 > 토지현황
  final ladSttusInqireDataSource = LadSttusInqireDatasource(items: []).obs;

  /// [Rx] 는 [GetxController] 에서 사용하는 반응형 변수이다.
  RxInt radioValue = 0.obs;

  RxBool isExpanded = false.obs;

  // 사업선택 화면에서 사업선택 여부
  RxBool isBsnsSelectFlag = false.obs;
  // 사업구역 선택 화면에서 사업구역 선택 여부
  RxBool isBsnsZoneSelectFlag = false.obs;
  // 조사차수 화면에서 조사차수 선택 여부
  RxBool isBsnsSqncSelectFlag = false.obs;

  RxInt selectedIndex = 0.obs;
  RxBool isNavOpen = false.obs;

  RxList<BsnsSelectModel> bsnsList = <BsnsSelectModel>[].obs;
  RxList<BsnsSelectModel> searchBsnsList = <BsnsSelectModel>[].obs;

  Rx<BsnsSelectModel> bsns = BsnsSelectModel().obs;
  Rx<BsnsSelectModel> selectedBsns = BsnsSelectModel().obs;

  Rx<BsnsSelectAreaDataSourceModel> bsnsSelectAreaDataSource = BsnsSelectAreaDataSourceModel().obs;

  //Rx<BsnsSelectModel> selectedBsns = BsnsSelectModel().obs;

  RxList<String> leftNavItems = ['사업선택', '소유자관리', '실태조사', '통계정보', '고객카드'].obs;
  RxList businessList = [].obs;

  // select order
  RxInt selectOrder = 0.obs;

  // RxDouble surveyDateWidth = 100.0.obs;

  RxMap<String, double> columnWidths = {
    'addr' : 200.0,
    'bsnsZoneNo': double.nan,
    'bsnsZoneNm': double.nan,
    'lotCnt': double.nan,
    'bsnsAra': double.nan,
    'bsnsReadngPblancDe': double.nan,
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
    'bsnsSqnc': double.nan,
    'bsnsStrtDe': double.nan,
    'bsnsEndDe': double.nan,
    'ownerNo': double.nan,
    'ownerName': double.nan,
    'ladLdgrOwnerNm': double.nan,
    'ladLdgrPosesnDivCd': double.nan,
    'ownerTypeDetail': double.nan,
    'ownerDetail2': double.nan,
    'ownerRegisterNo': double.nan,
    'ownerTelNo': double.nan,
    'ownerPhoneNo': double.nan,
    'lgdongNm': double.nan,
    'lcrtsDivCd': double.nan,
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

  RxBool isLadSttusInqireGridTab1 = false.obs;
  RxBool isLadSttusInqireGridTab2 = false.obs;
  RxBool isLadSttusInqireGridTab3 = false.obs;
  RxBool isLadSttusInqireGridTab4 = false.obs;
  RxBool isLadSttusInqireGridTab5 = false.obs;
  RxBool isLadSttusInqireGridTab6 = false.obs;
  RxBool isLadSttusInqireGridTab7 = false.obs;
  RxBool isLadSttusInqireGridTab8 = false.obs;
  RxBool isLadSttusInqireGridTab9 = false.obs;
  RxBool isLadSttusInqireGridTab10 =false.obs;

  //late RxList<GridColumn> ladSttusInqireColumns;
  RxList<GridColumn> ladSttusInqireColumns = <GridColumn>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    pageController = PageController(initialPage: selectedIndex.value);

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
    sttusTabController = TabController(length: sttusTabItems.length, vsync: this);

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

    // 실태조사 > 토지
    accdtlnvstgLadSelectDataGridController = DataGridController();
    accdtlnvstgLadOwnerDataGridController = DataGridController();
    accdtlnvstgLadPartcpntDataGridController = DataGridController();

    // 실태조사 > 지장물
    accdtlnvstgObstDataGridController = DataGridController();

    // 통계정보 > 토지현황
    ladSttusInqireDataGridController = DataGridController();

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
      print('bsnsListScrollController.offset : ${bsnsListScrollController
          .offset}');
    });

    // /// [사업목록] 조회
    // await fetchBsnsSelectAreaGridDataSource();
    await fetchBsnsList();

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

    // [실태조사 > 토지 정보] 조회
    // await fetchAccdtlnvstgOwnerDataSource();

    /// [실태조사 > 지장물 정보] 조회
    await fetchAccdtlnvstgObstDataSource();

    /// [통계정보 > 토지현황] 조회
    await fetchLadSttusInqireDataSource();

  }

  /// [gridColumn] 데이터그리드 컬럼
  GridColumn gridColumn(String columnName, String label, {bool? isVisble, double? width}) {
    return GridColumn(
      //width: controller.columnWidths[columnName ?? ''] ?? 80,
        width: columnWidths[columnName] ?? width ?? 80,
        columnName: columnName,
        visible: isVisble ?? true,
        label: SizedBox(child: Center(child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp, color: tableTextColor)))));
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
    bsns.add(BsnsSelectModel(no: '1',
        areaNo: '1',
        title: '(T101) 대교천 재해예상사업',
        bizName: '대교천 재해예상사업(1구역)',
        bizArea: '장군면 도계리 341 연기면 세종리 금강합류점검',
        isExpand: false,
        isSelect: false,
        bizDate: DateTime.now().toString()));
    bsns.add(BsnsSelectModel(no: '2',
        areaNo: '2',
        title: '(T201) 안동댐 치수능력증대사업',
        bizName: '안동댐 치수능력증대사업(1구역)',
        bizArea: '경상북도 안동시 상아동',
        isExpand: false,
        isSelect: false,
        bizDate: DateTime.now().toString()));
    bsns.add(BsnsSelectModel(no: '3',
        areaNo: '3',
        title: '(T301) 안동댐직하하천정비사업',
        bizName: '안동댐직하하천정비사업(1구역)',
        bizArea: '경상북도 안동시 성곡동',
        isExpand: false,
        isSelect: false,
        bizDate: DateTime.now().toString()));
    bsns.add(BsnsSelectModel(no: '4',
        areaNo: '4',
        title: '(T401) 안동댐_보상선2',
        bizName: '안동댐_보상선2(1구역)',
        bizArea: '경상북도 안동시 녹전면 구송리',
        isExpand: false,
        isSelect: false,
        bizDate: DateTime.now().toString()));

    bsnsList.value = bsns;
    searchBsnsList.value = bsns;

    return bsnsList;
  }

  /// [사업구역선택] 조회
  fetchBsnsSelectAreaGridDataSource() async {
    var bsns = <BsnsSelectAreaDataSourceModel>[];
    for (var i = 0; i < 10; i++) {
      bsns.add(BsnsSelectAreaDataSourceModel(
          bsnsNo: i,
          bsnsZoneNo: i,
          bsnsZoneNm: '${BsnsController.to.selectedBsns.value.title ?? ''}($i구역)',
          lotCnt: Random().nextInt(10),
          bsnsAra: Random().nextInt(5000),
          bsnsReadngPblancDe: '2021-10-0$i'));
    }
    bsnsListDataSource.value = BsnsSelectAreaDataSource(items: bsns);
  }

  /// [소유자 및 관리인] 조회
  fetchBsnsOwnerDataSource() async {
    for (var i = 0; i < 10; i++) {
      bsnsOwner.add(OwnerDataSourceModel(
          no: i,
          ownerNo: '10000${Random().nextInt(100)}'.toString(),
          ladLdgrOwnerNm: randomName(),
          ladLdgrPosesnDivCd: randomLdgrPosesnDivCd(),
          ownerRegisterNo: '${randomBirth()}-1000000',
          ownerTelNo: '${randomTelNo()}',
          ownerPhoneNo: '${randomPhoneNo()}'));
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

  /// [소유자관리 > 토지정보] 조회
  fetchOwnerLadInfoDataSource() async {
    var ownerLadInfo = <OwnerLadInfoDatasourceModel>[];
    for (var i = 0; i < 10; i++) {
      ownerLadInfo.add(OwnerLadInfoDatasourceModel(
          lgdongNm: '대전광역시 유성구 봉명동',
          lcrtsDivCd: '일반',
          mlnoLtno: '12$i',
          slnoLtno: '45$i',
          ofcbkLndcgrDivCd: randomLndcgrDivCd(),
          sttusLndcgrDivCd: randomLndcgrDivCd(),
          ofcbkAra: Random().nextInt(1000),
          incrprAra: Random().nextInt(1000),
          cmpnstnInvstgAra: Random().nextInt(1000),
          acqsPrpDivCd: '기타',
          aceptncPrpDivCd: '취득',
          accdtInvstgSqnc: i,
          accdtInvstgDe: '2021-10-0$i',
          invstgDt: '2021-10-0$i',
          cmpnstnDtaChnStatDivCd: '변경',
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
          obstSeq: '$i',
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
    accdtlnvstgOwnerLadDataSource.value =
        OwnerLadInfoDatasource(items: [accdtlnvstgOwner]);

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
    this.accdtlnvstgLadOwnerDataSource.value =
        AccdtlnvstgLadOwnerDatasource(items: accdtlnvstgOwnerDataSource);


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

    this.accdtlnvstgLadPartcpntDataSource.value =
        AccdtlnvstgLadPartcpntDatasource(items: accdtlnvstgPartcpntDataSource);
  }

  /// [실태조사 > 지장물 정보] 조회
  fetchAccdtlnvstgObstDataSource() async {
    var accdtlnvstgObst = <AccdtlnvstgObstModel>[];
    for (var i = 0; i < 10; i++) {
      accdtlnvstgObst.add(AccdtlnvstgObstModel(
          obstSeq: int.parse('$i'),
          obstDivCd:'${randomObstDivCd()}',
          cmpnstnThingKndDtls: '${randomCmpnstnThingKndDtls()}',
          obstStrctStndrdInfo: '${randomCmpnstnThingKndDtls()}',
          cmpnstnQtyAraVu: Random().nextInt(1000),
          cmpnstnThingUnitDivCd: '${randomCmpnstnThingKndDtls()}',
          invstrEmpNo: '100${Random().nextInt(100)}',
          invstrJgrdNm: '대리',
          invstrNm: randomName(),
          obsrverNm: randomName(),
          accdtInvstgObsrverAddr: '대전광역시 유성구 봉명동',
          acddtInvstgSqnc: '$i차',
          invstgDt: '2021-10-0$i',
          spcitm: '특이사항'));
    }

    accdtlnvstgObstDataSource.value =
        AccdtlnvstgObstDatasource(items: accdtlnvstgObst);
  }

  /// [통계정보 > 토지현황] 조회
  fetchLadSttusInqireDataSource() async {
    var ladSttusInqire = <LadSttusInqireModel>[];
    for (var i = 0; i < 10; i++) {
      ladSttusInqire.add(LadSttusInqireModel(
          addr : '대전광역시 유성구 봉명동',
          lcrtsNm : '일반',
          mlnoLtno : '12$i',
          slnoLtno : '45$i',
          ofcbkLndcgrDivCd : randomLndcgrDivCd(),
          sttusLndcgrDivCd : randomLndcgrDivCd(),
          prgsStepInfo : '구조규격정보',
          acqsPrpDivCd : '보상수량면적값',
          ofcbkAra : '보상물건단위구분코드',
          incrprAra : '현황지목구분코드',
          cmpnstnInvstgAra : '취득용도구분코드',
          aceptncUseDivCd : '수용용도구분코드',
          accdtInvstgDe : '2021-10-0$i',
          accdtInvstgSqnc : '$i차',
          ownerNo: '$i',
          ownerNm: '홍길동',
          posesnShreNmrtrInfo: '개인',
          posesnShreDnmntrInfo: '개인',
          apasmtDivCd: '조회',
          apasmtSqnc: '$i',
          prceDt: '2021-10-0$i',
          apasmtInsttNm1: '변경',
          apasmtInsttEvlUpc1: '기타',
          apasmtInsttEvlAmt1: '기타',
          apasmtInsttNm2: '기타',
          apasmtInsttEvlUpc2: '기타',
          apasmtInsttEvlAmt2: '기타',
          apasmtInsttNm3: '기타',
          apasmtInsttEvlUpc3: '기타',
          apasmtInsttEvlAmt3: '기타',
          cmpnstnCmptnUpc: '기타',
          cpsmnCmptnAmt: '기타',
          pymntRequstDt: '2021-10-0$i',
          cpsmnUpc: '기타',
          cpsmnPymamt: '기타',
          rgistDt: '기타',
          aceptncAdjdcUpc: '기타',
          aceptncAdjdcAmt: '기타',
          aceptncAdjdcDt: '2021-10-0$i',
          aceptncUseBeginDe: '기타',
          aceptncAdjdcPymntDe: '기타',
          cpsmnPymntLdgmntDivCd: '기타',
          objctnAdjdcUpc: '기타',
          objctnAdjdcAmt: '기타',
          objctnAdjdcDt: '기타',
      ));
    }

    ladSttusInqireColumns.value = [];

    ladSttusInqireColumns.value = [
      gridColumn('addr', '소재지'),
      gridColumn('lcrtsNm', '특지'),
      gridColumn('mlnoLtno', '본번'),
      gridColumn('slnoLtno', '부번'),

      gridColumn('ofcbkLndcgrDivCd', '공부'),
      gridColumn('sttusLndcgrDivCd', '현황'),

      gridColumn('prgsStepInfo', '진행단계'),
      gridColumn('acqsPrpDivCd', '취득용도'),

      gridColumn('ofcbkAra', '공부'),
      gridColumn('incrprAra', '편입'),

      gridColumn('cmpnstnInvstgAra', '조사', isVisble: isLadSttusInqireGridTab1.value),
      gridColumn('aceptncUseDivCd', '수용/사용',isVisble: isLadSttusInqireGridTab1.value),
      gridColumn('accdtInvstgDe', '조사일', isVisble: isLadSttusInqireGridTab1.value),
      gridColumn('accdtInvstgSqnc', '조사차수', isVisble: isLadSttusInqireGridTab1.value),

      gridColumn('ownerNo', '소유자번호', isVisble: isLadSttusInqireGridTab2.value),
      gridColumn('ownerDivCd', '구분', isVisble: isLadSttusInqireGridTab2.value),
      gridColumn('ownerNm', '소유자명', isVisble: isLadSttusInqireGridTab2.value),
      gridColumn('ownerRgsbukAddr', '등기부주소', isVisble: isLadSttusInqireGridTab2.value),
      gridColumn('posesnShreNmrtrInfo', '분자', isVisble: isLadSttusInqireGridTab2.value),
      gridColumn('posesnShreDnmntrInfo', '분모', isVisble: isLadSttusInqireGridTab2.value),

      gridColumn('apasmtDivCd', '평가구분', isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtSqnc', '평가차수', isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('prceDt', '가격시점', isVisble: isLadSttusInqireGridTab3.value),

      // a평가법인
      gridColumn('apasmtInsttNm1', '법인명', isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlUpc1', '단가', isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlAmt1', '금액', isVisble: isLadSttusInqireGridTab3.value),

      // b평가법인
      gridColumn('apasmtInsttNm2', '법인명', isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlUpc2', '단가', isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlAmt2', '금액', isVisble: isLadSttusInqireGridTab3.value),

      // c평가법인
      gridColumn('apasmtInsttNm3', '법인명', isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlUpc3', '단가', isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlAmt3', '금액', isVisble: isLadSttusInqireGridTab3.value),

      // 보상비산정
      gridColumn('cmpnstnCmptnUpc', '산정단가', isVisble: isLadSttusInqireGridTab4.value),
      gridColumn('cpsmnCmptnAmt', '산정금액', isVisble: isLadSttusInqireGridTab4.value),

      // 보상비지급
      gridColumn('pymntRequstDt', '지급요청일', isVisble: isLadSttusInqireGridTab5.value),
      gridColumn('cpsmnUpc', '지급단가', isVisble: isLadSttusInqireGridTab5.value),
      gridColumn('cpsmnPymamt', '지급금액', isVisble: isLadSttusInqireGridTab5.value),
      gridColumn('rgistDt', '등기일자', isVisble: isLadSttusInqireGridTab5.value),

      // 수용재결
      gridColumn('aceptncAdjdcUpc', '재결단가', isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('aceptncAdjdcAmt', '재결금액', isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('aceptncAdjdcDt', '재결일자', isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('aceptncUseBeginDe', '수용/사용개시일', isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('aceptncAdjdcPymntDe', '지급요청일자', isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('aceptncRgistDt', '등기일자', isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('cpsmnPymntLdgmntDivCd', '지급/공탁', isVisble: isLadSttusInqireGridTab6.value),

      // 이의재결
      gridColumn('objctnAdjdcUpc', '재결단가', isVisble: isLadSttusInqireGridTab7.value),
      gridColumn('objctnAdjdcAmt', '재결금액', isVisble: isLadSttusInqireGridTab7.value),
      gridColumn('objctnAdjdcDt', '재결일자', isVisble: isLadSttusInqireGridTab7.value),
      gridColumn('objctnPymntRequstDt', '지급요청일자', isVisble: isLadSttusInqireGridTab7.value),
      gridColumn('objctncpsmnPymntLdgmntDivCd', '지급/공탁', isVisble: isLadSttusInqireGridTab7.value),
    ];

    ladSttusInqireDataSource.value =
        LadSttusInqireDatasource(items: ladSttusInqire);
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
                                  color: tableTextColor,
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
                                    child: CustomTextField(
                                      controller: orderAutoController,
                                      hintText: orderAutoController.text,
                                      isPassword: false,
                                      isReadOnly: true,
                                      textColor: tableTextColor,
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
                                  color: tableTextColor,
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
                                    child: CustomTextField(
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
                                  color: tableTextColor,
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
                                    child: CustomTextField(
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
                  0,
                  '실태조사 시작',
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                          '실태조사 ${orderAutoController.text}차수를 선택하셨습니다.\n',
                          style: TextStyle(
                            color: Theme
                                .of(Get.context!)
                                .colorScheme
                                .primary,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                        ),
                        TextSpan(
                          text:
                          '사업기간: ${orderStartDtController
                              .text} ~ ${orderEndDtController
                              .text}\n현장 실태조사를 시작하시겠습니까?',
                          style: TextStyle(
                            color: tableTextColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onOk: () {
                    print('실태조사 시작');
                    isBsnsSelectFlag.value = false;
                    isBsnsSqncSelectFlag.value = false;
                    isBsnsZoneSelectFlag.value = false;
                    pageController.jumpToPage(2);
                    Get.back();
                  },
                  onCancel: () {
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

  /// 실태조사 -> 지장물조사 -> 지장물검색
  void handleAccdtlnvstgObstTabSelected(int index) {
    for (var i = 0; i < accdtlnvstgTabObstSelected.length; i++) {
      accdtlnvstgTabObstSelected[i] = false;
    }
    accdtlnvstgTabObstSelected[index] = true;
  }

  /// 통계정보 > 토지현황 > 토지검색
  Future<void> handleLadSttusInqireTabSelected(int index) async {

    ladSttusInqireTabIsSelected[index] = !ladSttusInqireTabIsSelected[index];
    print('ladSttusInqireTabIsSelected : $ladSttusInqireTabIsSelected');

  }

  void addBsns() {
    DialogUtil.showAlertDialog(Get.context!, 0, '토지 현실이용현황 조회 및 입력',
    child: SizedBox(
      width: 520.w,
      height: 166.h,
      child: Column(
        children: [
          Container(
            height: 52.h,
            child: Row(
              children: [
                Container(
                  width: 100.w,
                  height: 52.h,
                  color: Color(0XFFE5E8ED),
                  child: Center(
                    child: Text(
                      '지목선택',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Color(0XFFE5E8ED),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: 36.h,
                              child: CustomTextField(
                                controller: orderController,
                                hintText: '지목을 입력해주세요.',
                                isPassword: false,
                                isReadOnly: false,
                                onChanged: (value) {
                                  print('orderController : $value');
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: CustomButton(
                              color: Color(0XFFE5E8ED),
                              text: '조회',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
          SizedBox(height: 1.h),
          Container(
              height: 52.h,
              child: Row(
                children: [
                  Container(
                    width: 100.w,
                    height: 52.h,
                    color: Color(0XFFE5E8ED),
                    child: Center(
                      child: Text(
                        '면적(㎡)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        // border only bottom
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0XFFE5E8ED),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 36.h,
                                child: CustomTextField(
                                  controller: orderController,
                                  hintText: '',
                                  isPassword: false,
                                  isReadOnly: false,
                                  onChanged: (value) {
                                    print('orderController : $value');
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
          SizedBox(height: 1.h),
          Container(
              height: 52.h,
              child: Row(
                children: [
                  Container(
                    width: 100.w,
                    height: 52.h,
                    color: Color(0XFFE5E8ED),
                    child: Center(
                      child: Text(
                        '용도지구 \n 및 지역',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0XFFE5E8ED),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 36.h,
                                child: CustomTextField(
                                  controller: orderController,
                                  hintText: '',
                                  isPassword: false,
                                  isReadOnly: false,
                                  onChanged: (value) {
                                    print('orderController : $value');
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 38.w,
                                      height: 38.w,
                                      padding: EdgeInsets.all(4),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/icons/ic_microphone.svg',
                                      )
                                  ),
                                  SizedBox(width: 10.w),
                                  Container(
                                    width: 38.w,
                                    height: 38.w,
                                    padding: EdgeInsets.all(4),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1, color: Color(0xFFD8D8D8)),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/ic_pen.svg',
                                    )
                                  ),
                                  // Container(
                                  //   width: 36.w,
                                  //   height: 36.h,
                                  //   decoration: BoxDecoration(
                                  //       color: Color(0xFFFFFFFF),
                                  //       borderRadius: BorderRadius.circular(6.r),
                                  //       border: Border.all(color: borderLine)
                                  //   ),
                                  //   child: SvgPicture.asset(
                                  //     width: 10.w,
                                  //     height: 10.h,
                                  //     'assets/icons/ic_pen.svg',
                                  //     fit: BoxFit.contain,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
          SizedBox(height: 1.h),
        ],
      ),
    ),
    onOk: () {
      print('토지 현실이용현황 조회 및 입력');
      isBsnsSelectFlag.value = false;
      isBsnsSqncSelectFlag.value = false;
      isBsnsZoneSelectFlag.value = false;
      pageController.jumpToPage(2);
      Get.back();
    }, onCancel: () {
      Get.back();
    });
  }

  randomName() {
    var names = [
      '김덕수',
      '김덕순',
      '김덕자',
      '김덕영',
      '김덕희',
      '김덕호',
      '김덕준',
      '김덕중',
      '김덕철',
      '김덕훈',
    ];

    return names[Random().nextInt(names.length)];
  }

  randomLdgrPosesnDivCd() {
    var names = [
      '개인',
      '법인',
      '기타',
    ];

    return names[Random().nextInt(names.length)];
  }

  randomBirth() {
    var names = [
      '891208',
      '910101',
      '920202',
      '930303',
      '940404',
      '950505',
      '960606',
      '970707',
      '980808',
      '990909',
    ];

    return names[Random().nextInt(names.length)];
  }

  randomPhoneNo() {
    var names = [
      '010-0000-0000',
      '010-1111-1111',
      '010-2222-2222',
      '010-3333-3333',
      '010-4444-4444',
      '010-5555-5555',
      '010-6666-6666',
      '010-7777-7777',
      '010-8888-8888',
      '010-9999-9999',
    ];

    return names[Random().nextInt(names.length)];
  }


  randomTelNo() {
    var names = [
      '042-000-0000',
      '042-111-1111',
      '042-222-2222',
      '042-333-3333',
      '042-444-4444',
      '042-555-5555',
      '042-666-6666',
      '042-777-7777',
      '042-888-8888',
      '042-999-9999',
    ];

    return names[Random().nextInt(names.length)];
  }

  randomLndcgrDivCd() {
    var names = [
    '미등록',
    '전',
    '답',
    '과수원',
    '목장용지',
    '없음',
    '광천지',
    '염전',
    '대',
    '공장용지',
    '학교용지',
    '도로',
    '철도용지',
    '하천',
    '제방',
    '구거',
    '유지',
    '수도용지',
    '공원',
    '체육용지',
    '보상비산정',
    '종교용지',
    '사적지',
    '묘지',
    '보상비산정완료',
    '주차장',
    '주유소용지',
    '창고용지',
    '양어장',
    '지적도',
    '(無)',
    '임야',
    '유원지',
    '잡종지',
    '묵답',
    '묵전',
    '수',
    '전,답',
    '학',
    '기타'
    ];

    return names[Random().nextInt(names.length)];
  }

  randomObstDivCd() {
    var names = [
     '건축물'
     '공작물'
     '과수 등',
     '입목',
     '묘목',
     '농작물'
     '농기구'
     '축산보상',
     '분묘',
     '개간비',
     '영업보상',
     '광업권',
     '어업보상',
     '영농손실액',
     '이사비'
     '주거이전비',
     '(소유자)'
     '이주정착금',
     '이주정착지원금'
     '생활안정지원금',
     '가산보상',
     '토지사용료',
     '이농/이어비',
     '휴직/실직보상',
     '주거이전비(세입자)',
     '분묘이장보조비',
     '동산이전비',
     '구축물',
     '물사용권',
     '기타',
    ];

    return names[Random().nextInt(names.length)];
  }

  randomCmpnstnThingKndDtls() {
    var names = [
      '건축물',
      '공작물',
      '과수 등',
      '입목',
      '묘목',
      '농작물',
      '농기구',
      '축산보상',
      '분묘',
      '개간비',
      '영업보상',
      '광업권',
      '어업보상',
      '영농손실액',
      '이사비',
      '주거이전비',
      '(소유자)',
      '이주정착금',
      '이주정착지원금',
      '생활안정지원금',
      '가산보상',
      '토지사용료',
      '이농/이어비',
      '휴직/실직보상',
      '주거이전비(세입자)',
      '분묘이장보조비',
      '동산이전비',
      '구축물',
      '물사용권',
      '기타',
    ];

    return names[Random().nextInt(names.length)];
  }

  }