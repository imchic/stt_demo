import 'package:get/get.dart';
import 'package:ldi/utils/dialog_util.dart';

class ApiConnect extends GetConnect {
  final String baseUrl = 'http://222.107.22.159:18080/';

  // init
  @override
  void onInit() {
    // baseUrl
    httpClient.baseUrl = baseUrl;
    // timeout
    httpClient.timeout = Duration(seconds: 10);
  }

  /// [사업선택] 사업목록 조회
  Future<Response> fetchBsnsList() async {
    final response = await post('/lp/bsns/selectBsnsPlan.do', {});
    if (response.status.hasError) {
      DialogUtil.showSnackBar(Get.context!, 'error', 'error');
      return Future.error(response.statusText ?? 'error');
    } else {
      return response;
    }
  }

  /// [사업선택] 사업구역선택 조회
  Future<Response> fetchBsnsSelectAreaGridDataSource(bsnsNo) async {

    // using query
    final response = await post('/lp/bsns/selectBsnsZone.do', {'bsnsNo': bsnsNo}, query: {'bsnsNo': bsnsNo});

    if (response.status.hasError) {
      DialogUtil.showSnackBar(Get.context!, 'error', 'error');
      return Future.error(response.statusText ?? 'error');
    } else {
      return response;
    }

  }
}
