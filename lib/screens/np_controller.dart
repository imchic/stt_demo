import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ldi/screens/useprmisn/model/use_prmisn_cancl_aprv_model.dart';
import 'package:ldi/screens/useprmisn/use_prmisn_cancl_aprv_detail_model_datasource.dart';
import 'package:ldi/screens/useprmisn/use_prmisn_cancl_aprv_doc_model_datasource.dart';
import 'package:ldi/screens/useprmisn/use_prmisn_cancl_aprv_model_datasource.dart';
import 'package:ldi/utils/dialog_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../utils/applog.dart';

import 'package:http/http.dart' as http;

import 'useprmisn/model/use_prmisn_cancl_aprv_detail_model.dart';
import 'useprmisn/model/use_prmisn_cancl_aprv_doc_model.dart';

class NpController extends GetxController with GetTickerProviderStateMixin {

  static NpController get to => Get.find();

  RxBool isDrawerOpen = false.obs; // 드로어 오픈 여부

  late PageController pageController; // 페이지 컨트롤러


  // 사용허가 조회
  late DataGridController usePrmisnCanclAprvDataGridController;
  final usePrmisnCanclAprvModelDataSource = UsePrmisnCanclAprvModelDataSource(items: []).obs;

  // 신청자정보별 허가 상세현황
  late DataGridController usePrmisnCanclAprvDetailDataGridController;
  final usePrmisnCanclAprvDetailModelDataSource = UsePrmisnCanclAprvDetailModelDataSource(items: []).obs;

  // 신청자정보별 허가 상세현황 공문
  late DataGridController usePrmisnCanclAprvDocDataGridController;
  final usePrmisnCanclAprvDocModelDataSource = UsePrmisnCanclAprvDocModelDataSource(items: []).obs;

  RxInt selectedIndex = 0.obs;
  RxList<String> leftNavItems = ['필지선택', '신청/점유\n(사용)자\n현황'].obs;

  late TabController tabController1;
  final tabItems1 = [
    Tab(text: '허가정보'),
    Tab(text: '무단 점유정보'),
    Tab(text: '신규 무단점유'),
  ];

  @override
  Future<void> onInit() async {
    super.onInit();
    pageController = PageController();

    tabController1 = TabController(length: tabItems1.length, vsync: this);

    usePrmisnCanclAprvDataGridController = DataGridController();
    usePrmisnCanclAprvDetailDataGridController = DataGridController();

    await fetchUsePrmisnCanclAprvList();

  }


  // [허가정보] > 신청정보
  fetchUsePrmisnCanclAprvList() async {

    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/nupcm/selectUseRqstMng.do');

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

    }
  }

  // [허가정보] > 신청자정보
  fetchUsePrmisnCanclAprvDetailList(plotUseNo) async {
    var url = Uri.parse(
        'http://222.107.22.159:18080/lp/nupcm/selectUseRqstPlot.do');

    var param = {
      'plotUseNo': plotUseNo
    };

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
        'http://222.107.22.159:18080/lp/nupcm/selectSanctnDocInfo.do');

    var param = {
      'plotUseNo': plotUseNo
    };

    AppLog.d('plotUseNo > param : $param');

    var response = await http.post(url, body: param);

    if (response.statusCode == 200) {
      var data = JsonDecoder().convert(response.body)['list'];
      AppLog.d('fetchUsePrmisnCanclAprvDetailDocList > data : $data');

      var length = data.length;
      var list = <UsePrmisnCanclAprvDocModel>[];

      usePrmisnCanclAprvDocDataSourceKeyValue(data, list, length);

      if (list.isEmpty) {
        DialogUtil.showSnackBar(
            Get.context!,
            '알림',
            '공문이 없습니다.');
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

}