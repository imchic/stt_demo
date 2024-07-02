/// TM_LP20210 (LP_실태조사토지정보)

class OwnerLadInfoDatasourceModel {

  // 소재지
  String? lgdongNm; // 법정동명
  String? lgdongCd; // 법정동코드
  String? lcrtsDivCd; // 특지구분코드
  String? mlnoLtno; // 본번지번
  String? slnoLtno; // 부번지번

  // 지목
  String? ofcbkLndcgrDivCd; // 공부지목구분코드
  String? sttusLndcgrDivCd; // 현황지목구분코드

  // 면적
  int? ofcbkAra; // 공부면적
  int? incrprAra; // 편입면적
  int? cmpnstnInvstgAra ; // 보상조사면적

  String? acqsPrpDivCd; // 취득소유구분코드
  String? aceptncPrpDivCd; // 수용사용구분코드
  int? accdtInvstgSqnc; // 실태조사 차수
  String? accdtInvstgDe; // 실태조사일자
  String? invstgDt; // 조사일시
  String? cmpnstnDtaChnStatDivCd; // 보상자료변경상태구분코드

  /// ERD 상에 존재하지 않는 컬럼
  String? etc; // 기타

  OwnerLadInfoDatasourceModel({
    this.lgdongNm,
    this.lgdongCd,
    this.lcrtsDivCd,
    this.mlnoLtno,
    this.slnoLtno,
    this.ofcbkLndcgrDivCd,
    this.sttusLndcgrDivCd,
    this.ofcbkAra,
    this.incrprAra,
    this.cmpnstnInvstgAra,
    this.acqsPrpDivCd,
    this.aceptncPrpDivCd,
    this.accdtInvstgSqnc,
    this.accdtInvstgDe,
    this.invstgDt,
    this.cmpnstnDtaChnStatDivCd,
    this.etc,
  });

  OwnerLadInfoDatasourceModel.fromJson(Map<String, dynamic> json) {
    lgdongNm = json['lgdongNm'];
    lgdongCd = json['lgdongCd'];
    lcrtsDivCd = json['lcrtsDivCd'];
    mlnoLtno = json['mlnoLtno'];
    slnoLtno = json['slnoLtno'];
    ofcbkLndcgrDivCd = json['ofcbkLndcgrDivCd'];
    sttusLndcgrDivCd = json['sttusLndcgrDivCd'];
    ofcbkAra = json['ofcbkAra'];
    incrprAra = json['incrprAra'];
    cmpnstnInvstgAra = json['cmpnstnInvstgAra'];
    acqsPrpDivCd = json['acqsPrpDivCd'];
    aceptncPrpDivCd = json['aceptncPrpDivCd'];
    accdtInvstgSqnc = json['accdtInvstgSqnc'];
    accdtInvstgDe = json['accdtInvstgDe'];
    invstgDt = json['invstgDt'];
    cmpnstnDtaChnStatDivCd = json['cmpnstnDtaChnStatDivCd'];
    etc = json['etc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lgdongNm'] = lgdongNm;
    data['lgdongCd'] = lgdongCd;
    data['lcrtsDivCd'] = lcrtsDivCd;
    data['mlnoLtno'] = mlnoLtno;
    data['slnoLtno'] = slnoLtno;
    data['ofcbkLndcgrDivCd'] = ofcbkLndcgrDivCd;
    data['sttusLndcgrDivCd'] = sttusLndcgrDivCd;
    data['ofcbkAra'] = ofcbkAra;
    data['incrprAra'] = incrprAra;
    data['cmpnstnInvstgAra'] = cmpnstnInvstgAra;
    data['acqsPrpDivCd'] = acqsPrpDivCd;
    data['aceptncPrpDivCd'] = aceptncPrpDivCd;
    data['accdtInvstgSqnc'] = accdtInvstgSqnc;
    data['accdtInvstgDe'] = accdtInvstgDe;
    data['invstgDt'] = invstgDt;
    data['cmpnstnDtaChnStatDivCd'] = cmpnstnDtaChnStatDivCd;
    data['etc'] = etc;
    return data;
  }

  @override
  String toString() {
    return toJson().toString().replaceAll(',', ',\n');
  }

}