import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:ldi/utils/dialog_util.dart';

class ApiConnect extends GetConnect {
  final String baseUrl = 'https://dldm.kwater.or.kr/';

  // init
  @override
  void onInit() {
    // baseUrl
    httpClient.baseUrl = baseUrl;
    // timeout
    httpClient.timeout = Duration(seconds: 10);

    // cors 해제
    httpClient.addRequestModifier((Request request) async {
      request.headers['Access-Control-Allow-Origin'] = '*';
      request.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS';
      request.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, X-Auth-Token';
      return request;
    });
  }

  /**
   * [사업선택] 사업목록 조회
   */
  Future<Response> fetchBsnsList() async {
    final response = await post('/lp/bsns/selectBsnsPlan.do', {});
    if (response.status.hasError) {
      DialogUtil.showSnackBar(Get.context!, 'error', 'error');
      return Future.error(response.statusText ?? 'error');
    } else {
      return response;
    }
  }

  /**
   * [사업선택] 사업구역 선탵ㄱ
   */
  Future<Response> fetchBsnsSelectAreaGridDataSource(bsnsNo) async {
    // using query
    final response = await post(
        '/lp/bsns/selectBsnsZone.do', {'bsnsNo': bsnsNo},
        query: {'bsnsNo': bsnsNo});

    if (response.status.hasError) {
      DialogUtil.showSnackBar(Get.context!, 'error', 'error');
      return Future.error(response.statusText ?? 'error');
    } else {
      return response;
    }
  }

  /**
   * [사업선택] 사업구역 내 차수 조회
   */

  Future<Response> fetchBsnsSelectAreaGetSqncDataSource(
      bsnsNo, bsnsZoneNo) async {
    final response = await post('/lp/bsns/selectAccdtInvstgSqnc.do',
        {'shBsnsNo': bsnsNo, 'shBsnsZoneNo': bsnsZoneNo},
        query: {'shBsnsNo': bsnsNo, 'shBsnsZoneNo': bsnsZoneNo});

    if (response.status.hasError) {
      DialogUtil.showSnackBar(Get.context!, 'error', 'error');
      return Future.error(response.statusText ?? 'error');
    } else {
      return response;
    }
  }

  /**
   * 취득용도 목록 조회
   */

  Future<Response> fetchAcqPrpList() async {
    final response = await post('/lp/lssom/selectAcqsPrp.do', {});

    if (response.status.hasError) {
      DialogUtil.showSnackBar(Get.context!, 'error', 'error');
      return Future.error(response.statusText ?? 'error');
    } else {
      return response;
    }
  }

  /**
   * 조사 차수 목록
   */
  Future<Response> fetchAccdtInvstgSqncList(
      {String? shbsnsNo, String? shbsnsZoneNo}) async {
    final response = await post('/lp/lssom/selectAccdtInvstgSqnc.do',
        {'shBsnsNo': shbsnsNo, 'shBsnsZoneNo': shbsnsZoneNo},
        query: {'shBsnsNo': shbsnsNo, 'shBsnsZoneNo': shbsnsZoneNo});

    if (response.status.hasError) {
      DialogUtil.showSnackBar(Get.context!, 'error', 'error');
      return Future.error(response.statusText ?? 'error');
    } else {
      return response;
    }
  }

  /**
   * 보상 진행 단계 목록
   */
  Future<Response> fetchCmpnstnStepList() async {
    final response = await post('/lp/lssom/selectCmpnstnStep.do', {});

    if (response.status.hasError) {
      DialogUtil.showSnackBar(Get.context!, 'error', 'error');
      return Future.error(response.statusText ?? 'error');
    } else {
      return response;
    }
  }

  /**
   * 감정평가구분 목록
   */

  Future<Response> fetchApasmtReqestList() async {
    final response = await post('/lp/lssom/selectApasmtReqest.do', {});

    if (response.status.hasError) {
      DialogUtil.showSnackBar(Get.context!, 'error', 'error');
      return Future.error(response.statusText ?? 'error');
    } else {
      return response;
    }
  }

  /**
   * 토지 감정평가차수 목록
   */

  Future<Response> fetchLandApasmtSqncList(shbsnsNo, shbsnsZoneNo) async {
    final response = await post('/lp/lssom/selectLandApasmtSqnc.do', {
      'shBsnsNo': shbsnsNo.toString(),
      'shBsnsZoneNo': shbsnsZoneNo.toString()
    }, query: {
      'shBsnsNo': shbsnsNo.toString(),
      'shBsnsZoneNo': shbsnsZoneNo.toString()
    });

    if (response.status.hasError) {
      DialogUtil.showSnackBar(Get.context!, 'error', 'error');
      return Future.error(response.statusText ?? 'error');
    } else {
      return response;
    }
  }

  /**
   * 지장물 감정평가차수 목록
   */

  Future<Response> fetchObstApasmtSqncList(shbsnsNo, shbsnsZoneNo) async {
    final response = await post('/lp/lssom/selectObstApasmtSqnc.do', {
      'shBsnsNo': shbsnsNo.toString(),
      'shBsnsZoneNo': shbsnsZoneNo.toString()
    }, query: {
      'shBsnsNo': shbsnsNo.toString(),
      'shBsnsZoneNo': shbsnsZoneNo.toString()
    });

    if (response.status.hasError) {
      DialogUtil.showSnackBar(Get.context!, 'error', 'error');
      return Future.error(response.statusText ?? 'error');
    } else {
      return response;
    }
  }

  /**
   * 지장물 구분 목록
   */
  Future<Response> fetchObstDivList() async {
    final response = await post('/lp/lssom/selectObstSe.do', {});

    if (response.status.hasError) {
      DialogUtil.showSnackBar(Get.context!, 'error', 'error');
      return Future.error(response.statusText ?? 'error');
    } else {
      return response;
    }
  }

}
