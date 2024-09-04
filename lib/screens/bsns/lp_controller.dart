import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ldi/components/custom_bsns_badge.dart';
import 'package:ldi/components/custom_microphonewithpen_button.dart';
import 'package:ldi/screens/bsns/bsns_plan_model.dart';
import 'package:ldi/screens/bsns/select/bsns_plan_select_area_model.dart';
import 'package:ldi/screens/bsns/sqnc/bsns_accdtinvstg_sqnc_datasource.dart';
import 'package:ldi/screens/bsns/sqnc/model/bsns_accdtinvstg_sqnc_model.dart';
import 'package:ldi/screens/cstmr/aceptnc/cstmrcard_lad_aceptnc_datasource.dart';
import 'package:ldi/screens/cstmr/aceptnc/model/cstmrcard_obst_aceptnc_datasource_model.dart';
import 'package:ldi/screens/cstmr/cmpnstn/model/cstmrcard_cmpnstn_datasource_model.dart';
import 'package:ldi/screens/cstmr/confirm/cstmrcard_confirm_datasource.dart';
import 'package:ldi/screens/cstmr/confirm/model/cstmrcard_confirm_datasource_model.dart';
import 'package:ldi/screens/cstmr/fobjct/cstmrcard_fobjct_datasource.dart';
import 'package:ldi/screens/cstmr/fobjct/model/cstmrcard_fobject_datasource_model.dart';
import 'package:ldi/screens/cstmr/lwst/cstmrcard_lad_lwst_datasource.dart';
import 'package:ldi/screens/cstmr/lwst/model/cstmrcard_lad_lwst_datasource_model.dart';
import 'package:ldi/screens/cstmr/objc/model/cstmrcard_lad_objc_datasource_model.dart';
import 'package:ldi/screens/cstmr/objc/model/cstmrcard_obst_objc_datasource_model.dart';
import 'package:ldi/screens/cstmr/partcpnt/model/cstmrcard_lad_partcpnt_datasource_model.dart';
import 'package:ldi/screens/cstmr/reprchs/cstmrcard_reprchs_datasource.dart';
import 'package:ldi/screens/cstmr/reprchs/model/cstmrcard_reprchs_datasource_model.dart';
import 'package:ldi/screens/owner/datasource/model/owner_info_model.dart';
import 'package:ldi/screens/sttus/datasource/lad_sttus_inqire_datasource.dart';
import 'package:ldi/screens/sttus/datasource/model/lad_sttus_inqire_model.dart';
import 'package:ldi/screens/sttus/datasource/model/obst_sttus_inqire_model.dart';
import 'package:ldi/utils/applog.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../components/custom_button.dart';
import '../../utils/colors.dart';
import '../../utils/common_util.dart';
import '../../utils/dialog_util.dart';
import '../../components/custom_textfield.dart';
import '../accdtlnvstg/datasource/accdtlnvstg_lad_datasource.dart';
import '../accdtlnvstg/datasource/accdtlnvstg_lad_owner_datasource.dart';
import '../accdtlnvstg/datasource/accdtlnvstg_lad_partcpnt_datasource.dart';
import '../accdtlnvstg/datasource/accdtlnvstg_obst_datasource.dart';
import '../accdtlnvstg/datasource/accdtlnvstg_obst_owner_datasource.dart';
import '../accdtlnvstg/datasource/model/accdtlnvstg_lad_model.dart';
import '../accdtlnvstg/datasource/model/accdtlnvstg_lad_owner_model.dart';
import '../accdtlnvstg/datasource/model/accdtlnvstg_lad_partcpnt_model.dart';
import '../accdtlnvstg/datasource/model/accdtlnvstg_obst_model.dart';
import '../accdtlnvstg/datasource/model/accdtlnvstg_obst_owner_model.dart';
import '../cstmr/aceptnc/cstmrcard_obst_aceptnc_datasource.dart';
import '../cstmr/aceptnc/model/cstmrcard_lad_aceptnc_datasource_model.dart';
import '../cstmr/cmpnstn/cstmrcard_cmpnstn_datasource.dart';
import '../cstmr/lwst/cstmrcard_obst_lwst_datasource.dart';
import '../cstmr/lwst/model/cstmrcard_obst_lwst_datasource_model.dart';
import '../cstmr/objc/cstmrcard_lad_objc_datasource.dart';
import '../cstmr/objc/cstmrcard_obst_objc_datasource.dart';
import '../cstmr/partcpnt/cstmrcard_lad_partcpnt_datasource.dart';
import '../cstmr/partcpnt/cstmrcard_obst_partcpnt_datasource.dart';
import '../cstmr/partcpnt/model/cstmrcard_obst_partcpnt_datasource_model.dart';
import '../owner/datasource/owner_datasource.dart';
import '../owner/datasource/model/owner_datasource_model.dart';
import '../owner/lad/model/owner_lad_info_datasource_model.dart';
import '../owner/lad/owner_lad_info_datasource.dart';
import '../owner/obst/model/owner_obst_info_datasource_model.dart';
import '../owner/obst/owner_obst_info_datasource.dart';
import '../sttus/datasource/obst_sttus_inqire_datasource.dart';
import 'datasource/bsns_select_area_datasource.dart';
import 'datasource/model/bsns_select_area_datasource_model.dart';
import 'select/bsns_select_model.dart';
import 'sqnc/bsns_sqnc_datasource.dart';
import 'sqnc/model/bsns_sqnc_datasource_model.dart';

import 'package:http/http.dart' as http;

class LpController extends GetxController with GetTickerProviderStateMixin {
  static LpController get to => Get.find();

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

  // 통계정보 > 토지현황 > 취득용도
  late TextEditingController sttusInqireAcqstnPrpsController;

  // 통계정보 > 토지현황 > 조사차수
  late TextEditingController sttusInqireBsnsSqncController;

  late TextEditingController orderAutoController;
  late TextEditingController orderStartDtController;
  late TextEditingController orderEndDtController;
  late TextEditingController orderController;

  // 소유자 관리
  late TextEditingController ownerNameSearchController;
  late TextEditingController ownerRegisterNoSearchController;

  // 실태조사
  late TextEditingController accdtlnvstgAcqstnPrpsController;

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

  // 통계정보 탭 아이템 선택 여부
  final sttusInqireTabIsSelected = [
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ].obs;

  // 고객카드 탭 아이템 선택 여부
  final customerCardTabIsSelected = [true, false].obs;

  // 고객카드 상세 탭 아이템 선택 여부
  final customerCardDetailTabIsSelected = [true, false, false, false, false, false, false, false].obs;

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
  late DataGridController ownerListDataGridController;
  late DataGridController bsnsOrderDataGridController;
  late DataGridController bsnsAccdtinvstgSqncDataGridController;

  late DataGridController ownerLadInfoDataGridController;
  late DataGridController ownerObstInfoDataGridController;

  late DataGridController accdtlnvstgLadDataGridController;
  late DataGridController accdtlnvstgLadDataSearchGridController;
  late DataGridController accdtlnvstgLadOwnerDataGridController;
  late DataGridController accdtlnvstgLadPartcpntDataGridController;

  late DataGridController accdtlnvstgObstDataGridController;
  late DataGridController accdtlnvstgObstOwnerDataGridController;
  late DataGridController accdtlnvstgObstPartcpntDataGridController;

  late DataGridController ladSttusInqireDataGridController;
  late DataGridController obstSttusInqireDataGridController;

  late DataGridController cstmrCardLadPartcpntDataGridController;
  late DataGridController cstmrCardObstPartcpntDataGridController;
  late DataGridController cstmrCardCmpnstnDataGridController;
  late DataGridController cstmrCardLadAceptncDataGridController;
  late DataGridController cstmrCardObstAceptncDataGridController;
  late DataGridController cstmrCardLadObjcDataGridController;
  late DataGridController cstmrCardObstObjcDataGridController;
  late DataGridController cstmrCardLadLwstDataGridController;
  late DataGridController cstmrCardObstLwstDataGridController;
  late DataGridController cstmrCardReprchsDataGridController;
  late DataGridController cstmrCardConfirmDataGridController;
  late DataGridController cstmrCardFobjctDataGridController;

  /// [BsnsSelectAreaDataSource] 는 [DataGridSource] 를 상속받아 구현한 데이터 소스 클래스이다.
  final bsnsListDataSource = BsnsSelectAreaDataSource(items: []).obs; // 사업구역선택

  final ownerListDataSource = OwnerDatasource(items: []).obs; // 소유자

  final ownerLadInfoDataSource =
      OwnerLadInfoDatasource(items: []).obs; // 소유자 및 관계인
  final ownerObstInfoDataSource =
      OwnerObstInfoDatasource(items: []).obs; // 지장물정보

  final bsnsSqncDataSource = BsnsSqncDatasource(items: []).obs; // 조사차수
  RxList<BsnsSqncDatasourceModel> bsnsSqnc = <BsnsSqncDatasourceModel>[].obs;

  final selectSqnc = BsnsAccdtinvstgSqncModel().obs;

  final bsnsAccdtinvstgSqncDataSource =
      BsnsAccdtinvstgSqncDatasource(items: []).obs; // 조사차수

  // 실태조사 > 토지내역
  final accdtlnvstgLadDataSource = AccdtlnvstgLadDatasource(items: []).obs;

  // 실태조사 > 선택 토지 내역
  final accdtlnvstgLadSearchDataSource = AccdtlnvstgLadDatasource(items: []).obs;

  // 실태조사 > 소유자/관계인 > 토지
  final accdtlnvstgOwnerLadDataSource = OwnerLadInfoDatasource(items: []).obs;
  Rx<OwnerLadInfoDatasourceModel> selectedOwnerLadInfoData =
      OwnerLadInfoDatasourceModel().obs;

  // 실태조사 > 소유자/관계인 > 소유자 현황
  final accdtlnvstgLadOwnerDataSource =
      AccdtlnvstgLadOwnerDatasource(items: []).obs;

  Rx<AccdtlnvstgLadModel> selectedOwnerLadOwnerData =
      AccdtlnvstgLadModel().obs;

  // 실태조사 > 소유자/관계인 > 소유자별 관계인 현황
  final accdtlnvstgLadPartcpntDataSource =
      AccdtlnvstgLadPartcpntDatasource(items: []).obs;

  // 실태조사 > 지장물내역
  final accdtlnvstgObstDataSource = AccdtlnvstgObstDatasource(items: []).obs;

  // 실태조사 > 지장물내역 > 소유자/관계인
  final accdtlnvstgObstOwnerDataSource = AccdtlnvstgObstOwnerDatasource(items: []).obs;

  // 통계정보 > 토지현황
  final ladSttusInqireDataSource = LadSttusInqireDatasource(items: []).obs;
  final obstSttusInqireDataSource = ObstSttusInqireDatasource(items: []).obs;

  // 고객카드
  final cstmrcardLadPartcpntDataSource = CstmrcardLadPartcpntDatasource(items: []).obs;
  final cstmrcardObstPartcpntDatasource = CstmrcardObstPartcpntDatasource(items: []).obs;
  final cstrmcardCmpnstnDatSource = CstmrcardCmpnstnDatasource(items: []).obs;
  final cstmrcardLadAceptncDatasource = CstmrcardLadAceptncDatasource(items: []).obs;
  final cstmrcardObstAceptncDatasource = CstmrcardObstAceptncDatasource(items: []).obs;
  final cstmrcardLadObjcDatasource = CstmrcardLadObjcDatasource(items: []).obs;
  final cstmrcardObstObjcDatasource = CstmrcardObstObjcDatasource(items: []).obs;
  final cstmrcardLadLwstDatasource = CstmrcardLadLwstDatasource(items: []).obs;
  final cstmrcardObstLwstDatasource = CstmrcardObstLwstDatasource(items: []).obs;
  final cstmrcardReprchsDatasource = CstmrcardReprchsDatasource(items: []).obs;
  final cstmrcardConfirmDatasource = CstmrcardConfirmDatasource(items: []).obs;
  final cstmrcardFobjctDatasource = CstmrcardFobjctDatasource(items: []).obs;

  /// [Rx] 는 [GetxController] 에서 사용하는 반응형 변수이다.
  RxInt radioValue = 0.obs;

  // 사업선택 화면에서 사업선택 여부
  RxBool isBsnsSelectFlag = false.obs;

  // 사업구역 선택 화면에서 사업구역 선택 여부
  RxBool isBsnsZoneSelectFlag = false.obs;

  // 조사차수 화면에서 조사차수 선택 여부
  RxBool isBsnsSqncSelectFlag = false.obs;

  RxInt selectedIndex = 0.obs;
  RxBool isNavOpen = false.obs;

  // 사업선택
  Rx<BsnsSelectModel> selectedBsns = BsnsSelectModel().obs;
  Rx<OwnerInfoModel> selectedOwner = OwnerInfoModel().obs;
  RxList<LadSttusInqireModel> ladSttusInqireList = <LadSttusInqireModel>[].obs;

  Rx<BsnsSelectAreaDataSourceModel> bsnsSelectAreaDataSource =
      BsnsSelectAreaDataSourceModel().obs;
  Rx<BsnsPlanSelectAreaModel> selectedBsnsSelectArea =
      BsnsPlanSelectAreaModel().obs;

  RxList<String> leftNavItems = ['사업선택', '소유자관리', '실태조사', '통계정보', '고객카드'].obs;
  RxList businessList = [].obs;

  // select order
  RxInt selectOrder = 0.obs;

  RxMap<String, double> columnWidths = {
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
  RxList<String> accdtlnvstgAcqstnPrpsList = [
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

  //  통계 상세 탑
  RxBool isLadSttusInqireGridTab1 = true.obs;
  RxBool isLadSttusInqireGridTab2 = true.obs;
  RxBool isLadSttusInqireGridTab3 = false.obs;
  RxBool isLadSttusInqireGridTab4 = false.obs;
  RxBool isLadSttusInqireGridTab5 = false.obs;
  RxBool isLadSttusInqireGridTab6 = false.obs;
  RxBool isLadSttusInqireGridTab7 = false.obs;

  //late RxList<GridColumn> ladSttusInqireColumns;
  RxList<GridColumn> ladSttusInqireColumns = <GridColumn>[].obs;
  RxList<GridColumn> obstSttusInqireColumns = <GridColumn>[].obs;

  RxList<BsnsPlanModel> bsnsPlanList = <BsnsPlanModel>[].obs;
  RxList<BsnsPlanModel> searchBsnsPlanList = <BsnsPlanModel>[].obs;

  Rx<BsnsPlanModel> selectBsnsPlan = BsnsPlanModel().obs;

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

    accdtlnvstgAcqstnPrpsController = TextEditingController();

    sttusInqireAcqstnPrpsController = TextEditingController();
    sttusInqireBsnsSqncController = TextEditingController();

    accdtlnvstgTabController =
        TabController(length: accdtlnvstgTabItems.length, vsync: this);
    bsnsTabController =
        TabController(length: bsnsSelectTabItems.length, vsync: this);
    bsnsOwnerTabController =
        TabController(length: bsnsOwnerTabItems.length, vsync: this);
    accdtlnvstgLadTabController =
        TabController(length: accdtlnvstgLadTabItems.length, vsync: this);
    accdtlnvstgObstTabController =
        TabController(length: accdtlnvstgObstTabItems.length, vsync: this);
    sttusTabController =
        TabController(length: sttusTabItems.length, vsync: this);

    orderController = TextEditingController();

    bsnsListScrollController = ScrollController();

    /// [DataGridController] 는 데이터 그리드의 상태를 제어하는 컨트롤러 클래스이다.
    bsnsListDataGridController = DataGridController();
    ownerListDataGridController = DataGridController();
    bsnsOrderDataGridController = DataGridController();
    bsnsAccdtinvstgSqncDataGridController = DataGridController();

    // 소유자관리 > 토지정보
    ownerLadInfoDataGridController = DataGridController();
    // 소유자관리 > 지장물정보
    ownerObstInfoDataGridController = DataGridController();

    // 실태조사 > 토지
    accdtlnvstgLadDataGridController = DataGridController();
    accdtlnvstgLadDataSearchGridController = DataGridController();

    // 실태조사 > 소유자/관계인
    accdtlnvstgLadOwnerDataGridController = DataGridController();
    accdtlnvstgLadPartcpntDataGridController = DataGridController();

    // 실태조사 > 지장물
    accdtlnvstgObstDataGridController = DataGridController();
    accdtlnvstgObstOwnerDataGridController = DataGridController();

    // 통계정보 > 토지현황
    ladSttusInqireDataGridController = DataGridController();
    // 통계정보 > 지장물현황
    obstSttusInqireDataGridController = DataGridController();

    cstmrCardLadPartcpntDataGridController = DataGridController();
    cstmrCardObstPartcpntDataGridController = DataGridController();
    cstmrCardCmpnstnDataGridController = DataGridController();
    cstmrCardLadAceptncDataGridController = DataGridController();
    cstmrCardObstAceptncDataGridController = DataGridController();
    cstmrCardLadObjcDataGridController = DataGridController();
    cstmrCardObstObjcDataGridController = DataGridController();
    cstmrCardLadLwstDataGridController = DataGridController();
    cstmrCardObstLwstDataGridController = DataGridController();
    cstmrCardReprchsDataGridController = DataGridController();
    cstmrCardConfirmDataGridController = DataGridController();
    cstmrCardFobjctDataGridController = DataGridController();

    bsnsTabController.addListener(() {
      AppLog.d('bsnsTabController.index : ${bsnsTabController.index}');
      // 해당위치로 이동

      // 사업구역 없이는 탭 1번, 2번 이동 불가능
      if (selectedBsns.value.title == null && bsnsTabController.index > 0) {
        bsnsTabController.index = 0;
        DialogUtil.showSnackBar(Get.context!, '사업구역', '사업을 선택해주세요.');
        return;
      }

      // 이전 탭 선택시 초기화
      if (bsnsTabController.index == 0) {
        selectedBsns.value = BsnsSelectModel();
      }
    });

    bsnsListScrollController.addListener(() {
      AppLog.d(
          'bsnsListScrollController.offset : ${bsnsListScrollController.offset}');
    });

    /// [사업목록] 조회
    await fetchBsnsList();

    /**
     * 소유자
     */

    /// [소유자 검색] 조회
    // await fetchAccdtlnvstgSearchDataSource();

    /**
     * 실태조사
     */

    // [실태조사 > 토지 정보] 조회
    // await fetchAccdtlnvstgOwnerDataSource();

    /// [실태조사 > 지장물 정보] 조회
    // await fetchAccdtlnvstgObstDataSource();

    /**
     * 통계
     */
  }

  /// [gridColumn] 데이터그리드 컬럼
  GridColumn gridColumn(String columnName, String label,
      {bool? isVisble, double? width}) {
    return GridColumn(
        //width: controller.columnWidths[columnName ?? ''] ?? 80,
        //width: columnWidths[columnName] ?? width ?? 80,
        width: width ?? double.nan,
        columnName: columnName,
        visible: isVisble ?? true,
        label: SizedBox(
            child: Center(
                child: Text(label,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                        color: tableTextColor)))));
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
    print('radioValue : $radioValue');

    // filter
    if (radioValue == 0) {
      searchBsnsPlanList = bsnsPlanList
          .where((element) => element.bsnsDivLclsNm == '댐')
          .toList()
          .obs;
    } else if (radioValue == 1) {
      searchBsnsPlanList = bsnsPlanList
          .where((element) => element.bsnsDivLclsNm == '수도')
          .toList()
          .obs;
    } else if (radioValue == 2) {
      searchBsnsPlanList = bsnsPlanList
          .where((element) => element.bsnsDivLclsNm == '단지')
          .toList()
          .obs;
    } else {
      searchBsnsPlanList.value = bsnsPlanList;
    }
  }

  void handleSelectListTab(RxList<bool> tabSelected, int index) {
    for (var i = 0; i < tabSelected.length; i++) {
      tabSelected[i] = false;
    }
    tabSelected[index] = true;
  }

  /// [사업목록] 조회
  fetchBsnsList() async {
    var url =
        Uri.parse('http://222.107.22.159:18080/lp/bsns/selectBsnsPlan.do');
    var response = await http.post(url);

    bsnsPlanList.clear();
    searchBsnsPlanList.clear();

    if (response.statusCode == 200) {
      var res = JsonDecoder().convert(response.body)['list'];
      List<BsnsPlanModel> dataList = <BsnsPlanModel>[];

      AppLog.d('fetchBsnsList > data : $res');

      var length = res.length;
      bsnsPlanModelFromJson(res, dataList, length);

      bsnsPlanList = dataList.obs;
      searchBsnsPlanList = dataList.obs;
    } else {
      AppLog.e('Failed to load post');
      DialogUtil.showSnackBar(Get.context!, '사업목록', '사업목록을 조회할 수 없습니다.');
    }

    return bsnsPlanList;
  }

  /// [사업구역선택] 조회
  fetchBsnsSelectAreaGridDataSource() async {
    var url =
        Uri.parse('http://222.107.22.159:18080/lp/bsns/selectBsnsZone.do');

    // param
    var param = {
      'bsnsNo': selectBsnsPlan.value.bsnsNo,
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchBsnsSelectAreaGridDataSource > data : $data');

      var bsnsPlanSelectAreaModel = <BsnsPlanSelectAreaModel>[];

      for (var i = 0; i < data.length; i++) {
        var bsnsZoneNo = data[i]['bsnsZoneNo'];
        AppLog.d(
            'fetchBsnsSelectAreaGridDataSource > bsnsZoneNo : $bsnsZoneNo');

        bsnsPlanSelectAreaModel.add(BsnsPlanSelectAreaModel(
            bsnsNo: num.parse(data[i]['bsnsNo']),
            bsnsZoneNo: data[i]['bsnsZoneNo'],
            bsnsZoneNm: data[i]['bsnsZoneNm'],
            lotCnt: CommonUtil.comma3(data[i]['lotCnt']),
            bsnsAra: CommonUtil.comma3(data[i]['bsnsAra']),
            bsnsReadngPblancDe: data[i]['bsnsReadngPblancDe'] == null
                ? '-'
                : CommonUtil.convertToDateTime(data[i]['bsnsReadngPblancDe'])));
      }

      bsnsListDataSource.value =
          BsnsSelectAreaDataSource(items: bsnsPlanSelectAreaModel);
    } else {
      AppLog.e('Failed to load post');
    }
  }

  /// [소유자 및 관리인] 조회
  fetchBsnsOwnerDataSource() async {
    DialogUtil.showLoading(Get.context!);

    var url =
        Uri.parse('http://222.107.22.159:18080/lp/owner/selectOwnList.do');

    var param = {
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    AppLog.d('fetchBsnsOwnerDataSource > param : $param');

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {

      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchBsnsOwnerDataSource > data : $data');

      var length = data.length;
      var list = <OwnerDataSourceModel>[];

      // for (var i = 0; i < data.length; i++) {
      //   res.add(OwnerDataSourceModel(
      //     ownerNo: data[i]['ownerNo'] ?? '',
      //     ownerNm: data[i]['ownerNm'] ?? '',
      //     posesnDivCd: data[i]['posesnDivCd'] ?? '',
      //     posesnDivNm: data[i]['posesnDivNm'] ?? '',
      //     bsnsNo: data[i]['bsnsNo'] ?? '',
      //     bsnsZoneNo: data[i]['bsnsZoneNo'] ?? '',
      //     ownerRrnEnc: data[i]['ownerRrnEnc'] ?? '',
      //     oldRegno: data[i]['oldRegno'] ?? '',
      //     //ownerTelno: data[i]['ownerTelno'] ?? '',
      //     ownerTelno: CommonUtil.phoneHyphen(data[i]['ownerTelno'] ?? ''),
      //     //ownerMbtlnum: data[i]['ownerMbtlnum'] ?? '',
      //     ownerMbtlnum: CommonUtil.phoneHyphen(data[i]['ownerMbtlnum'] ?? ''),
      //     rgsbukZip: data[i]['rgsbukZip'] ?? '',
      //     delvyZip: data[i]['delvyZip'] ?? '',
      //     moisZip: data[i]['moisZip'] ?? '',
      //     ownerRgsbukAddr: data[i]['ownerRgsbukAddr'] ?? '',
      //     ownerDelvyAddr: data[i]['ownerDelvyAddr'] ?? '',
      //     ownerMoisAddr: data[i]['ownerMoisAddr'] ?? '',
      //     accdtInvstgRm: data[i]['accdtInvstgRm'] ?? '',
      //     frstRgstrId: data[i]['frstRgstrId'] ?? '',
      //     frstRegistDt: data[i]['frstRegistDt'] ?? '',
      //     lastUpdusrId: data[i]['lastUpdusrId'] ?? '',
      //     lastUpdtDt: data[i]['lastUpdtDt'] ?? '',
      //     conectIp: data[i]['conectIp'] ?? '',
      //     thingCnt: data[i]['thingCnt'] ?? '',
      //     bsnsCnt: data[i]['bsnsCnt'] ?? '',
      //     realOwnerNo: data[i]['realOwnerNo'] ?? '',
      //     ownerDivCd: data[i]['ownerDivCd'] ?? '',
      //     ownerRgsbukAddrFull: data[i]['ownerRgsbukAddrFull'] ?? '',
      //     ownerDelvyAddrFull: data[i]['ownerDelvyAddrFull'] ?? '',
      //     ownerMoisAddrFull: data[i]['ownerMoisAddrFull'] ?? '',
      //   ));
      // }

      ownerDataSourceKeyValue(data, list, length);

      ownerListDataSource.value = OwnerDatasource(items: list);
      Get.back();
    }
  }

  /// [소유자관리 > 토지정보] 조회
  fetchOwnerLadInfoDataSource(ownerNum) async {
    var url =
        Uri.parse('http://222.107.22.159:18080/lp/owner/selectLandList.do');

    var param = {
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
      'shOwnerNo': ownerNum ?? '',
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchOwnerLadInfoDataSource > data : $data');

      var list = <OwnerLadInfoDatasourceModel>[];
      var length = data.length;

      if (length == 0) {
        DialogUtil.showSnackBar(Get.context!, '토지정보', '토지정보가 없습니다.');
        Get.back();
        return;
      }

      //ownerLadInfoDataSourceKeyValue(data, list, length);

      for (var i = 0; i < length; i++) {
        list.add(OwnerLadInfoDatasourceModel(
          lgdongNm: data[i]['lgdongNm'] ?? '',
          lcrtsDivCd: data[i]['lcrtsDivCd'] ?? '',
          lcrtsDivNm: data[i]['lcrtsDivNm'] ?? '',
          mlnoLtno: data[i]['mlnoLtno'] ?? '',
          slnoLtno: data[i]['slnoLtno'] ?? '',
          ofcbkLndcgrDivCd: data[i]['ofcbkLndcgrDivCd'] ?? '',
          ofcbkLndcgrDivNm: data[i]['ofcbkLndcgrDivNm'] ?? '',
          sttusLndcgrDivCd: data[i]['sttusLndcgrDivCd'] ?? '',
          sttusLndcgrDivNm: data[i]['sttusLndcgrDivNm'] ?? '',
          //ofcbkAra: data[i]['ofcbkAra'] ?? '',
          ofcbkAra: CommonUtil.comma3(data[i]['ofcbkAra'] ?? ''),
          incrprAra: CommonUtil.comma3(data[i]['incrprAra'] ?? ''),
          cmpnstnInvstgAra: CommonUtil.comma3(data[i]['cmpnstnInvstgAra'] ?? ''),
          acqsPrpDivCd: data[i]['acqsPrpDivCd'] ?? '',
          acqsPrpDivNm: data[i]['acqsPrpDivNm'] ?? '',
          aceptncUseDivCd: data[i]['aceptncUseDivCd'] ?? '',
          aceptncUseDivNm: data[i]['aceptncUseDivNm'] ?? '',
          accdtInvstgSqnc: data[i]['accdtInvstgSqnc'] ?? '',
          invstgDt: CommonUtil.convertToDateTime(data[i]['invstgDt'] ?? ''),
          cmpnstnStepDivCd: data[i]['cmpnstnStepDivCd'] ?? '',
          cmpnstnStepDivCdNm: data[i]['cmpnstnStepDivCdNm'] ?? '',
          accdtInvstgRm: data[i]['accdtInvstgRm'] ?? '',
        ));
      }

      ownerLadInfoDataSource.value = OwnerLadInfoDatasource(items: list);
    }
  }

  /// [소유자관리 > 지장물정보] 조회
  fetchOwnerObstInfoDataSource(ownerNum) async {
    var url =
        Uri.parse('http://222.107.22.159:18080/lp/owner/selecObstList.do');

    var param = {
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
      'shOwnerNo': ownerNum,
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchOwnerObstInfoDataSource > data : $data');

      var res = <OwnerObstInfoDatasourceModel>[];

      for (var i = 0; i < data.length; i++) {
        res.add(OwnerObstInfoDatasourceModel(
          lgdongNm: data[i]['lgdongNm'] ?? '',
          lcrtsDivCd: data[i]['lcrtsDivCd'] ?? '',
          lcrtsDivNm: data[i]['lcrtsDivNm'] ?? '',
          mlnoLtno: data[i]['mlnoLtno'] ?? '',
          slnoLtno: data[i]['slnoLtno'] ?? '',
          cmpnstnObstNo: data[i]['cmpnstnObstNo'] ?? '',
          obstDivCd: data[i]['obstDivCd'] ?? '',
          obstDivNm: data[i]['obstDivNm'] ?? '',
          cmpnstnThingKndDtls: data[i]['cmpnstnThingKndDtls'] ?? '',
          obstStrctStndrdInfo: data[i]['obstStrctStndrdInfo'] ?? '',
          cmpnstnQtyAraVu: data[i]['cmpnstnQtyAraVu'] ?? '',
          cmpnstnThingUnitDivCd: data[i]['cmpnstnThingUnitDivCd'] ?? '',
          cmpnstnThingUnitDivNm: data[i]['cmpnstnThingUnitDivNm'] ?? '',
          acqsPrpDivCd: data[i]['acqsPrpDivCd'] ?? '',
          acqsPrpDivNm: data[i]['acqsPrpDivNm'] ?? '',
          accdtInvstgSqnc: data[i]['accdtInvstgSqnc'] ?? '',
          invstgDt: data[i]['invstgDt'] ?? '',
          cmpnstnStepDivCd: data[i]['cmpnstnStepDivCd'] ?? '',
          cmpnstnStepDivNm: data[i]['cmpnstnStepDivNm'] ?? '',
          spcitm: data[i]['spcitm'] ?? '',
        ));
      }
      ownerObstInfoDataSource.value = OwnerObstInfoDatasource(items: res);
    }
  }

  /// [소유자관리 > 정보변경] 조회
  /// @deprecated 선택한 소유자에대한 소유자정보를 조회한다.
  fetchOwnerInfo(ownerNum) async {
    var url = Uri.parse('http://222.107.22.159:18080/lp/owner/selecOwnInfo.do');

    var param = {
      'shOwnerNo': ownerNum,
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchOwnerInfo > data : $data');

      var res = <OwnerInfoModel>[];
      for (var i = 0; i < data.length; i++) {
        res.add(OwnerInfoModel(
          ownerNo: data[i]['ownerNo'] ?? '',
          ownerRrnEnc: data[i]['ownerRrnEnc'] ?? '',
          ownerNm: data[i]['ownerNm'] ?? '',
          ownerTelno: data[i]['ownerTelno'] ?? '',
          ownerMbtlnum: data[i]['ownerMbtlnum'] ?? '',
          rgsbukZip: data[i]['rgsbukZip'] ?? '',
          delvyZip: data[i]['delvyZip'] ?? '',
          moisZip: data[i]['moisZip'] ?? '',
          ownerRgsbukAddr: data[i]['ownerRgsbukAddr'] ?? '',
          ownerDelvyAddr: data[i]['ownerDelvyAddr'] ?? '',
          ownerMoisAddr: data[i]['ownerMoisAddr'] ?? '',
          accdtInvstgRm: data[i]['accdtInvstgRm'] ?? '',
          posesnDivCd: data[i]['posesnDivCd'] ?? '',
          ownerDivCd: data[i]['ownerDivCd'] ?? '',
          ownerDivNm: data[i]['ownerDivNm'] ?? '',
          chnSqnc: data[i]['chnSqnc'] ?? '',
          cmpnstnDtaCreatId: data[i]['cmpnstnDtaCreatId'] ?? '',
          bcncNo: data[i]['bcncNo'] ?? '',
          delYn: data[i]['delYn'] ?? '',
          frstRgstrId: data[i]['frstRgstrId'] ?? '',
          frstRegistDt: data[i]['frstRegistDt'] ?? '',
          lastUpdusrId: data[i]['lastUpdusrId'] ?? '',
          lastUpdtDt: data[i]['lastUpdtDt'] ?? '',
          conectIp: data[i]['conectIp'] ?? '',
        ));
      }

      AppLog.d('fetchOwnerInfo > res : $res');
      selectedOwner.value = res[0];
    }
  }

  /// [실태조사 > 토지내역] 조회
  fetchAccdtlnvstgSearchDataSource() async {

    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/accdtInvstg/selectAccdtInvstgLad.do');

    var param = {
      'bsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
      'shAccdtInvstgSqnc': selectSqnc.value.accdtInvstgSqnc.toString(),
    };

    AppLog.d('fetchAccdtlnvstgSearchDataSource > param : $param');

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchAccdtlnvstgSearchDataSource > data : $data');

      var length = data.length;
      var list = <AccdtlnvstgLadModel>[];

      accdtlnvstgLadDataSourceKeyValue(data, list, length);

      accdtlnvstgLadDataSource.value =
          AccdtlnvstgLadDatasource(items: list);


      if(accdtlnvstgLadDataSource.value.rows.length == 0) {
        DialogUtil.showSnackBar(Get.context!, '실태조사', '실태조사 내역이 없습니다.');
      } else {
        // AppLog.d('실태조사 시작');
        // isBsnsSelectFlag.value = false;
        // isBsnsSqncSelectFlag.value = false;
        // isBsnsZoneSelectFlag.value = false;
        // pageController.jumpToPage(2);
        // Get.back();
        DialogUtil.showAlertDialog(
          Get.context!,
          0,
          '실태조사',
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('${selectSqnc.value.accdtInvstgSqnc}차 실태조사로 이동하시겠습니까?', style: TextStyle(color: Color(0xFF2C2C2C), fontSize: 1.w > 1.h ? 32.sp : 52.sp, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          onOk: () {
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
      }

    }

  }

  /// [실태조사 > 토지 > 소유자 ] 조회
  fetchAccdtlnvstgLadOwnerDataSource(thingSerNo) async {

    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/accdtInvstg/selectAccdtInvstgLadOwner.do');

    var param = {
      'shThingSerNo': thingSerNo,
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
      'bsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
    };

    AppLog.d('fetchAccdtlnvstgLadOwnerDataSource > param : $param');

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchAccdtlnvstgLadOwnerDataSource > data : $data');

      var length = data.length;
      var list = <AccdtlnvstgLadOwnerModel>[];

      accdtlnvstgLadOwnerDataSourceKeyValue(data, list, length);

      accdtlnvstgLadOwnerDataSource.value =
          AccdtlnvstgLadOwnerDatasource(items: list);
    }

  }

  /// [실태조사 > 토지 > 관계인] 조회
  fetchAccdtlnvstgLadPartcpntStatusDataSource(ownerNo) async {

    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/accdtInvstg/selectAccdtInvstgLadOwnerPartcpnt.do');

    var param = {
      'shOwnerNo' : ownerNo,
      'shThingSerNo': selectedOwnerLadOwnerData.value.thingSerNo,
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
      'bsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
    };

    AppLog.d('fetchAccdtlnvstgLadPartcpntStatusDataSource > param : $param');

    var response = await http.post(url, body: param);

    if(response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchAccdtlnvstgLadPartcpntStatusDataSource > data : $data');

      var length = data.length;
      var list = <AccdtlnvstgLadPartcpntModel>[];

      accdtlnvstgLadPartcpntDataSourceKeyValue(data, list, length);
      accdtlnvstgLadPartcpntDataSource.value = AccdtlnvstgLadPartcpntDatasource(items: list);
    }


  }

  /// [실태조사 > 지장물 정보] 조회
  fetchAccdtlnvstgObstDataSource() async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/accdtInvstg/selectAccdtInvstgObst.do');

    var param = {
      'shAccdtInvstgSqnc': selectSqnc.value.accdtInvstgSqnc.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
      'bsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchAccdtlnvstgObstDataSource > data : $data');

      var accdtlnvstgObst = <AccdtlnvstgObstModel>[];
      var length = data.length;

      accdtlnvstgObstDataSourceKeyValue(data, accdtlnvstgObst, length);

      accdtlnvstgObstDataSource.value =
          AccdtlnvstgObstDatasource(items: accdtlnvstgObst);
    }
  }

  /// [실태조사 > 지장물 정보 > 그리드 선택 소유자 가져오기 ]
  fetchAccdtlnvstgObstOwnerDataSource(shThingSerNo) async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/accdtInvstg/selectAccdtInvstgObstOwner.do');

    var param = {
      'shThingSerNo': shThingSerNo,
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
      'bsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
    };

    AppLog.d('fetchAccdtlnvstgObstOwnerDataSource > param : $param');

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchAccdtlnvstgObstOwnerDataSource > data : $data');

      var accdtlnvstgObstOwner = <AccdtlnvstgObstOwnerModel>[];
      var length = data.length;

      accdtlnvstgObstOwnerDataSourceKeyValue(data, accdtlnvstgObstOwner, length);

      accdtlnvstgObstOwnerDataSource.value =
          AccdtlnvstgObstOwnerDatasource(items: accdtlnvstgObstOwner);

      handleAccdtlnvstgObstTabSelected(1);
    }

  }

  /// [통계정보 > 토지현황] 조회
  fetchLadSttusInqireDataSource() async {
    // loading bar
    DialogUtil.showLoading(Get.context!);

    print(
        'fetchLadSttusInqireDataSource > selectedBsnsSelectArea.value.bsnsNo : ${selectedBsnsSelectArea.value.bsnsNo}');

    var url =
        Uri.parse('http://222.107.22.159:18080/lp/lssom/selectSttusLadInfo.do');

    var param = {
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchLadSttusInqireDataSource > data : $data');

      var res = <LadSttusInqireModel>[];
      for (var i = 0; i < data.length; i++) {
        res.add(LadSttusInqireModel(
          lgdongNm: data[i]['lgdongNm'] ?? '',
          lcrtsDivCd: data[i]['lcrtsDivCd'] ?? '',
          lcrtsDivNm: data[i]['lcrtsDivNm'] ?? '',
          mlnoLtno: data[i]['mlnoLtno'] ?? '',
          slnoLtno: data[i]['slnoLtno'] ?? '',
          ofcbkLndcgrDivCd: data[i]['ofcbkLndcgrDivCd'] ?? '',
          ofcbkLndcgrDivNm: data[i]['ofcbkLndcgrDivNm'] ?? '',
          sttusLndcgrDivCd: data[i]['sttusLndcgrDivCd'] ?? '',
          sttusLndcgrDivNm: data[i]['sttusLndcgrDivNm'] ?? '',
          cmpnstnStepDivCd: data[i]['cmpnstnStepDivCd'] ?? '',
          cmpnstnStepDivNm: data[i]['cmpnstnStepDivNm'] ?? '',
          acqsPrpDivCd: data[i]['acqsPrpDivCd'] ?? '',
          acqsPrpDivNm: data[i]['acqsPrpDivNm'] ?? '',
          ofcbkAra: data[i]['ofcbkAra'] ?? 0,
          incrprAra: data[i]['incrprAra'] ?? 0,
          rqestNo: data[i]['rqestNo'] ?? '',
          aceptncUseDivCd: data[i]['aceptncUseDivCd'] ?? '',
          aceptncUseDivNm: data[i]['aceptncUseDivNm'] ?? '',
          invstgDt: data[i]['invstgDt'] ?? '',
          accdtInvstgSqnc: data[i]['accdtInvstgSqnc'] ?? '',
          ownerNo: data[i]['ownerNo'] ?? '',
          posesnDivCd: data[i]['posesnDivCd'] ?? '',
          posesnDivNm: data[i]['posesnDivNm'] ?? '',
          ownerNm: data[i]['ownerNm'] ?? '',
          ownerRgsbukAddr: data[i]['ownerRgsbukAddr'] ?? '',
          posesnShreNmrtrInfo: data[i]['posesnShreNmrtrInfo'] ?? '',
          posesnShreDnmntrInfo: data[i]['posesnShreDnmntrInfo'] ?? '',
          apasmtReqestDivCd: data[i]['apasmtReqestDivCd'] ?? '',
          apasmtReqestDivNm: data[i]['apasmtReqestDivNm'] ?? '',
          apasmtSqnc: data[i]['apasmtSqnc'] ?? 0,
          prcPnttmDe: data[i]['prcPnttmDe'] ?? '',
          apasmtInsttNm1: data[i]['apasmtInsttNm1'] ?? '',
          apasmtInsttEvlUpc1: data[i]['apasmtInsttEvlUpc1'] ?? 0,
          apasmtInsttEvamt1: data[i]['apasmtInsttEvamt1'] ?? 0,
          apasmtInsttNm2: data[i]['apasmtInsttNm2'] ?? '',
          apasmtInsttEvlUpc2: data[i]['apasmtInsttEvlUpc2'] ?? 0,
          apasmtInsttEvamt2: data[i]['apasmtInsttEvamt2'] ?? 0,
          apasmtInsttNm3: data[i]['apasmtInsttNm3'] ?? '',
          apasmtInsttEvlUpc3: data[i]['apasmtInsttEvlUpc3'] ?? 0,
          apasmtInsttEvamt3: data[i]['apasmtInsttEvamt3'] ?? 0,
          cmpnstnCmptnUpc: data[i]['cmpnstnCmptnUpc'] ?? 0,
          cpsmnCmptnAmt: data[i]['cpsmnCmptnAmt'] ?? 0,
          caPymntRequstDe: data[i]['caPymntRequstDe'] ?? '',
          cmpnstnDscssUpc: data[i]['cmpnstnDscssUpc'] ?? 0,
          cmpnstnDscssTotAmt: data[i]['cmpnstnDscssTotAmt'] ?? 0,
          caRgistDt: data[i]['caRgistDt'] ?? '',
          aceptncAdjdcUpc: data[i]['aceptncAdjdcUpc'] ?? 0,
          aceptncAdjdcAmt: data[i]['aceptncAdjdcAmt'] ?? 0,
          aceptncAdjdcDt: data[i]['aceptncAdjdcDt'] ?? '',
          aceptncUseBeginDe: data[i]['aceptncUseBeginDe'] ?? '',
          ldPymntRequstDe: data[i]['ldPymntRequstDe'] ?? '',
          ldRgistDt: data[i]['ldRgistDt'] ?? '',
          ldCpsmnPymntLdgmntDivCd: data[i]['ldCpsmnPymntLdgmntDivCd'] ?? '',
          obadUpc: data[i]['obadUpc'] ?? 0,
          objcRstAmt: data[i]['objcRstAmt'] ?? 0,
          objcAdjdcDt: data[i]['objcAdjdcDt'] ?? '',
          proPymntRequstDe: data[i]['proPymntRequstDe'] ?? '',
          proCpsmnPymntLdgmntDivCd: data[i]['proCpsmnPymntLdgmntDivCd'] ?? '',
        ));
      }

      ladSttusInqireDataSource.value = LadSttusInqireDatasource(items: res);

      // close loading bar
      Get.back();
    }

    ladSttusInqireColumns.value = [];

    ladSttusInqireColumns.value = [
      gridColumn('lgdongNm', '소재지', width: 250),
      gridColumn('lcrtsDivNm', '특지', width: 60),
      gridColumn('mlnoLtno', '본번', width: 60),
      gridColumn('slnoLtno', '부번', width: 60),

      gridColumn('ofcbkLndcgrDivNm', '공부', width: 60),
      gridColumn('sttusLndcgrDivNm', '현황', width: 60),

      gridColumn('cmpnstnStepDivNm', '진행단계', width: 100),
      gridColumn('acqsPrpDivNm', '취득용도', width: 100),

      gridColumn('ofcbkAra', '공부', width: 60),
      gridColumn('incrprAra', '편입', width: 60),

      gridColumn('aceptncUseDivNm', '수용/사용', width: 60,
          isVisble: isLadSttusInqireGridTab1.value),
      gridColumn('invstgDt', '조사일',
          isVisble: isLadSttusInqireGridTab1.value),
      gridColumn('accdtInvstgSqnc', '차수', width: 40,
          isVisble: isLadSttusInqireGridTab1.value),

      gridColumn('ownerNo', '소유자번호',
          isVisble: isLadSttusInqireGridTab2.value),
      gridColumn('posesnDivNm', '구분',
          isVisble: isLadSttusInqireGridTab2.value, width: 60),
      gridColumn('ownerNm', '소유자명',
          isVisble: isLadSttusInqireGridTab2.value),
      gridColumn('ownerRgsbukAddr', '등기부주소',
          isVisble: isLadSttusInqireGridTab2.value),
      gridColumn('posesnShreNmrtrInfo', '분자', width: 60,
          isVisble: isLadSttusInqireGridTab2.value),
      gridColumn('posesnShreDnmntrInfo', '분모', width: 60,
          isVisble: isLadSttusInqireGridTab2.value),

      gridColumn('apasmtReqestDivNm', '평가구분', width: 60,
          isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtSqnc', '평가차수', width: 60,
          isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('prcPnttmDe', '가격시점',
          isVisble: isLadSttusInqireGridTab3.value),

      // a평가법인
      gridColumn('apasmtInsttNm1', '법인명',
          isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlUpc1', '단가',
          isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlAmt1', '금액',
          isVisble: isLadSttusInqireGridTab3.value),

      // b평가법인
      gridColumn('apasmtInsttNm2', '법인명',
          isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlUpc2', '단가',
          isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlAmt2', '금액',
          isVisble: isLadSttusInqireGridTab3.value),

      // c평가법인
      gridColumn('apasmtInsttNm3', '법인명',
          isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlUpc3', '단가',
          isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlAmt3', '금액',
          isVisble: isLadSttusInqireGridTab3.value),

      // 보상비산정
      gridColumn('cmpnstnCmptnUpc', '산정단가',
          isVisble: isLadSttusInqireGridTab4.value),
      gridColumn('cpsmnCmptnAmt', '산정금액',
          isVisble: isLadSttusInqireGridTab4.value),

      // 보상비지급
      gridColumn('caPymntRequstDe', '지급요청일',
          isVisble: isLadSttusInqireGridTab5.value),
      gridColumn('cmpnstnDscssUpc', '지급단가',
          isVisble: isLadSttusInqireGridTab5.value),
      gridColumn('cmpnstnDscssTotAmt', '지급금액',
          isVisble: isLadSttusInqireGridTab5.value),
      gridColumn('caRgistDt', '등기일자',
          isVisble: isLadSttusInqireGridTab5.value),

      // 수용재결
      gridColumn('aceptncAdjdcUpc', '재결단가',
          isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('aceptncAdjdcAmt', '재결금액',
          isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('aceptncAdjdcDt', '재결일자',
          isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('aceptncUseBeginDe', '수용/사용개시일',
          isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('ldPymntRequstDe', '지급요청일자',
          isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('ldRgistDt', '등기일자',
          isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('ldCpsmnPymntLdgmntDivCd', '지급/공탁',
          isVisble: isLadSttusInqireGridTab6.value),

      // 이의재결
      gridColumn('obadUpc', '재결단가',
          isVisble: isLadSttusInqireGridTab7.value),
      gridColumn('objcRstAmt', '재결금액',
          isVisble: isLadSttusInqireGridTab7.value),
      gridColumn('objcAdjdcDt', '재결일자',
          isVisble: isLadSttusInqireGridTab7.value),
      gridColumn('proPymntRequstDe', '지급요청일자',
          isVisble: isLadSttusInqireGridTab7.value),
      gridColumn('proCpsmnPymntLdgmntDivCd', '지급/공탁',
          isVisble: isLadSttusInqireGridTab7.value),
    ];
  }

  /// [통계정보 > 지장물현황] 조회
  fetchObstSttusInqireDataSource() async {
    print(
        'fetchObstSttusInqireDataSource > selectedBsnsSelectArea.value.bsnsNo : ${selectedBsnsSelectArea.value.bsnsNo}');

    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lssom/selectSttusObstInfo.do');

    var param = {
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchObstSttusInqireDataSource > data : $data');

      var res = <ObstSttusInqireModel>[];
      for (var i = 0; i < data.length; i++) {
        res.add(ObstSttusInqireModel(
          lgdongNm: data[i]['lgdongNm'] ?? '',
          lcrtsDivCd: data[i]['lcrtsDivCd'] ?? '',
          lcrtsDivNm: data[i]['lcrtsDivNm'] ?? '',
          mlnoLtno: data[i]['mlnoLtno'] ?? '',
          slnoLtno: data[i]['slnoLtno'] ?? '',
          cmpnstnStepDivCd: data[i]['cmpnstnStepDivCd'] ?? '',
          cmpnstnStepDivNm: data[i]['cmpnstnStepDivNm'] ?? '',
          acqsPrpDivCd: data[i]['acqsPrpDivCd'] ?? '',
          acqsPrpDivNm: data[i]['acqsPrpDivNm'] ?? '',
          rqestNo: data[i]['rqestNo'] ?? '',
          invstgDe: data[i]['invstgDe'] ?? '',
          accdtInvstgSqnc: data[i]['accdtInvstgSqnc'] ?? '',
          ownerNo: data[i]['ownerNo'] ?? '',
          posesnDivCd: data[i]['posesnDivCd'] ?? '',
          posesnDivNm: data[i]['posesnDivNm'] ?? '',
          ownerNm: data[i]['ownerNm'] ?? '',
          ownerRgsbukAddr: data[i]['ownerRgsbukAddr'] ?? '',
          posesnShreNmrtrInfo: data[i]['posesnShreNmrtrInfo'] ?? '',
          posesnShreDnmntrInfo: data[i]['posesnShreDnmntrInfo'] ?? '',
          apasmtReqestDivCd: data[i]['apasmtReqestDivCd'] ?? '',
          apasmtReqestDivNm: data[i]['apasmtReqestDivNm'] ?? '',
          apasmtSqnc: data[i]['apasmtSqnc'] ?? 0,
          prcPnttmDe: data[i]['prcPnttmDe'] ?? '',
          apasmtInsttNm1: data[i]['apasmtInsttNm1'] ?? '',
          apasmtInsttEvlUpc1: data[i]['apasmtInsttEvlUpc1'] ?? 0,
          apasmtInsttEvamt1: data[i]['apasmtInsttEvamt1'] ?? 0,
          apasmtInsttNm2: data[i]['apasmtInsttNm2'] ?? '',
          apasmtInsttEvlUpc2: data[i]['apasmtInsttEvlUpc2'] ?? 0,
          apasmtInsttEvamt2: data[i]['apasmtInsttEvamt2'] ?? 0,
          apasmtInsttNm3: data[i]['apasmtInsttNm3'] ?? '',
          apasmtInsttEvlUpc3: data[i]['apasmtInsttEvlUpc3'] ?? 0,
          apasmtInsttEvamt3: data[i]['apasmtInsttEvamt3'] ?? 0,
          cmpnstnCmptnUpc: data[i]['cmpnstnCmptnUpc'] ?? 0,
          cpsmnCmptnAmt: data[i]['cpsmnCmptnAmt'] ?? 0,
          caPymntRequstDe: data[i]['caPymntRequstDe'] ?? '',
          cmpnstnDscssUpc: data[i]['cmpnstnDscssUpc'] ?? 0,
          cmpnstnDscssTotAmt: data[i]['cmpnstnDscssTotAmt'] ?? 0,
          dcsUpc: data[i]['dcsUpc'] ?? 0,
          dcsAmt: data[i]['dcsAmt'] ?? 0,
          dcsDt: data[i]['dcsDt'] ?? '',
          aceptncUseBeginDe: data[i]['aceptncUseBeginDe'] ?? '',
          ldPymntRequstDe: data[i]['ldPymntRequstDe'] ?? '',
          ldCpsmnPymntLdgmntDivCd: data[i]['ldCpsmnPymntLdgmntDivCd'] ?? '',
          ldCpsmnPymntLdgmntDivNm: data[i]['ldCpsmnPymntLdgmntDivNm'] ?? '',
          proUpc: data[i]['proUpc'] ?? 0,
          proAmt: data[i]['proAmt'] ?? 0,
          proDt: data[i]['proDt'] ?? '',
          proPymntRequstDe: data[i]['proPymntRequstDe'] ?? '',
          proCpsmnPymntLdgmntDivCd: data[i]['proCpsmnPymntLdgmntDivCd'] ?? '',
          proCpsmnPymntLdgmntDivNm: data[i]['proCpsmnPymntLdgmntDivNm'] ?? '',
        ));
      }

      obstSttusInqireDataSource.value = ObstSttusInqireDatasource(items: res);
    }

    obstSttusInqireColumns.value = [];

    obstSttusInqireColumns.value = [
      gridColumn('lgdongNm', '소재지'),
      gridColumn('lcrtsDivCd', '특지', width: 40),
      gridColumn('mlnoLtno', '본번', width: 40),
      gridColumn('slnoLtno', '부번', width: 40),

      gridColumn('cmpnstnStepDivCd', '진행단계', width: 100),
      gridColumn('acqsPrpDivCd', '취득용도'),

      gridColumn('rqestNo', '청구번호',
          isVisble: isLadSttusInqireGridTab1.value),
      gridColumn('invstgDe', '조사일',
          isVisble: isLadSttusInqireGridTab1.value),
      gridColumn('accdtInvstgSqnc', '차수',
          isVisble: isLadSttusInqireGridTab1.value, width: 40),

      gridColumn('ownerNo', '소유자번호',
          isVisble: isLadSttusInqireGridTab2.value),
      gridColumn('posesnDivCd', '구분',
          isVisble: isLadSttusInqireGridTab2.value, width: 40),
      gridColumn('ownerNm', '소유자명',
          isVisble: isLadSttusInqireGridTab2.value),
      gridColumn('ownerRgsbukAddr', '등기부주소',
          isVisble: isLadSttusInqireGridTab2.value),
      gridColumn('posesnShreNmrtrInfo', '분자',
          isVisble: isLadSttusInqireGridTab2.value, width: 40),
      gridColumn('posesnShreDnmntrInfo', '분모',
          isVisble: isLadSttusInqireGridTab2.value, width: 40),

      gridColumn('apasmtReqestDivCd', '평가구분',
          isVisble: isLadSttusInqireGridTab3.value, width: 60),
      gridColumn('apasmtSqnc', '평가차수',
          isVisble: isLadSttusInqireGridTab3.value, width: 60),
      gridColumn('prcPnttmDe', '가격시점',
          isVisble: isLadSttusInqireGridTab3.value),

      // a평가법인
      gridColumn('apasmtInsttNm1', '법인명',
          isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlUpc1', '단가',
          isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlAmt1', '금액',
          isVisble: isLadSttusInqireGridTab3.value),

      // b평가법인
      gridColumn('apasmtInsttNm2', '법인명',
          isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlUpc2', '단가',
          isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlAmt2', '금액',
          isVisble: isLadSttusInqireGridTab3.value),

      // c평가법인
      gridColumn('apasmtInsttNm3', '법인명',
          isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlUpc3', '단가',
          isVisble: isLadSttusInqireGridTab3.value),
      gridColumn('apasmtInsttEvlAmt3', '금액',
          isVisble: isLadSttusInqireGridTab3.value),

      // 보상비산정
      gridColumn('cmpnstnCmptnUpc', '산정단가',
          isVisble: isLadSttusInqireGridTab4.value),
      gridColumn('cpsmnCmptnAmt', '산정금액',
          isVisble: isLadSttusInqireGridTab4.value),

      // 보상비지급
      gridColumn('caPymntRequstDe', '지급요청일',
          isVisble: isLadSttusInqireGridTab5.value),
      gridColumn('cmpnstnDscssUpc', '지급단가',
          isVisble: isLadSttusInqireGridTab5.value),
      gridColumn('cmpnstnDscssTotAmt', '지급금액',
          isVisble: isLadSttusInqireGridTab5.value),

      // 수용재결
      gridColumn('dcsUpc', '재결단가',
          isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('dcsAmt', '재결금액',
          isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('dcsDt', '재결일자',
          isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('aceptncUseBeginDe', '수용/사용개시일',
          isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('ldPymntRequstDe', '지급요청일자',
          isVisble: isLadSttusInqireGridTab6.value),
      gridColumn('ldCpsmnPymntLdgmntDivCd', '지급/공탁',
          isVisble: isLadSttusInqireGridTab6.value),

      // 이의재결
      gridColumn('proUpc', '재결단가',
          isVisble: isLadSttusInqireGridTab7.value),
      gridColumn('proAmt', '재결금액',
          isVisble: isLadSttusInqireGridTab7.value),
      gridColumn('proDt', '재결일자',
          isVisble: isLadSttusInqireGridTab7.value),
      gridColumn('proPymntRequstDe', '지급요청일자',
          isVisble: isLadSttusInqireGridTab7.value),
      gridColumn('proCpsmnPymntLdgmntDivCd', '지급/공탁',
          isVisble: isLadSttusInqireGridTab7.value),
    ];
  }

  // [통계정보 > 취득용도] 조회
  fetchAcqsPrpDivCdDataSource() async {
    var url =
        Uri.parse('http://222.107.22.159:18080/lp/lssom/selectAcqsPrp.do');

    var response = await http.post(url);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchAcqsPrpDivCdDataSource > data : $data');

      DialogUtil.showBottomSheet(
          Get.context!,
          '취득용도',
          Container(
            height: 500.h,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['cmmnCdNm']),
                  onTap: () {
                    sttusInqireAcqstnPrpsController.text =
                        data[index]['cmmnCdNm'];
                    Get.back();
                  },
                );
              },
            ),
          ));
    }
  }

  // [ 통계정보 > 토지현황 > 조사 차수] 조회
  fetchLadSttusInqireSqncDataSource() async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lssom/selectLandApasmtSqnc.do');

    var param = {
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchLadSttusInqireSqncDataSource > data : $data');

      DialogUtil.showBottomSheet(
          Get.context!,
          '조사 차수',
          Container(
            height: 500.h,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  //title: Text(data[index]['accdtInvstgSqnc']),
                  title: Text('${data[index]['apasmtSqnc']}차'),
                  onTap: () {
                    sttusInqireBsnsSqncController.text =
                        data[index]['apasmtSqnc'].toString();
                    Get.back();
                  },
                );
              },
            ),
          ));
    }
  }

  // [고객카드 > 관계인 (토지)] 조회
  fetchCstmrCardLadPartcpntInfoDataSource(ownerNo) async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lccc/selectCstmrCardLand.do');

    var param = {
      'shOwnerNo': ownerNo,
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['landPartcpnt'];
      AppLog.d('fetchCstmrCardLadPartcpntInfoDataSource > landPartcpnt : $data');

      var cstmrCardLadPartcpnt = <CstmrcardLadPartcpntDatasourceModel>[];
      var length = data.length;

      cstmrcardLadPartcpntDataSourceKeyValue(data, cstmrCardLadPartcpnt, length);

      cstmrcardLadPartcpntDataSource.value =
          CstmrcardLadPartcpntDatasource(items: cstmrCardLadPartcpnt);
    }

  }

  // [고객카드 > 관계인 (지장물)] 조회
  fetchCstmrCardObstPartcpntInfoDataSource(ownerNo) async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lccc/selectCstmrCardLand.do');

    var param = {
      'shOwnerNo': ownerNo,
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['obstPartcpnt'];
      AppLog.d('fetchCstmrCardObstPartcpntInfoDataSource > obstPartcpnt : $data');

      var cstmrCardObstPartcpnt = <CstmrcardObstPartcpntDatasourceModel>[];
      var length = data.length;

      cstmrcardObstPartcpntDataSourceKeyValue(data, cstmrCardObstPartcpnt, length);

      cstmrcardObstPartcpntDatasource.value =
          CstmrcardObstPartcpntDatasource(items: cstmrCardObstPartcpnt);
    }

  }

  // [고객카드 > 협의내역 (토지)] 조회
  fetchCstmrCardLadCmpnstnInfoDataSource(ownerNo) async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lccc/selectCstmrCardLand.do');

    var param = {
      'shOwnerNo': ownerNo,
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['cmpnstn'];
      AppLog.d(
          'fetchCstmrCardLadCmpnstnInfoDataSource > cmpnstn : $data');

      var cstmrcardCmpnstn = <CstmrcardCmpnstnDatasourceModel>[];
      var length = data.length;

      cstmrcardCmpnstnDataSourceKeyValue(data, cstmrcardCmpnstn, length);

      cstrmcardCmpnstnDatSource.value =
          CstmrcardCmpnstnDatasource(items: cstmrcardCmpnstn);
    }
  }

  // [고객카드 > 수요재결 (토지)] 조회
  fetchCstmrCardLadAceptncInfoDataSource(ownerNo) async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lccc/selectCstmrCardLand.do');

    var param = {
      'shOwnerNo': ownerNo,
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['landAceptnc'];
      AppLog.d(
          'fetchCstmrCardLadAceptncInfoDataSource > landAceptnc : $data');

      var cstmrcardLadAceptncDatasourceModel = <CstmrcardLadAceptncDatasourceModel>[];
      var length = data.length;

      cstmrcardLadAceptncDatasourceKeyValue(data, cstmrcardLadAceptncDatasourceModel, length);

      cstmrcardLadAceptncDatasource.value =
          CstmrcardLadAceptncDatasource(items: cstmrcardLadAceptncDatasourceModel);
    }
  }

  // [고객카드 > 수요재결 (지장물)] 조회
  fetchCstmrCardObstAceptncInfoDataSource(ownerNo) async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lccc/selectCstmrCardLand.do');

    var param = {
      'shOwnerNo': ownerNo,
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['obstAceptnc'];
      AppLog.d(
          'fetchCstmrCardObstAceptncInfoDataSource > obstAceptnc : $data');

      var cstmrcardObstAceptncDatasourceModel = <CstmrcardObstAceptncDatasourceModel>[];
      var length = data.length;

      cstmrcardObstAceptncDatasourceKeyValue(data, cstmrcardObstAceptncDatasourceModel, length);

      cstmrcardObstAceptncDatasource.value =
          CstmrcardObstAceptncDatasource(items: cstmrcardObstAceptncDatasourceModel);

    }
  }

  // [고객카드 > 이의재결 (토지)] 조회
  fetchCstmrCardLadObjcInfoDataSource(ownerNo) async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lccc/selectCstmrCardLand.do');

    var param = {
      'shOwnerNo': ownerNo,
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['landObjc'];
      AppLog.d(
          'fetchCstmrCardLadObjcInfoDataSource > landObjc : $data');

      var cstmrcardLadObjcDatasourceModel = <CstmrcardLadObjcDatasourceModel>[];
      var length = data.length;

      cstmrcardLadObjcDataSourceKeyValue(data, cstmrcardLadObjcDatasourceModel, length);

      cstmrcardLadObjcDatasource.value =
          CstmrcardLadObjcDatasource(items: cstmrcardLadObjcDatasourceModel);

    }
  }

  // [고객카드 > 이의재결 (토지)] 조회
  fetchCstmrCardObstObjcInfoDataSource(ownerNo) async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lccc/selectCstmrCardLand.do');

    var param = {
      'shOwnerNo': ownerNo,
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['obstObjc'];
      AppLog.d(
          'fetchCstmrCardObstObjcInfoDataSource > obstObjc : $data');

      var cstmrcardObstObjcDatasourceModel = <CstmrcardObstObjcDatasourceModel>[];
      var length = data.length;

      cstmrcardObstObjcDataSourceKeyValue(data, cstmrcardObstObjcDatasourceModel, length);

      cstmrcardObstObjcDatasource.value =
          CstmrcardObstObjcDatasource(items: cstmrcardObstObjcDatasourceModel);

    }
  }

  // [고객카드 > 소송 (토지)] 조회
  fetchCstmrCardLadLwstInfoDataSource(ownerNo) async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lccc/selectCstmrCardLand.do');

    var param = {
      'shOwnerNo': ownerNo,
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['landLwst'];
      AppLog.d(
          'fetchCstmrCardLadLwstInfoDataSource > landLwst : $data');

      var cstmrcardLadLwstDatasourceModel = <CstmrcardLadLwstDatasourceModel>[];
      var length = data.length;

      cstmrcardLadLwstDataSourceKeyValue(data, cstmrcardLadLwstDatasourceModel, length);

      cstmrcardLadLwstDatasource.value =
          CstmrcardLadLwstDatasource(items: cstmrcardLadLwstDatasourceModel);

    }
  }

  // [고객카드 > 소송 (지장물)] 조회
  fetchCstmrCardObstLwstInfoDataSource(ownerNo) async {

    print('fetchCstmrCardObstLwstInfoDataSource > ownerNo : $ownerNo');

    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lccc/selectCstmrCardLand.do');

    var param = {
      'shOwnerNo': ownerNo,
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['obstLwst'];
      AppLog.d(
          'fetchCstmrCardObstLwstInfoDataSource > obstLwst : $data');

      var cstmrcardObstLwstDatasourceModel = <CstmrcardObstLwstDatasourceModel>[];
      var length = data.length;

      cstmrcardObstLwstDataSourceKeyValue(data, cstmrcardObstLwstDatasourceModel, length);

      cstmrcardObstLwstDatasource.value =
          CstmrcardObstLwstDatasource(items: cstmrcardObstLwstDatasourceModel);

    }
  }


  // [고객카드 > 환매 ] 조회
  fetchCstmrCardReprchsInfoDataSource(ownerNo) async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lccc/selectCstmrCardLand.do');

    var param = {
      'shOwnerNo': ownerNo,
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['reprchs'];
      AppLog.d(
          'fetchCstmrCardReprchsInfoDataSource > reprchs : $data');

      var cstmrcardReprchsDatasourceModel = <CstmrcardReprchsDatasourceModel>[];
      var length = data.length;

      cstmrcardReprchsDataSourceKeyValue(data, cstmrcardReprchsDatasourceModel, length);

      cstmrcardReprchsDatasource.value =
          CstmrcardReprchsDatasource(items: cstmrcardReprchsDatasourceModel);

    }
  }

  // [고객카드 > 토지수용확인원 ] 조회
  fetchCstmrCardConfirmInfoDataSource(ownerNo) async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lccc/selectCstmrCardLand.do');

    var param = {
      'shOwnerNo': ownerNo,
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['confirm'];
      AppLog.d(
          'fetchCstmrCardConfirmInfoDataSource > confirm : $data');

      var cstmrcardConfirmDatasourceModel = <CstmrcardConfirmDatasourceModel>[];
      var length = data.length;

      cstmrcardConfirmDataSourceKeyValue(data, cstmrcardConfirmDatasourceModel, length);

      cstmrcardConfirmDatasource.value =
          CstmrcardConfirmDatasource(items: cstmrcardConfirmDatasourceModel);

    }
  }

  // [고객카드 > 이의신청 ] 조회
  fetchCstmrCardFobjctInfoDataSource(ownerNo) async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lccc/selectCstmrCardLand.do');

    var param = {
      'shOwnerNo': ownerNo,
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['fobjct'];
      AppLog.d(
          'fetchCstmrCardFobjctInfoDataSource > fobjct : $data');

      var cstmrcardFobjectDatasourceModel = <CstmrcardFobjectDatasourceModel>[];
      var length = data.length;

      cstmrcardFobjctDataSourceKeyValue(data, cstmrcardFobjectDatasourceModel, length);

      cstmrcardFobjctDatasource.value =
          CstmrcardFobjctDatasource(items: cstmrcardFobjectDatasourceModel);

    }
  }


  /// [차수] 선택
  getSelectOrder() async {
    DialogUtil.showBottomSheet(
      Get.context!,
      '신규 조사 차수 등록',
      Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 140.w,
                      child: Text(
                        '차수등록',
                        style: TextStyle(
                          color: tableTextColor,
                          fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 32.w),
                    Expanded(
                      child: CustomTextField(
                        controller: orderAutoController,
                        hintText: orderAutoController.text,
                        isPassword: false,
                        isReadOnly: true,
                        textColor: tableTextColor,
                        onChanged: (value) {
                          AppLog.d('orderAutoController : $value');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            // 시작일
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 140.w,
                      child: Text(
                        '시작일',
                        style: TextStyle(
                          color: tableTextColor,
                          fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 32.w),
                    Expanded(
                      child: CustomTextField(
                        controller: orderStartDtController,
                        hintText: orderStartDtController.text,
                        isPassword: false,
                        isReadOnly: true,
                        textColor: tableTextColor,
                        onChanged: (value) {
                          AppLog.d('orderAutoController : $value');
                        },
                        onTap: () {
                          showDatePicker(
                            context: Get.context!,
                            initialDate: orderStartDtController.text.isEmpty
                                ? DateTime.now()
                                : DateTime.parse(orderStartDtController.text),
                            firstDate: DateTime(2024),
                            lastDate: DateTime(2034),
                            initialDatePickerMode: DatePickerMode.day,
                          ).then((value) {
                            AppLog.d('start dt : $value');
                            var year = value!.year;
                            var month = value.month < 10
                                ? '0${value.month}'
                                : value.month;
                            var day =
                                value.day < 10 ? '0${value.day}' : value.day;
                      
                            orderStartDtController.text = '$year-$month-$day';
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            // 종료일
            Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 140.w,
                        child: Text(
                          '종료일',
                          style: TextStyle(
                            color: tableTextColor,
                            fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 32.w),
                      Expanded(
                        child: CustomTextField(
                          controller: orderEndDtController,
                          hintText: orderEndDtController.text,
                          isPassword: false,
                          isReadOnly: true,
                          textColor: tableTextColor,
                          onChanged: (value) {
                            AppLog.d('orderAutoController : $value');
                          },
                          onTap: () {
                            showDatePicker(
                              context: Get.context!,
                              initialDate: orderEndDtController.text.isEmpty
                                  ? DateTime.now()
                                  : DateTime.parse(orderEndDtController.text),
                              firstDate: DateTime(2024),
                              lastDate: DateTime(2034),
                              initialDatePickerMode: DatePickerMode.day,
                            ).then((value) {
                              AppLog.d('start dt : $value');
                              var year = value!.year;
                              var month = value.month < 10
                                  ? '0${value.month}'
                                  : value.month;
                              var day =
                                  value.day < 10 ? '0${value.day}' : value.day;
                        
                              orderEndDtController.text = '$year-$month-$day';
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 38.h),
            InkWell(
              onTap: () {
                Get.back();
                if (orderStartDtController.text == "") {
                  return DialogUtil.showSnackBar(
                      Get.context!, '실태조사', '시작일을 입력해주세요.');
                }

                if (orderEndDtController.text == "") {
                  return DialogUtil.showSnackBar(
                      Get.context!, '실태조사', '종료일을 입력해주세요.');
                }

                DialogUtil.showAlertDialog(
                  Get.context!,
                  1.w > 1.h ? 1040 : 1800,
                  '선택이 완료되었습니다',
                  widget: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomBsnsBadge(
                                  text: LpController.to.selectBsnsPlan.value
                                          .bsnsDivLclsNm ??
                                      '',
                                  bgColor: Color(0xFFEFF5FF),
                                  textColor: Color(0xFF1D58BC)),
                              SizedBox(width: 6.w),
                              CustomBsnsBadge(
                                  text: LpController.to.selectBsnsPlan.value
                                          .bsnsDivMclsNm ??
                                      '',
                                  bgColor: Color(0xFFFFF1E4),
                                  textColor: Color(0xFFFF8000)),
                              SizedBox(width: 6.w),
                              selectBsnsPlan.value.bsnsDivSclsNm == null
                                  ? SizedBox()
                                  : CustomBsnsBadge(
                                      text: LpController.to.selectBsnsPlan
                                              .value.bsnsDivSclsNm ??
                                          '',
                                      bgColor: Color(0xFFFFF1E4),
                                      textColor: Color(0xFFFF8000)),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              '(${selectBsnsPlan.value.bsnsNo}) ',
                                          style: TextStyle(
                                            color: Color(0xFF1D1D1D),
                                            fontSize:
                                                1.w > 1.h ? 32.sp : 52.sp,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w700,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        TextSpan(
                                          text: selectBsnsPlan.value.bsnsNm ??
                                              '',
                                          style: TextStyle(
                                            color: Theme.of(Get.context!)
                                                .colorScheme
                                                .primary,
                                            fontSize:
                                                1.w > 1.h ? 32.sp : 52.sp,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w700,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Container(
                                    width: 2.w,
                                    height: 32.h,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFD8D8D8)),
                                  ),
                                  SizedBox(width: 20.w),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '${orderAutoController.text}',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize:
                                                1.w > 1.h ? 32.sp : 52.sp,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '차조사',
                                          style: TextStyle(
                                            color: Color(0xFF1D1D1D),
                                            fontSize:
                                                1.w > 1.h ? 32.sp : 52.sp,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                selectBsnsPlan.value.bsnsLcinfo ?? '',
                                style: TextStyle(
                                  color: tableTextColor,
                                  fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 2,
                              ),
                              SizedBox(height: 10.h),
                              // 시작일 ~ 종료일
                              SizedBox(height: 10.h),
                              Text(
                                '사업기간: ${orderStartDtController.text} ~ ${orderEndDtController.text}',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 1.w > 1.h ? 32.sp : 50.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 48.h),
                              Text(
                                '현장 실태조사를 시작하시겠습니까?',
                                style: TextStyle(
                                  color: Color(0xFF1D1D1D),
                                  fontSize: 1.w > 1.h ? 36.sp : 56.sp,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  // 행간
                                  height: 1.5,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  onOk: () {
                    AppLog.d('실태조사 시작');
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
                        height: 72.h,
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
                                fontSize: 1.w > 1.h ? 32.sp : 52.sp,
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
    AppLog.d('searchBsnsName : $value');
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () async {
      if (value.isEmpty) {
        searchBsnsPlanList.value = bsnsPlanList;
      } else {
        searchBsnsPlanList.value = bsnsPlanList
            .where((element) => element.bsnsNm?.contains(value) ?? false)
            .toList();
        AppLog.d('serachBsnsPlanList : $searchBsnsPlanList');
      }
    });
  }

  /// [차수 자동 입력]
  autoSqnc() async {
    var url = 'http://222.107.22.159:18080/lp/bsns/selectAccdtInvstgSqnc.do';
    //'?shBsnsNo=2101&shBsnsZoneNo=2';

    AppLog.d('shBsnsNo : ${selectedBsnsSelectArea.value.bsnsNo}');
    AppLog.d('shBsnsZoneNo : ${selectedBsnsSelectArea.value.bsnsZoneNo}');

    var response = await http.post(Uri.parse(url), body: {
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    });
    AppLog.d('response : ${response.statusCode}');

    var responseUrl = response.request!.url;
    AppLog.d('responseUrl : $responseUrl');

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchBsnsSelectAreaGridDataSource > data : $data');

      var bsnsAccdtinvstgSqncModel = <BsnsAccdtinvstgSqncModel>[];

      for (var i = 0; i < data.length; i++) {
        bsnsAccdtinvstgSqncModel.add(
          BsnsAccdtinvstgSqncModel(
            bsnsNo: data[i]['bsnsNo'] ?? '',
            bsnsZoneNo: data[i]['bsnsZoneNo'] ?? 0,
            accdtInvstgSqnc: data[i]['accdtInvstgSqnc'] ?? 0,
            accdtInvstgNm: data[i]['accdtInvstgNm'] ?? '',
            delYn: data[i]['delYn'] ?? '',
            frstRgstrId: data[i]['frstRgstrId'] ?? '',
            frstRegistDt: CommonUtil.convertToDateTime(data[i]['frstRegistDt']),
            lastUpdusrId: data[i]['lastUpdusrId'] ?? '',
            lastUpdtDt: CommonUtil.convertToDateTime(data[i]['lastUpdtDt']),
            conectIp: data[i]['conectIp'],
          ),
        );
      }

      // 마지막 차수 + 1

      if (bsnsAccdtinvstgSqncModel.isEmpty) {
        orderAutoController.text = '1';
      } else {
        num lastSqnc = bsnsAccdtinvstgSqncModel.first.accdtInvstgSqnc ?? 0 + 1;
        AppLog.d('lastSqnc : $lastSqnc');

        num last = lastSqnc == 0 ? 1 : lastSqnc + 1;

        orderAutoController.text = last.toString();
      }

      bsnsAccdtinvstgSqncDataSource.value =
          BsnsAccdtinvstgSqncDatasource(items: bsnsAccdtinvstgSqncModel);
    } else {
      AppLog.d('error');
    }
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

  /// 통계정보 탭 선택 핸들러
  Future<void> handleSttusInqireTabSelected(int index) async {
    sttusInqireTabIsSelected[index] = !sttusInqireTabIsSelected[index];
    AppLog.d('ladSttusInqireTabIsSelected : $sttusInqireTabIsSelected');
  }

  /// 고객카드 탭 선택 핸들러
  Future<void> handleCustomerCardTabSelected(int index) async {
    for (var i = 0; i < customerCardTabIsSelected.length; i++) {
      customerCardTabIsSelected[i] = false;
    }
    customerCardTabIsSelected[index] = true;
  }

  /// 고객카드 상세 탭 선택 핸들러
  Future<void> handleCustomerCardDetailTabSelected(int index) async {
    for (var i = 0; i < customerCardDetailTabIsSelected.length; i++) {
      customerCardDetailTabIsSelected[i] = false;
    }
    customerCardDetailTabIsSelected[index] = true;
  }

  void addBsns() {
    DialogUtil.showAlertDialog(Get.context!, 1040, '토지 현실이용현황 조회 및 입력',
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 200.w,
                  height: 104.h,
                  padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E8ED),
                    border: Border.all(color: Color(0xFFD8D8D8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            '지목선택',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1D1D1D),
                              fontSize: 30.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 104.h,
                    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xFFD8D8D8)),
                        bottom: BorderSide(color: Color(0xFFD8D8D8)),
                      )
                    ),
                    child: Expanded(
                      child: Row(
                       children: [
                         Expanded(
                           child: CustomTextField(
                             hintText: '내용',
                             isPassword: false,
                             isReadOnly: true,
                             textColor: tableTextColor,
                             onChanged: (value) {
                               AppLog.d('sttusInqireBsnsSelectController : $value');
                             },
                             onTap: () {
                  
                             },
                           ),
                         ),
                         SizedBox(width: 12.w),
                         SizedBox(
                           width: 100.w,
                           child: CustomButton(
                             text: '조회',
                             textColor: tableTextColor,
                             color: Color(0xFFE5E8ED),
                           ),
                         ),
                       ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Container(
                  width: 200.w,
                  height: 104.h,
                  padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E8ED),
                    border: Border.all(color: Color(0xFFD8D8D8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            '면적(㎡)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1D1D1D),
                              fontSize: 30.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 104.h,
                    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFD8D8D8)),
                        )
                    ),
                    child: Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText: '내용',
                              isPassword: false,
                              isReadOnly: true,
                              textColor: tableTextColor,
                              onChanged: (value) {
                                AppLog.d('sttusInqireBsnsSelectController : $value');
                              },
                              onTap: () {

                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Container(
                  width: 200.w,
                  height: 122.h,
                  padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    color: Color(0xFFE5E8ED),
                    border: Border.all(color: Color(0xFFD8D8D8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            '용도지구\n및 지역',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF1D1D1D),
                              fontSize: 30.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 104.h,
                    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFD8D8D8)),
                        )
                    ),
                    child: Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText: '내용',
                              isPassword: false,
                              isReadOnly: true,
                              textColor: tableTextColor,
                              onChanged: (value) {
                                AppLog.d('sttusInqireBsnsSelectController : $value');
                              },
                              onTap: () {

                              },
                            ),
                          ),
                          SizedBox(width: 12.w),
                          CustomMicrophonewithpenButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ), onOk: () {
      debugPrint('토지 현실이용현황 조회 및 입력');
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
