import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ldi/components/custom_bsns_badge.dart';
import 'package:ldi/components/custom_button.dart';
import 'package:ldi/screens/bsns/bsns_plan_model.dart';
import 'package:ldi/screens/bsns/select/bsns_plan_select_area_model.dart';
import 'package:ldi/screens/bsns/sqnc/bsns_accdtinvstg_sqnc_datasource.dart';
import 'package:ldi/screens/bsns/sqnc/model/bsns_accdtinvstg_sqnc_model.dart';
import 'package:ldi/screens/owner/datasource/model/owner_info_model.dart';
import 'package:ldi/screens/sttus/datasource/lad_sttus_inqire_datasource.dart';
import 'package:ldi/screens/sttus/datasource/model/lad_sttus_inqire_model.dart';
import 'package:ldi/screens/sttus/datasource/model/obst_sttus_inqire_model.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../utils/colors.dart';
import '../../utils/common_util.dart';
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
import '../sttus/datasource/obst_sttus_inqire_datasource.dart';
import 'datasource/bsns_select_area_datasource.dart';
import 'datasource/model/bsns_select_area_datasource_model.dart';
import 'select/bsns_select_model.dart';
import 'sqnc/bsns_sqnc_datasource.dart';
import 'sqnc/model/bsns_sqnc_datasource_model.dart';

import 'package:http/http.dart' as http;

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
  final sttusInqireTabIsSelected = [false, false, false, false, false, false, false, false, false, false].obs;

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
  late DataGridController bsnsAccdtinvstgSqncDataGridController;

  late DataGridController ownerLadInfoDataGridController;
  late DataGridController ownerObstInfoDataGridController;

  late DataGridController accdtlnvstgLadDataGridController;
  late DataGridController accdtlnvstgLadOwnerDataGridController;
  late DataGridController accdtlnvstgLadPartcpntDataGridController;

  late DataGridController accdtlnvstgObstDataGridController;

  late DataGridController ladSttusInqireDataGridController;
  late DataGridController obstSttusInqireDataGridController;

  /// [BsnsSelectAreaDataSource] 는 [DataGridSource] 를 상속받아 구현한 데이터 소스 클래스이다.
  final bsnsListDataSource = BsnsSelectAreaDataSource(items: []).obs; // 사업구역선택

  final bsnsOwnerDataSource = OwnerDatasource(items: []).obs; // 소유자

  final ownerLadInfoDataSource = OwnerLadInfoDatasource(items: []).obs; // 소유자 및 관계인
  final ownerObstInfoDataSource = OwnerObstInfoDatasource(items: []).obs; // 지장물정보

  final bsnsSqncDataSource = BsnsSqncDatasource(items: []).obs; // 조사차수
  RxList<BsnsSqncDatasourceModel> bsnsSqnc = <BsnsSqncDatasourceModel>[].obs;

  final bsnsAccdtinvstgSqncDataSource = BsnsAccdtinvstgSqncDatasource(items: []).obs; // 조사차수

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
  final obstSttusInqireDataSource = ObstSttusInqireDatasource(items: []).obs;

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

  Rx<BsnsSelectAreaDataSourceModel> bsnsSelectAreaDataSource = BsnsSelectAreaDataSourceModel().obs;
  Rx<BsnsPlanSelectAreaModel> selectedBsnsSelectArea = BsnsPlanSelectAreaModel().obs;

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

  RxBool isSttusInqireGridTab1 = false.obs;
  RxBool isSttusInqireGridTab2 = false.obs;
  RxBool isSttusInqireGridTab3 = false.obs;
  RxBool isSttusInqireGridTab4 = false.obs;
  RxBool isSttusInqireGridTab5 = false.obs;
  RxBool isSttusInqireGridTab6 = false.obs;
  RxBool isSttusInqireGridTab7 = false.obs;
  RxBool isSttusInqireGridTab8 = false.obs;
  RxBool isSttusInqireGridTab9 = false.obs;
  RxBool isSttusInqireGridTab10 =false.obs;

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
    bsnsAccdtinvstgSqncDataGridController = DataGridController();

    // 소유자관리 > 토지정보
    ownerLadInfoDataGridController = DataGridController();
    // 소유자관리 > 지장물정보
    ownerObstInfoDataGridController = DataGridController();

    // 실태조사 > 토지
    accdtlnvstgLadDataGridController = DataGridController();

    // 실태조사 > 소유자/관계인
    accdtlnvstgLadOwnerDataGridController = DataGridController();
    accdtlnvstgLadPartcpntDataGridController = DataGridController();

    // 실태조사 > 지장물
    accdtlnvstgObstDataGridController = DataGridController();

    // 통계정보 > 토지현황
    ladSttusInqireDataGridController = DataGridController();
    // 통계정보 > 지장물현황
    obstSttusInqireDataGridController = DataGridController();

    bsnsTabController.addListener(() {
      debugPrint('bsnsTabController.index : ${bsnsTabController.index}');
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
      debugPrint('bsnsListScrollController.offset : ${bsnsListScrollController
          .offset}');
    });

    /// [사업목록] 조회
    await fetchBsnsList();

    /**
     * 소유자
     */

    /// [소유자 검색] 조회
    await fetchAccdtlnvstgSearchDataSource();

    /**
     * 실태조사
     */

    // [실태조사 > 토지 정보] 조회
    // await fetchAccdtlnvstgOwnerDataSource();

    /// [실태조사 > 지장물 정보] 조회
    await fetchAccdtlnvstgObstDataSource();

    /**
     * 통계
     */

  }

  /// [gridColumn] 데이터그리드 컬럼
  GridColumn gridColumn(String columnName, String label, {bool? isVisble, double? width}) {
    return GridColumn(
        //width: controller.columnWidths[columnName ?? ''] ?? 80,
        //width: columnWidths[columnName] ?? width ?? 80,
        width: width ?? double.nan,
        columnName: columnName,
        visible: isVisble ?? true,
        label: SizedBox(child: Center(child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp, color: tableTextColor)))));
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
    if(radioValue == 0){
      searchBsnsPlanList = bsnsPlanList.where((element) => element.bsnsDivLclsNm == '댐').toList().obs;
    } else if(radioValue == 1){
      searchBsnsPlanList = bsnsPlanList.where((element) => element.bsnsDivLclsNm == '수도').toList().obs;
    } else if(radioValue == 2){
      searchBsnsPlanList = bsnsPlanList.where((element) => element.bsnsDivLclsNm == '단지').toList().obs;
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

    var url = Uri.parse('http://222.107.22.159:18080/lp/bsns/selectBsnsPlan.do');
    var response = await http.post(url);

    bsnsPlanList.clear();

    if (response.statusCode == 200) {

      var data = JsonDecoder().convert(response.body)['list'];
      List<BsnsPlanModel> dataList = <BsnsPlanModel>[];

      print('fetchBsnsList > data : $data');

      dataList = data.map<BsnsPlanModel>((e) => BsnsPlanModel(
          bsnsNo: e['bsnsNo'],
          bsnsNm: e['bsnsNm'],
          bsnsDivLclsCd: e['bsnsDivLclsCd'],
          bsnsDivMclsCd: e['bsnsDivMclsCd'],
          bsnsDivSclsCd: e['bsnsDivSclsCd'],
          bsnsStrtDe: e['bsnsStrtDe'],
          bsnsEndDe: e['bsnsEndDe'],
          competDe: e['competDe'],
          bsnsPlanAprvRqstDe: e['bsnsPlanAprvRqstDe'],
          aprvDe: e['aprvDe'],
          gztNtfcDe: e['gztNtfcDe'],
          enfcMthDtls: e['enfcMthDtls'],
          bsnsPurpsDtls: e['bsnsPurpsDtls'],
          bsnsLcinfo: e['bsnsLcinfo'],
          bsnsScaleInfo: e['bsnsScaleInfo'],
          lotCnt: e['lotCnt'],
          bsnsAra: e['bsnsAra'],
          bsnsAmt: e['bsnsAmt'],
          gztNtfcNoDtls: e['gztNtfcNoDtls'],
          mngdeptCd: e['mngdeptCd'],
          reltDeptCd1: e['reltDeptCd1'],
          reltDeptCd2: e['reltDeptCd2'],
          reltDeptCd3: e['reltDeptCd3'],
          reltDeptCd4: e['reltDeptCd4'],
          reltDeptCd5: e['reltDeptCd5'],
          gisDtaYn: e['gisDtaYn'],
          bsnsSqnc: e['bsnsSqnc'],
          bsnsBasisLawordInfo: e['bsnsBasisLawordInfo'],
          oldMngdeptCd: e['oldMngdeptCd'],
          bsnsCnfmInsttNm: e['bsnsCnfmInsttNm'],
          delYn: e['delYn'],
          frstRgstrId: e['frstRgstrId'],
          frstRegistDt: e['frstRegistDt'],
          lastUpdusrId: e['lastUpdusrId'],
          lastUpdtDt: e['lastUpdtDt'],
          conectIp: e['conectIp'],
          bsnsDivLclsNm: e['bsnsDivLclsNm'] ?? '',
          bsnsDivMclsNm: e['bsnsDivMclsNm'] ?? '',
          bsnsDivSclsNm: e['bsnsDivSclsNm'] ?? '',
          head: e['head'],
          dept: e['dept'],
          team: e['team'],
          bgroup: e['bgroup'],
          affcd: e['affcd'],
          plans: e['plans'],
          korname: e['korname']
      )).toList();

      bsnsPlanList = dataList.obs;
      searchBsnsPlanList = dataList.obs;

    } else {
      debugPrint('Failed to load post');
      DialogUtil.showSnackBar(Get.context!, '사업목록', '사업목록을 조회할 수 없습니다.');
    }

    return bsnsPlanList;

  }

  /// [사업구역선택] 조회
  fetchBsnsSelectAreaGridDataSource() async {

    var url = Uri.parse('http://222.107.22.159:18080/lp/bsns/selectBsnsZone.do');

    // param
    var param = {
      'bsnsNo': selectBsnsPlan.value.bsnsNo,
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      debugPrint('fetchBsnsSelectAreaGridDataSource > data : $data');

      var bsnsPlanSelectAreaModel = <BsnsPlanSelectAreaModel>[];

      for (var i = 0; i < data.length; i++) {

        var bsnsZoneNo = data[i]['bsnsZoneNo'];
        debugPrint('fetchBsnsSelectAreaGridDataSource > bsnsZoneNo : $bsnsZoneNo');

        bsnsPlanSelectAreaModel.add(BsnsPlanSelectAreaModel(
            bsnsNo: num.parse(data[i]['bsnsNo']),
            bsnsZoneNo: data[i]['bsnsZoneNo'],
            bsnsZoneNm: data[i]['bsnsZoneNm'],
            lotCnt: data[i]['lotCnt'],
            bsnsAra: CommonUtil.comma3(data[i]['bsnsAra']),
            bsnsReadngPblancDe: data[i]['bsnsReadngPblancDe'] == null
                ? '-'
                : CommonUtil.convertToDateTime(data[i]['bsnsReadngPblancDe'])
        ));
      }

      bsnsListDataSource.value = BsnsSelectAreaDataSource(items: bsnsPlanSelectAreaModel);

    } else {
      debugPrint('Failed to load post');
    }

  }

  /// [소유자 및 관리인] 조회
  fetchBsnsOwnerDataSource() async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/owner/selectOwnList.do');

    var param = {
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    debugPrint('fetchBsnsOwnerDataSource > param : $param');

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {

      var data = JsonDecoder().convert(response.body)['list'];
      debugPrint('fetchBsnsOwnerDataSource > data : $data');

      var res = <OwnerDataSourceModel>[];

      for(var i = 0; i < data.length; i++) {
        res.add(OwnerDataSourceModel(
          ownerNo: data[i]['ownerNo'] ?? '',
          ownerNm: data[i]['ownerNm'] ?? '',
          posesnDivCd: data[i]['posesnDivCd'] ?? '',
          posesnDivNm: data[i]['posesnDivNm'] ?? '',
          bsnsNo: data[i]['bsnsNo'] ?? '',
          bsnsZoneNo: data[i]['bsnsZoneNo'] ?? '',
          ownerRrnEnc: data[i]['ownerRrnEnc'] ?? '',
          oldRegno: data[i]['oldRegno'] ?? '',
          //ownerTelno: data[i]['ownerTelno'] ?? '',
          ownerTelno: CommonUtil.phoneHyphen(data[i]['ownerTelno'] ?? ''),
          //ownerMbtlnum: data[i]['ownerMbtlnum'] ?? '',
          ownerMbtlnum: CommonUtil.phoneHyphen(data[i]['ownerMbtlnum'] ?? ''),
          rgsbukZip: data[i]['rgsbukZip'] ?? '',
          delvyZip: data[i]['delvyZip'] ?? '',
          moisZip: data[i]['moisZip'] ?? '',
          ownerRgsbukAddr: data[i]['ownerRgsbukAddr'] ?? '',
          ownerDelvyAddr: data[i]['ownerDelvyAddr'] ?? '',
          ownerMoisAddr: data[i]['ownerMoisAddr'] ?? '',
          accdtInvstgRm: data[i]['accdtInvstgRm'] ?? '',
          frstRgstrId: data[i]['frstRgstrId'] ?? '',
          frstRegistDt: data[i]['frstRegistDt'] ?? '',
          lastUpdusrId: data[i]['lastUpdusrId'] ?? '',
          lastUpdtDt: data[i]['lastUpdtDt'] ?? '',
          conectIp: data[i]['conectIp'] ?? '',
          thingCnt: data[i]['thingCnt'] ?? '',
          bsnsCnt: data[i]['bsnsCnt'] ?? '',
          realOwnerNo: data[i]['realOwnerNo'] ?? '',
          ownerDivCd: data[i]['ownerDivCd'] ?? '',
          ownerRgsbukAddrFull: data[i]['ownerRgsbukAddrFull'] ?? '',
          ownerDelvyAddrFull: data[i]['ownerDelvyAddrFull'] ?? '',
          ownerMoisAddrFull: data[i]['ownerMoisAddrFull'] ?? '',
        ));
      }
      bsnsOwnerDataSource.value = OwnerDatasource(items: res);
    }
  }


  /// [소유자관리 > 토지정보] 조회
  fetchOwnerLadInfoDataSource(ownerNum) async {

    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/owner/selectLandList.do');

    var param = {
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
      'shOwnerNo' : ownerNum ?? '',
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {

      var data = JsonDecoder().convert(response.body)['list'];
      debugPrint('fetchOwnerLadInfoDataSource > data : $data');

      var res = <OwnerLadInfoDatasourceModel>[];

      for(var i = 0; i < data.length; i++) {
        res.add(OwnerLadInfoDatasourceModel(
          lgdongNm: data[i]['lgdongNm'] ?? '',
          lcrtsDivCd: data[i]['lcrtsDivCd'] ?? '',
          mlnoLtno: data[i]['mlnoLtno'] ?? '',
          slnoLtno: data[i]['slnoLtno'] ?? '',
          ofcbkLndcgrDivCd: data[i]['ofcbkLndcgrDivCd'] ?? '',
          sttusLndcgrDivCd: data[i]['sttusLndcgrDivCd'] ?? '',
          ofcbkAra: data[i]['ofcbkAra'] ?? '',
          incrprAra: data[i]['incrprAra'] ?? '',
          cmpnstnInvstgAra: data[i]['cmpnstnInvstgAra'] ?? '',
          acqsPrpDivCd: data[i]['acqsPrpDivCd'] ?? '',
          aceptncUseDivCd: data[i]['aceptncUseDivCd'] ?? '',
          accdtInvstgSqnc: data[i]['accdtInvstgSqnc'] ?? '',
          invstgDt: data[i]['invstgDt'] ?? '',
          cmpnstnStepDivCd: data[i]['cmpnstnStepDivCd'] ?? '',
          accdtInvstgRm: data[i]['accdtInvstgRm'] ?? '',
        ));
      }
      ownerLadInfoDataSource.value = OwnerLadInfoDatasource(items: res);
    }
  }

  /// [소유자관리 > 지장물정보] 조회
  fetchOwnerObstInfoDataSource(ownerNum) async {

    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/owner/selecObstList.do');

    var param = {
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
      'shOwnerNo' : ownerNum,
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {

      var data = JsonDecoder().convert(response.body)['list'];
      debugPrint('fetchOwnerObstInfoDataSource > data : $data');

      var res = <OwnerObstInfoDatasourceModel>[];

      for(var i = 0; i < data.length; i++) {
        res.add(OwnerObstInfoDatasourceModel(
          lgdongNm: data[i]['lgdongNm'] ?? '',
          lcrtsDivCd: data[i]['lcrtsDivCd'] ?? '',
          mlnoLtno: data[i]['mlnoLtno'] ?? '',
          slnoLtno: data[i]['slnoLtno'] ?? '',
          cmpnstnObstNo: data[i]['cmpnstnObstNo'] ?? '',
          obstDivCd: data[i]['obstDivCd'] ?? '',
          cmpnstnThingKndDtls: data[i]['cmpnstnThingKndDtls'] ?? '',
          obstStrctStndrdInfo: data[i]['obstStrctStndrdInfo'] ?? '',
          cmpnstnQtyAraVu: data[i]['cmpnstnQtyAraVu'] ?? '',
          cmpnstnThingUnitDivCd: data[i]['cmpnstnThingUnitDivCd'] ?? '',
          acqsPrpDivCd: data[i]['acqsPrpDivCd'] ?? '',
          accdtInvstgSqnc: data[i]['accdtInvstgSqnc'] ?? '',
          invstgDt: data[i]['invstgDt'] ?? '',
          cmpnstnStepDivCd: data[i]['cmpnstnStepDivCd'] ?? '',
          spcitm: data[i]['spcitm'] ?? '',
        ));
      }
      ownerObstInfoDataSource.value = OwnerObstInfoDatasource(items: res);
    }

  }

  /// [소유자관리 > 정보변경] 조회
  /// @deprecated 선택한 소유자에대한 소유자정보를 조회한다.
  fetchOwnerInfo(ownerNum) async {

    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/owner/selecOwnInfo.do');

    var param = {
      'shOwnerNo' : ownerNum,
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      debugPrint('fetchOwnerInfo > data : $data');

      var res = <OwnerInfoModel>[];
      for(var i = 0; i < data.length; i++) {
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

      debugPrint('fetchOwnerInfo > res : $res');
      selectedOwner.value = res[0];

    }

  }

  /// [실태조사 > 토지내역] 조회
  fetchAccdtlnvstgSearchDataSource() async {
    var accdtlnvstgLad = <AccdtlnvstgLadModel>[];
    for (var i = 0; i < 10; i++) {
      accdtlnvstgLad.add(
        AccdtlnvstgLadModel(
          col1: '건축물대장내용확인',
          col2: '0',
          col3: '소재지',
          col4: '특지',
          col5: '본번',
          col6: '부번',
          col7: '공부',
          col8: '현황',
          col9: '공부',
          col10: '편입',
          col11: '조사',
          col12: '취득용도',
          col13: '수용/사용',
          col14: '조사차수',
          col15: '조사일자',
          col16: '보상단계',
          col17: '비고',
        )
      );
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

    // loading bar
    DialogUtil.showLoading(Get.context!);

    print('fetchLadSttusInqireDataSource > selectedBsnsSelectArea.value.bsnsNo : ${selectedBsnsSelectArea.value.bsnsNo}');

    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lssom/selectSttusLadInfo.do');

    var param = {
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      debugPrint('fetchLadSttusInqireDataSource > data : $data');

      var res = <LadSttusInqireModel>[];
      for(var i = 0; i < data.length; i++) {
        res.add(LadSttusInqireModel(
          lgdongNm: data[i]['lgdongNm'] ?? '',
          lcrtsDivCd: data[i]['lcrtsDivCd'] ?? '',
          mlnoLtno: data[i]['mlnoLtno'] ?? '',
          slnoLtno: data[i]['slnoLtno'] ?? '',
          ofcbkLndcgrDivCd: data[i]['ofcbkLndcgrDivCd'] ?? '',
          sttusLndcgrDivCd: data[i]['sttusLndcgrDivCd'] ?? '',
          cmpnstnStepDivCd: data[i]['cmpnstnStepDivCd'] ?? '',
          acqsPrpDivCd: data[i]['acqsPrpDivCd'] ?? '',
          ofcbkAra: data[i]['ofcbkAra'] ?? '',
          incrprAra: data[i]['incrprAra'] ?? '',
          rqestNo: data[i]['rqestNo'] ?? '',
          aceptncUseDivCd: data[i]['aceptncUseDivCd'] ?? '',
          invstgDt: data[i]['invstgDt'] ?? '',
          accdtInvstgSqnc: data[i]['accdtInvstgSqnc'] ?? '',
          ownerNo: data[i]['ownerNo'] ?? '',
          posesnDivCd: data[i]['posesnDivCd'] ?? '',
          ownerNm: data[i]['ownerNm'] ?? '',
          ownerRgsbukAddr: data[i]['ownerRgsbukAddr'] ?? '',
          posesnShreNmrtrInfo: data[i]['posesnShreNmrtrInfo'] ?? '',
          posesnShreDnmntrInfo: data[i]['posesnShreDnmntrInfo'] ?? '',
          apasmtReqestDivCd: data[i]['apasmtReqestDivCd'] ?? '',
          apasmtSqnc: data[i]['apasmtSqnc'] ?? 0,
          prcPnttmDe: data[i]['prcPnttmDe'] ?? '',
          apasmtInsttNm1: data[i]['apasmtInsttNm1'] ?? '',
          apasmtInsttEvlUpc1: data[i]['apasmtInsttEvlUpc1'] ?? '',
          apasmtInsttEvamt1: data[i]['apasmtInsttEvamt1'] ?? '',
          apasmtInsttNm2: data[i]['apasmtInsttNm2'] ?? '',
          apasmtInsttEvlUpc2: data[i]['apasmtInsttEvlUpc2'] ?? '',
          apasmtInsttEvamt2: data[i]['apasmtInsttEvamt2'] ?? '',
          apasmtInsttNm3: data[i]['apasmtInsttNm3'] ?? '',
          apasmtInsttEvlUpc3: data[i]['apasmtInsttEvlUpc3'] ?? '',
          apasmtInsttEvamt3: data[i]['apasmtInsttEvamt3'] ?? '',
          cmpnstnCmptnUpc: data[i]['cmpnstnCmptnUpc'] ?? '',
          cpsmnCmptnAmt: data[i]['cpsmnCmptnAmt'] ?? '',
          caPymntRequstDe: data[i]['caPymntRequstDe'] ?? '',
          cmpnstnDscssUpc: data[i]['cmpnstnDscssUpc'] ?? '',
          cmpnstnDscssTotAmt: data[i]['cmpnstnDscssTotAmt'] ?? '',
          caRgistDt: data[i]['caRgistDt'] ?? '',
          aceptncAdjdcUpc: data[i]['aceptncAdjdcUpc'] ?? '',
          aceptncAdjdcAmt: data[i]['aceptncAdjdcAmt'] ?? '',
          aceptncAdjdcDt: data[i]['aceptncAdjdcDt'] ?? '',
          aceptncUseBeginDe: data[i]['aceptncUseBeginDe'] ?? '',
          ldPymntRequstDe: data[i]['ldPymntRequstDe'] ?? '',
          ldRgistDt: data[i]['ldRgistDt'] ?? '',
          ldCpsmnPymntLdgmntDivCd: data[i]['ldCpsmnPymntLdgmntDivCd'] ?? '',
          obadUpc: data[i]['obadUpc'] ?? '',
          objcRstAmt: data[i]['objcRstAmt'] ?? '',
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
      gridColumn('lcrtsDivCd', '특지', width: 60),
      gridColumn('mlnoLtno', '본번', width: 60),
      gridColumn('slnoLtno', '부번', width: 60),

      gridColumn('ofcbkLndcgrDivCd', '공부', width: 60),
      gridColumn('sttusLndcgrDivCd', '현황', width: 60),

      gridColumn('cmpnstnStepDivCd', '진행단계', width: 100),
      gridColumn('acqsPrpDivCd', '취득용도', width: 100),

      gridColumn('ofcbkAra', '공부', width: 100),
      gridColumn('incrprAra', '편입', width: 100),

      gridColumn('aceptncUseDivCd', '수용/사용',isVisble: isSttusInqireGridTab1.value, width: 80),
      gridColumn('invstgDt', '조사일', isVisble: isSttusInqireGridTab1.value, width: 80),
      gridColumn('accdtInvstgSqnc', '조사차수', isVisble: isSttusInqireGridTab1.value, width: 80),

      gridColumn('ownerNo', '소유자번호', isVisble: isSttusInqireGridTab2.value, width: 80),
      gridColumn('posesnDivCd', '구분', isVisble: isSttusInqireGridTab2.value, width: 80),
      gridColumn('ownerNm', '소유자명', isVisble: isSttusInqireGridTab2.value, width: 80),
      gridColumn('ownerRgsbukAddr', '등기부주소', isVisble: isSttusInqireGridTab2.value, width: 80),
      gridColumn('posesnShreNmrtrInfo', '분자', isVisble: isSttusInqireGridTab2.value, width: 80),
      gridColumn('posesnShreDnmntrInfo', '분모', isVisble: isSttusInqireGridTab2.value, width: 80),

      gridColumn('apasmtReqestDivCd', '평가구분', isVisble: isSttusInqireGridTab3.value, width: 80),
      gridColumn('apasmtSqnc', '평가차수', isVisble: isSttusInqireGridTab3.value, width: 80),
      gridColumn('prcPnttmDe', '가격시점', isVisble: isSttusInqireGridTab3.value, width: 80),

      // a평가법인
      gridColumn('apasmtInsttNm1', '법인명', isVisble: isSttusInqireGridTab3.value, width: 80),
      gridColumn('apasmtInsttEvlUpc1', '단가', isVisble: isSttusInqireGridTab3.value , width: 80),
      gridColumn('apasmtInsttEvlAmt1', '금액', isVisble: isSttusInqireGridTab3.value , width: 80),

      // b평가법인
      gridColumn('apasmtInsttNm2', '법인명', isVisble: isSttusInqireGridTab3.value , width: 80),
      gridColumn('apasmtInsttEvlUpc2', '단가', isVisble: isSttusInqireGridTab3.value , width: 80),
      gridColumn('apasmtInsttEvlAmt2', '금액', isVisble: isSttusInqireGridTab3.value , width: 80),

      // c평가법인
      gridColumn('apasmtInsttNm3', '법인명', isVisble: isSttusInqireGridTab3.value, width: 80),
      gridColumn('apasmtInsttEvlUpc3', '단가', isVisble: isSttusInqireGridTab3.value, width: 80),
      gridColumn('apasmtInsttEvlAmt3', '금액', isVisble: isSttusInqireGridTab3.value, width: 80),

      // 보상비산정
      gridColumn('cmpnstnCmptnUpc', '산정단가', isVisble: isSttusInqireGridTab4.value, width: 80),
      gridColumn('cpsmnCmptnAmt', '산정금액', isVisble: isSttusInqireGridTab4.value, width: 80),

      // 보상비지급
      gridColumn('caPymntRequstDe', '지급요청일', isVisble: isSttusInqireGridTab5.value, width: 80),
      gridColumn('cmpnstnDscssUpc', '지급단가', isVisble: isSttusInqireGridTab5.value, width: 80),
      gridColumn('cmpnstnDscssTotAmt', '지급금액', isVisble: isSttusInqireGridTab5.value, width: 80),
      gridColumn('caRgistDt', '등기일자', isVisble: isSttusInqireGridTab5.value, width: 80),

      // 수용재결
      gridColumn('aceptncAdjdcUpc', '재결단가', isVisble: isSttusInqireGridTab6.value, width: 80),
      gridColumn('aceptncAdjdcAmt', '재결금액', isVisble: isSttusInqireGridTab6.value, width: 80),
      gridColumn('aceptncAdjdcDt', '재결일자', isVisble: isSttusInqireGridTab6.value, width: 80),
      gridColumn('aceptncUseBeginDe', '수용/사용개시일', isVisble: isSttusInqireGridTab6.value, width: 80),
      gridColumn('ldPymntRequstDe', '지급요청일자', isVisble: isSttusInqireGridTab6.value, width: 80),
      gridColumn('ldRgistDt', '등기일자', isVisble: isSttusInqireGridTab6.value, width: 80),
      gridColumn('ldCpsmnPymntLdgmntDivCd', '지급/공탁', isVisble: isSttusInqireGridTab6.value, width: 80),

      // 이의재결
      gridColumn('obadUpc', '재결단가', isVisble: isSttusInqireGridTab7.value, width: 80),
      gridColumn('objcRstAmt', '재결금액', isVisble: isSttusInqireGridTab7.value, width: 80),
      gridColumn('objcAdjdcDt', '재결일자', isVisble: isSttusInqireGridTab7.value, width: 80),
      gridColumn('proPymntRequstDe', '지급요청일자', isVisble: isSttusInqireGridTab7.value, width: 80),
      gridColumn('proCpsmnPymntLdgmntDivCd', '지급/공탁', isVisble: isSttusInqireGridTab7.value, width: 80),
    ];

  }

  /// [통계정보 > 지장물현황] 조회
  fetchObstSttusInqireDataSource() async {

    print('fetchObstSttusInqireDataSource > selectedBsnsSelectArea.value.bsnsNo : ${selectedBsnsSelectArea.value.bsnsNo}');

    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lssom/selectSttusObstInfo.do');

    var param = {
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      debugPrint('fetchObstSttusInqireDataSource > data : $data');

      var res = <ObstSttusInqireModel>[];
      for(var i = 0; i < data.length; i++) {
        res.add(ObstSttusInqireModel(

          lgdongNm: data[i]['lgdongNm'] ?? '',
          lcrtsDivCd: data[i]['lcrtsDivCd'] ?? '',
          mlnoLtno: data[i]['mlnoLtno'] ?? '',
          slnoLtno: data[i]['slnoLtno'] ?? '',

          cmpnstnStepDivCd: data[i]['cmpnstnStepDivCd'] ?? '',
          acqsPrpDivCd: data[i]['acqsPrpDivCd'] ?? '',

          rqestNo: data[i]['rqestNo'] ?? '',
          invstgDe: data[i]['invstgDe'] ?? '',
          accdtInvstgSqnc: data[i]['accdtInvstgSqnc'] ?? '',

          ownerNo: data[i]['ownerNo'] ?? '',
          posesnDivCd: data[i]['posesnDivCd'] ?? '',
          ownerNm: data[i]['ownerNm'] ?? '',
          ownerRgsbukAddr: data[i]['ownerRgsbukAddr'] ?? '',
          posesnShreNmrtrInfo: data[i]['posesnShreNmrtrInfo'] ?? '',
          posesnShreDnmntrInfo: data[i]['posesnShreDnmntrInfo'] ?? '',

          apasmtReqestDivCd: data[i]['apasmtReqestDivCd'] ?? '',
          apasmtSqnc: data[i]['apasmtSqnc'] ?? 0,
          prcPnttmDe: data[i]['prcPnttmDe'] ?? '',

          apasmtInsttNm1: data[i]['apasmtInsttNm1'] ?? '',
          apasmtInsttEvlUpc1: data[i]['apasmtInsttEvlUpc1'] ?? 0,
          apasmtInsttEvamt1: data[i]['apasmtInsttEvamt1'] ?? 0,

          apasmtInsttNm2: data[i]['apasmtInsttNm2'] ?? '',
          apasmtInsttEvlUpc2: data[i]['apasmtInsttEvlUpc2'] ?? '',
          apasmtInsttEvamt2: data[i]['apasmtInsttEvamt2'] ?? '',

          apasmtInsttNm3: data[i]['apasmtInsttNm3'] ?? '',
          apasmtInsttEvlUpc3: data[i]['apasmtInsttEvlUpc3'] ?? '',
          apasmtInsttEvamt3: data[i]['apasmtInsttEvamt3'] ?? '',

          cmpnstnCmptnUpc: data[i]['cmpnstnCmptnUpc'] ?? 0,
          cpsmnCmptnAmt: data[i]['cpsmnCmptnAmt'] ?? 0,

          caPymntRequstDe: data[i]['caPymntRequstDe'] ?? '',
          cmpnstnDscssUpc: data[i]['cmpnstnDscssUpc'] ?? 0,
          cmpnstnDscssTotAmt: data[i]['cmpnstnDscssTotAmt'] ?? 0,

          dcsUpc: data[i]['dcsUpc'] ?? '',
          dcsAmt: data[i]['dcsAmt'] ?? '',
          dcsDt: data[i]['dcsDt'] ?? '',
          aceptncUseBeginDe: data[i]['aceptncUseBeginDe'] ?? '',
          ldPymntRequstDe: data[i]['ldPymntRequstDe'] ?? '',
          ldCpsmnPymntLdgmntDivCd: data[i]['ldCpsmnPymntLdgmntDivCd'] ?? '',

          proUpc: data[i]['proUpc'] ?? '',
          proAmt: data[i]['proAmt'] ?? '',
          proDt: data[i]['proDt'] ?? '',
          proPymntRequstDe: data[i]['proPymntRequstDe'] ?? '',
          proCpsmnPymntLdgmntDivCd: data[i]['proCpsmnPymntLdgmntDivCd'] ?? '',

        ));
      }

      obstSttusInqireDataSource.value = ObstSttusInqireDatasource(items: res);

    }

    obstSttusInqireColumns.value = [];

    obstSttusInqireColumns.value = [
      gridColumn('lgdongNm', '소재지', width: 250),
      gridColumn('lcrtsDivCd', '특지', width: 60),
      gridColumn('mlnoLtno', '본번', width: 60),
      gridColumn('slnoLtno', '부번', width: 60),

      gridColumn('cmpnstnStepDivCd', '진행단계', width: 100),
      gridColumn('acqsPrpDivCd', '취득용도', width: 100),

      gridColumn('rqestNo', '수용/사용',isVisble: isSttusInqireGridTab1.value, width: 80),
      gridColumn('invstgDe', '조사일', isVisble: isSttusInqireGridTab1.value, width: 80),
      gridColumn('accdtInvstgSqnc', '조사차수', isVisble: isSttusInqireGridTab1.value, width: 80),

      gridColumn('ownerNo', '소유자번호', isVisble: isSttusInqireGridTab2.value, width: 80),
      gridColumn('posesnDivCd', '구분', isVisble: isSttusInqireGridTab2.value, width: 80),
      gridColumn('ownerNm', '소유자명', isVisble: isSttusInqireGridTab2.value, width: 80),
      gridColumn('ownerRgsbukAddr', '등기부주소', isVisble: isSttusInqireGridTab2.value, width: 80),
      gridColumn('posesnShreNmrtrInfo', '분자', isVisble: isSttusInqireGridTab2.value, width: 80),
      gridColumn('posesnShreDnmntrInfo', '분모', isVisble: isSttusInqireGridTab2.value, width: 80),

      gridColumn('apasmtReqestDivCd', '평가구분', isVisble: isSttusInqireGridTab3.value, width: 80),
      gridColumn('apasmtSqnc', '평가차수', isVisble: isSttusInqireGridTab3.value, width: 80),
      gridColumn('prcPnttmDe', '가격시점', isVisble: isSttusInqireGridTab3.value, width: 80),

      // a평가법인
      gridColumn('apasmtInsttNm1', '법인명', isVisble: isSttusInqireGridTab3.value, width: 80),
      gridColumn('apasmtInsttEvlUpc1', '단가', isVisble: isSttusInqireGridTab3.value , width: 80),
      gridColumn('apasmtInsttEvlAmt1', '금액', isVisble: isSttusInqireGridTab3.value , width: 80),

      // b평가법인
      gridColumn('apasmtInsttNm2', '법인명', isVisble: isSttusInqireGridTab3.value , width: 80),
      gridColumn('apasmtInsttEvlUpc2', '단가', isVisble: isSttusInqireGridTab3.value , width: 80),
      gridColumn('apasmtInsttEvlAmt2', '금액', isVisble: isSttusInqireGridTab3.value , width: 80),

      // c평가법인
      gridColumn('apasmtInsttNm3', '법인명', isVisble: isSttusInqireGridTab3.value, width: 80),
      gridColumn('apasmtInsttEvlUpc3', '단가', isVisble: isSttusInqireGridTab3.value, width: 80),
      gridColumn('apasmtInsttEvlAmt3', '금액', isVisble: isSttusInqireGridTab3.value, width: 80),

      // 보상비산정
      gridColumn('cmpnstnCmptnUpc', '산정단가', isVisble: isSttusInqireGridTab4.value, width: 80),
      gridColumn('cpsmnCmptnAmt', '산정금액', isVisble: isSttusInqireGridTab4.value, width: 80),

      // 보상비지급
      gridColumn('caPymntRequstDe', '지급요청일', isVisble: isSttusInqireGridTab5.value, width: 80),
      gridColumn('cmpnstnDscssUpc', '지급단가', isVisble: isSttusInqireGridTab5.value, width: 80),
      gridColumn('cmpnstnDscssTotAmt', '지급금액', isVisble: isSttusInqireGridTab5.value, width: 80),

      // 수용재결
      gridColumn('dcsUpc', '재결단가', isVisble: isSttusInqireGridTab6.value, width: 80),
      gridColumn('dcsAmt', '재결금액', isVisble: isSttusInqireGridTab6.value, width: 80),
      gridColumn('dcsDt', '재결일자', isVisble: isSttusInqireGridTab6.value, width: 80),
      gridColumn('aceptncUseBeginDe', '수용/사용개시일', isVisble: isSttusInqireGridTab6.value, width: 80),
      gridColumn('ldPymntRequstDe', '지급요청일자', isVisble: isSttusInqireGridTab6.value, width: 80),
      gridColumn('ldCpsmnPymntLdgmntDivCd', '지급/공탁', isVisble: isSttusInqireGridTab6.value, width: 80),

      // 이의재결
      gridColumn('proUpc', '재결단가', isVisble: isSttusInqireGridTab7.value, width: 80),
      gridColumn('proAmt', '재결금액', isVisble: isSttusInqireGridTab7.value, width: 80),
      gridColumn('proDt', '재결일자', isVisble: isSttusInqireGridTab7.value, width: 80),
      gridColumn('proPymntRequstDe', '지급요청일자', isVisble: isSttusInqireGridTab7.value, width: 80),
      gridColumn('proCpsmnPymntLdgmntDivCd', '지급/공탁', isVisble: isSttusInqireGridTab7.value, width: 80),
    ];


  }

  // [통계정보 > 취득용도] 조회
  fetchAcqsPrpDivCdDataSource() async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/lssom/selectAcqsPrp.do');

    var response = await http.post(url);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      debugPrint('fetchAcqsPrpDivCdDataSource > data : $data');

      DialogUtil.showBottomSheet(Get.context!, '취득용도', Container(
        height: 500.h,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index]['cmmnCdNm']),
              onTap: () {
                sttusInqireAcqstnPrpsController.text = data[index]['cmmnCdNm'];
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
        'http://222.107.22.159:18080/lp/lssom/selectLandAccdtInvstgSqnc.do');

    var param = {
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    };
    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      debugPrint('fetchLadSttusInqireSqncDataSource > data : $data');

      DialogUtil.showBottomSheet(Get.context!, '조사 차수', Container(
        height: 500.h,
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              //title: Text(data[index]['accdtInvstgSqnc']),
              title: Text('${data[index]['accdtInvstgSqnc']}차'),
              onTap: () {
                sttusInqireBsnsSqncController.text = data[index]['accdtInvstgSqnc'].toString();
                Get.back();
              },
            );
          },
        ),
      ));
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
                    CustomTextField(
                      controller: orderAutoController,
                      hintText: orderAutoController.text,
                      isPassword: false,
                      isReadOnly: true,
                      textColor: tableTextColor,
                      onChanged: (value) {
                        debugPrint('orderAutoController : $value');
                      },
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
                    CustomTextField(
                      controller: orderStartDtController,
                      hintText: orderStartDtController.text,
                      isPassword: false,
                      isReadOnly: true,
                      textColor: tableTextColor,
                      onChanged: (value) {
                        debugPrint('orderAutoController : $value');
                      },
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
                          debugPrint('start dt : $value');
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
                      CustomTextField(
                        controller: orderEndDtController,
                        hintText: orderEndDtController.text,
                        isPassword: false,
                        isReadOnly: true,
                        textColor: tableTextColor,
                        onChanged: (value) {
                          debugPrint('orderAutoController : $value');
                        },
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
                            debugPrint('start dt : $value');
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
                        },
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
                  return DialogUtil.showSnackBar(Get.context!, '실태조사', '시작일을 입력해주세요.');
                }

                if (orderEndDtController.text == "") {
                  return DialogUtil.showSnackBar(Get.context!, '실태조사', '종료일을 입력해주세요.');
                }

                DialogUtil.showAlertDialog(
                  Get.context!,
                  1.w > 1.h ? 960 : 1800,
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
                              CustomBsnsBadge(text: BsnsController.to.selectBsnsPlan.value.bsnsDivLclsCd ?? '', bgColor: Color(0xFFEFF5FF), textColor: Color(0xFF1D58BC)),
                              SizedBox(width: 6.w),
                              CustomBsnsBadge(text: BsnsController.to.selectBsnsPlan.value.bsnsDivMclsCd ?? '', bgColor: Color(0xFFFFF1E4), textColor: Color(0xFFFF8000)),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            child: Column(
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
                                            text: '(${selectBsnsPlan.value.bsnsNo}) ',
                                            style: TextStyle(
                                              color: Color(0xFF1D1D1D),
                                              fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          TextSpan(
                                            text: selectBsnsPlan.value.bsnsNm ?? '',
                                            style: TextStyle(
                                              color: Theme.of(Get.context!).colorScheme.primary,
                                              fontSize: 1.w > 1.h ? 32.sp : 52.sp,
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
                                      decoration: BoxDecoration(color: Color(0xFFD8D8D8)),
                                    ),
                                    SizedBox(width: 20.w),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '${orderAutoController.text}',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 1.w > 1.h ? 32.sp : 52.sp,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '차조사',
                                            style: TextStyle(
                                              color: Color(0xFF1D1D1D),
                                              fontSize: 1.w > 1.h ? 32.sp : 52.sp,
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
                                    fontSize: 1.w > 1.h ? 30.sp : 50.sp,
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
                          ),
                        ],
                      )
                    ],
                  ),
                  onOk: () {
                    debugPrint('실태조사 시작');
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
    debugPrint('searchBsnsName : $value');
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 200), () async {
      if (value.isEmpty) {
        searchBsnsPlanList.value = bsnsPlanList;
      } else {
        searchBsnsPlanList.value = bsnsPlanList.where((element) => element.bsnsNm?.contains(value) ?? false).toList();
        debugPrint('serachBsnsPlanList : $searchBsnsPlanList');

      }
    });
  }

  /// [차수 자동 입력]
  autoSqnc() async {

    var url = 'http://222.107.22.159:18080/lp/bsns/selectAccdtInvstgSqnc.do';
        //'?shBsnsNo=2101&shBsnsZoneNo=2';

    debugPrint('shBsnsNo : ${selectedBsnsSelectArea.value.bsnsNo}');
    debugPrint('shBsnsZoneNo : ${selectedBsnsSelectArea.value.bsnsZoneNo}');

    var response = await http.post(Uri.parse(url), body: {
      'shBsnsNo': selectedBsnsSelectArea.value.bsnsNo.toString(),
      'shBsnsZoneNo': selectedBsnsSelectArea.value.bsnsZoneNo.toString(),
    });
    debugPrint('response : ${response.statusCode}');

    var responseUrl = response.request!.url;
    debugPrint('responseUrl : $responseUrl');

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      debugPrint('fetchBsnsSelectAreaGridDataSource > data : $data');

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

      if(bsnsAccdtinvstgSqncModel.isEmpty) {
        orderAutoController.text = '1';
      } else {
        num lastSqnc = bsnsAccdtinvstgSqncModel.first.accdtInvstgSqnc ?? 0 + 1;
        debugPrint('lastSqnc : $lastSqnc');

        num last = lastSqnc == 0 ? 1 : lastSqnc + 1;

        orderAutoController.text = last.toString();
      }

      bsnsAccdtinvstgSqncDataSource.value = BsnsAccdtinvstgSqncDatasource(items: bsnsAccdtinvstgSqncModel);

    } else {
      debugPrint('error');
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
    debugPrint('ladSttusInqireTabIsSelected : $sttusInqireTabIsSelected');

  }

  void addBsns() {
    DialogUtil.showAlertDialog(Get.context!, 0, '토지 현실이용현황 조회 및 입력',
    widget: SizedBox(
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
                        fontSize: 15.sp,
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
                                  debugPrint('orderController : $value');
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
                          fontSize: 15.sp,
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
                                    debugPrint('orderController : $value');
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
                          fontSize: 15.sp,
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
                                    debugPrint('orderController : $value');
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