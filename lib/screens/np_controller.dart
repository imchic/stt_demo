import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ldm/screens/useprmisn/model/use_prmisn_cancl_aprv_model.dart';
import 'package:ldm/screens/useprmisn/use_prmisn_cancl_aprv_detail_model_datasource.dart';
import 'package:ldm/screens/useprmisn/use_prmisn_cancl_aprv_doc_model_datasource.dart';
import 'package:ldm/screens/useprmisn/use_prmisn_cancl_aprv_model_datasource.dart';
import 'package:ldm/screens/wtwkAccdtInvstg/model/wtwkAccdtInvstg_model.dart';
import 'package:ldm/screens/wtwkAccdtInvstg/model/wtwkAccdtlnvstg_thing_model.dart';
import 'package:ldm/screens/wtwkAccdtInvstg/wtwkaccdtinvstg_model_datasource.dart';
import 'package:ldm/screens/wtwkAccdtInvstg/wtwkaccdtinvstg_thing_model_datasource.dart';
import 'package:ldm/utils/dialog_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../utils/applog.dart';

import 'package:http/http.dart' as http;

import '../utils/common_util.dart';
import 'useprmisn/model/use_prmisn_cancl_aprv_detail_model.dart';
import 'useprmisn/model/use_prmisn_cancl_aprv_doc_model.dart';

class NpController extends GetxController with GetTickerProviderStateMixin {
  static NpController get to => Get.find();

  RxBool isDrawerOpen = false.obs; // 드로어 오픈 여부

  late PageController pageController; // 페이지 컨트롤러

  RxString selectPlotUseNo = ''.obs;
  RxString selectedladSeq = ''
      .obs; // 필지선택 > 신청자정보별 허가 상세현황 > 신청자정보별 허가 상세현황 토지순번
  RxString selectRqstSeq = ''
      .obs; // 필지선택 > 신청자정보별 허가 상세현황 > 신청자정보별 허가 상세현황 신청순번

  List<File> files = <File>[];
  RxList<Image> wtwkAccdtInvstgImages = <Image>[].obs;

  // 사용허가 조회
  late DataGridController usePrmisnCanclAprvDataGridController;
  final usePrmisnCanclAprvModelDataSource =
      UsePrmisnCanclAprvModelDataSource(items: []).obs;

  // 신청자정보별 허가 상세현황
  late DataGridController usePrmisnCanclAprvDetailDataGridController;
  final usePrmisnCanclAprvDetailModelDataSource =
      UsePrmisnCanclAprvDetailModelDataSource(items: []).obs;

  // 신청자정보별 허가 상세현황 공문
  late DataGridController usePrmisnCanclAprvDocDataGridController;
  final usePrmisnCanclAprvDocModelDataSource =
      UsePrmisnCanclAprvDocModelDataSource(items: []).obs;

  // 무단점유 조회
  late DataGridController wtwkAccdtInvstgDataGridController;
  final wtwkAccdtInvstgModelDataSource =
      WtwkAccdtinvstgModelDatasource(items: []).obs;

  // 무단점유 설치물 조회
  late DataGridController wtwkAccdtInvstgThingInfoDataGridController;
  final wtwkAccdtInvstgThingInfoModelDataSource =
      WtwkaccdtinvstgThingModelDatasource(items: []).obs;

  RxInt selectedIndex = 0.obs;
  RxList<String> leftNavItems = ['필지선택', '신청/점유\n(사용)자\n현황'].obs;

  late TabController tabController1;
  final tabItems1 = [
    Tab(text: '허가정보'),
    Tab(text: '무단 점유정보'),
    Tab(text: '실태조사'),
  ];

  late TextEditingController wtwkAccdtInvstgEndDtController;
  late TextEditingController wtwkAccdtInvstgOccpntNmController;
  late TextEditingController wtwkAccdtInvstgOccpntAdresController;
  late TextEditingController wtwkAccdtInvstgOccpntAraController;
  late TextEditingController wtwkAccdtInvstgOccpntPurpsController;
  late TextEditingController wtwkAccdtInvstgOccpntStrtDtController;
  late TextEditingController wtwkAccdtInvstgOccpntEndDtController;
  late TextEditingController wtwkAccdtInvstgOccpntDtlController;
  late TextEditingController wtwkAccdtInvstgOccpntRmrkController;
  late TextEditingController wtwkAccdtInvstgEtcRmrkController;

  late TextEditingController wtwkAccdtInvstgNewOccpntNmController;
  late TextEditingController wtwkAccdtInvstgNewOccpntTelnoController;

  late TextEditingController wtwkAccdtInvstgUseOccpntNmController;
  late TextEditingController wtwkAccdtInvstgUseOccpntRgtNoController;
  late TextEditingController wtwkAccdtInvstgUseOccpntBizrNoController;
  late TextEditingController wtwkAccdtInvstgUseOccpntTelnoController;
  late TextEditingController wtwkAccdtInvstgUseOccpntCellNoController;
  late TextEditingController wtwkAccdtInvstgUseOccpntAdresController;
  late TextEditingController wtwkAccdtInvstgUseOccpntRmrkController;

  RxString wtwkAccdtInvstgOccpntNm = ''.obs;
  RxString wtwkAccdtInvstgOccpntAdres = ''.obs;
  RxString wtwkAccdtInvstgOccpntAra = ''.obs;
  RxString wtwkAccdtInvstgOccpntPurps = ''.obs;
  RxString wtwkAccdtInvstgOccpntStrtDt = ''.obs;
  RxString wtwkAccdtInvstgOccpntEndDt = ''.obs;
  RxString wtwkAccdtInvstgOccpntDtl = ''.obs;
  RxString wtwkAccdtInvstgOccpntRmrk = ''.obs;
  RxString wtwkAccdtInvstgEtcRmrk = ''.obs;

  RxString wtwkAccdtInvstgNewOccpntNm = ''.obs;
  RxString wtwkAccdtInvstgNewOccpntTelno = ''.obs;

  RxString wtwkAccdtInvstgUseOccpntNm = ''.obs;
  RxString wtwkAccdtInvstgUseOccpntRgtNo = ''.obs;
  RxString wtwkAccdtInvstgUseOccpntBizrNo = ''.obs;
  RxString wtwkAccdtInvstgUseOccpntTelno = ''.obs;
  RxString wtwkAccdtInvstgUseOccpntCellNo = ''.obs;
  RxString wtwkAccdtInvstgUseOccpntAdres = ''.obs;
  RxString wtwkAccdtInvstgUseOccpntRmrk = ''.obs;

  RxBool wtwkAccdtInvstgUseOccpntPsnlInfoAgreYn = false.obs;

  SfSignaturePad signaturePad = SfSignaturePad();
  late SfSignaturePadState signaturePadState;
  GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey<SfSignaturePadState>();

  late Uint8List? wtwkAccdtInvstgUseOccpntSign;

  // obx uint8list
  Rx<Uint8List> wtwkAccdtInvstgUseOccpntSignRx = Uint8List(0).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    pageController = PageController();

    tabController1 = TabController(length: tabItems1.length, vsync: this);

    signatureGlobalKey = GlobalKey<SfSignaturePadState>();
    signaturePad = SfSignaturePad(
      key: signatureGlobalKey,
      backgroundColor: Colors.white,
      strokeColor: Colors.black,
      minimumStrokeWidth: 1,
      maximumStrokeWidth: 4,
    );

    wtwkAccdtInvstgUseOccpntSign = Uint8List(0);
    wtwkAccdtInvstgUseOccpntSignRx.value = wtwkAccdtInvstgUseOccpntSign!;

    usePrmisnCanclAprvDataGridController = DataGridController();
    usePrmisnCanclAprvDetailDataGridController = DataGridController();
    wtwkAccdtInvstgDataGridController = DataGridController();
    wtwkAccdtInvstgThingInfoDataGridController = DataGridController();

    wtwkAccdtInvstgEndDtController = TextEditingController();
    wtwkAccdtInvstgOccpntNmController = TextEditingController();
    wtwkAccdtInvstgOccpntAdresController = TextEditingController();
    wtwkAccdtInvstgOccpntAraController = TextEditingController();
    wtwkAccdtInvstgOccpntPurpsController = TextEditingController();
    wtwkAccdtInvstgOccpntStrtDtController = TextEditingController();
    wtwkAccdtInvstgOccpntEndDtController = TextEditingController();
    wtwkAccdtInvstgOccpntDtlController = TextEditingController();
    wtwkAccdtInvstgOccpntRmrkController = TextEditingController();
    wtwkAccdtInvstgEtcRmrkController = TextEditingController();

    wtwkAccdtInvstgNewOccpntNmController = TextEditingController();
    wtwkAccdtInvstgNewOccpntTelnoController = TextEditingController();

    wtwkAccdtInvstgUseOccpntNmController = TextEditingController();
    wtwkAccdtInvstgUseOccpntRgtNoController = TextEditingController();
    wtwkAccdtInvstgUseOccpntBizrNoController = TextEditingController();
    wtwkAccdtInvstgUseOccpntTelnoController = TextEditingController();
    wtwkAccdtInvstgUseOccpntCellNoController = TextEditingController();
    wtwkAccdtInvstgUseOccpntAdresController = TextEditingController();
    wtwkAccdtInvstgUseOccpntRmrkController = TextEditingController();


    await fetchUsePrmisnCanclAprvList();
    await fetchWtwkAccdtInvstgList('01');

    tabController1.addListener(() {
      if (tabController1.index == 1) {
        AppLog.d('tabController1.index : ${tabController1.index}');
      }
    });
  }

  // [허가정보] > 신청정보
  fetchUsePrmisnCanclAprvList() async {

    var url =
    Uri.parse('${CommonUtil.BASE_URL}/lp/nupcm/selectUseRqstMng.do');

    var param = {};

    AppLog.d('fetchUsePrmisnCanclAprvList > param : $param');

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchUsePrmisnCanclAprvDataSource > data : $data');

      var length = data.length;
      var list = <UsePrmisnCanclAprvModel>[];

      usePrmisnCanclAprvDataSourceKeyValue(data, list, length);

      usePrmisnCanclAprvModelDataSource.value =
          UsePrmisnCanclAprvModelDataSource(items: list);

    } else {
      Get.back();
    }
  }

  // [허가정보] > 신청자정보
  fetchUsePrmisnCanclAprvDetailList(plotUseNo) async {
    var url =
    Uri.parse('${CommonUtil.BASE_URL}/lp/nupcm/selectUseRqstPlot.do');

    var param = {'plotUseNo': plotUseNo};

    AppLog.d('plotUseNo > param : $param');

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchUsePrmisnCanclAprvDetailDataSource > data : $data');

      var length = data.length;
      var list = <UsePrmisnCanclAprvDetailModel>[];

      usePrmisnCanclAprvDetailDataSourceKeyValue(data, list, length);

      usePrmisnCanclAprvDetailModelDataSource.value =
          UsePrmisnCanclAprvDetailModelDataSource(items: list);
    }
  }

  // [허가정보] > 신청자정보 > 공문조회
  fetchUsePrmisnCanclAprvDocList(plotUseNo) async {
    var url = Uri.parse(
        '${CommonUtil.BASE_URL}/lp/nupcm/selectSanctnDocInfo.do');

    // 대지사용번호
    var param = {'plotUseNo': plotUseNo};

    AppLog.d('plotUseNo > param : $param');

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchUsePrmisnCanclAprvDetailDocList > data : $data');

      var length = data.length;
      var list = <UsePrmisnCanclAprvDocModel>[];

      usePrmisnCanclAprvDocDataSourceKeyValue(data, list, length);

      if (list.isEmpty) {
        DialogUtil.showSnackBar(Get.context!, '알림', '공문이 없습니다.');
      } else {
        DialogUtil.showBottomSheet(
            Get.context!,
            '공문조회',
            Container(
              height: 500.h,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(list[index].sanctnDocNm.toString()),
                    subtitle: Text(list[index].sanctnDocNo.toString()),
                    onTap: () {
                      Get.back();
                    },
                  );
                },
              ),
            ));
      }

      // usePrmisnCanclAprvDocModelDataSource.value =
      //     UsePrmisnCanclAprvDocModelDataSource(items: list);
    }
  }

  // [무단 점유정보]
  fetchWtwkAccdtInvstgList(shLadBtypDivCd) async {
    // Future.delayed(Duration(milliseconds: 100), () {
    //   DialogUtil.showLoading(Get.context!);
    // });

    var url = Uri.parse(
        '${CommonUtil.BASE_URL}/lp/nwum/selectWtwkAccdtInvstgChck.do');

    var param = {'shLadBtypDivCd': shLadBtypDivCd};

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchWtwkAccdtInvstgList > data : $data');

      var length = data.length;
      var list = <WtwkaccdtinvstgModel>[];

      wpmDataSourceKeyValue(data, list, length);

      wtwkAccdtInvstgModelDataSource.value =
          WtwkAccdtinvstgModelDatasource(items: list);
    }
  }

  // [무단 점유 설치물 정보]
  /// [plotUseNo] 필지선택 > 신청자정보별 허가 상세현황 > 신청자정보별 허가 상세현황 대지사용번호
  /// [ladSeq] 필지선택 > 신청자정보별 허가 상세현황 > 신청자정보별 허가 상세현황 토지순번
  /// [rqstSeq] 필지선택 > 신청자정보별 허가 상세현황 > 신청자정보별 허가 상세현황 신청순번
  fetchWtwkAccdtInvstgThingInfoList(plotUseNo, ladSeq, rqstSeq) async {
    var url = Uri.parse(
        '${CommonUtil.BASE_URL}/lp/nwum/selectUseInstThingInfo.do');

    var param = {
      'plotUseNo': plotUseNo.toString(),
      'ladSeq': ladSeq.toString(),
      'rqstSeq': rqstSeq.toString()
    };

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchWtwkAccdtInvstgThingInfoList > data : $data');

      var length = data.length;
      var list = <WtwkaccdtinvstgThingModel>[];

      wpmThingDataSourceKeyValue(data, list, length);

      wtwkAccdtInvstgThingInfoModelDataSource.value =
          WtwkaccdtinvstgThingModelDatasource(items: list);

      Get.back();
    }
  }

  takePhoto() async {

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50, maxHeight: 480, maxWidth: 640);

    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      final String fileName = file.path.split('/').last;
      final String filePath = file.path;

      AppLog.d('fileName : $fileName');
      AppLog.d('filePath : $filePath');

      await Future.delayed(Duration(seconds: 1));

      // 사진 미리보기
      final image = Image.file(file);
      DialogUtil.showAlertDialog(Get.context!, 1040, '사진촬영', widget: image, onOk: () async {
        wtwkAccdtInvstgImages.add(image);
        files.add(file);
      }, onCancel: () {
        Get.back();
      });

      // 파일 업로드
      // final response = await FileUploadService.uploadFile(filePath, fileName);
      // AppLog.d('response : $response');
      //
      // if (response != null) {
      //   DialogUtil.showSnackBar(Get.context!, '사진촬영', '사진을 촬영하였습니다.');
      // } else {
      //   DialogUtil.showSnackBar(Get.context!, '사진촬영', '사진을 촬영하지 못했습니다.');
      // }

    } else {
      DialogUtil.showSnackBar(Get.context!, '사진촬영', '사진을 촬영하지 않았습니다.');
    }
  }

}
