/// TD_LP10111 (LP_사업계획구역정보)
///
/// 사업계획구역정보 그리드 데이터소스 모델

class BsnsSelectAreaDataSourceModel {

  bool select = false;
  int? bsnsNo; // 사업번호
  int? bsnsZoneNo; // 사업구역 번호
  String? bsnsZoneNm; // 사업구역 명
  int? lotCnt; // 필지 수
  int? bsnsAra; // 사업 면적
  String? bsnsReadngPblancDe; // 사업열람공고일


  BsnsSelectAreaDataSourceModel({
    this.select = false,
    this.bsnsNo,
    this.bsnsZoneNo,
    this.bsnsZoneNm,
    this.lotCnt,
    this.bsnsAra,
    this.bsnsReadngPblancDe,
  });

  BsnsSelectAreaDataSourceModel.fromJson(Map<String, dynamic> json) {
    select = json['select'];
    bsnsNo = json['bsnsNo'];
    bsnsZoneNo = json['bsnsZoneNo'];
    bsnsZoneNm = json['bsnsZoneNm'];
    lotCnt = json['lotCnt'];
    bsnsAra = json['bsnsAra'];
    bsnsReadngPblancDe = json['bsnsReadngPblancDe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['select'] = select;
    data['bsnsNo'] = bsnsNo;
    data['bsnsZoneNo'] = bsnsZoneNo;
    data['bsnsZoneNm'] = bsnsZoneNm;
    data['lotCnt'] = lotCnt;
    data['bsnsAra'] = bsnsAra;
    data['bsnsReadngPblancDe'] = bsnsReadngPblancDe;
    return data;
  }

  @override
  String toString() {
    return toJson().toString().replaceAll(',', ',\n');
  }
}
