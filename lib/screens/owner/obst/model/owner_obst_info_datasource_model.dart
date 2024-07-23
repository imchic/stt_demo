/// TM_LP20310 (LP_실태조사지장물정보)

class OwnerObstInfoDatasourceModel {

  // 소재지
  String? lgdongNm; // 법정동명
  String? lgdongCd; // 법정동코드
  String? lcrtsDivCd; // 특지구분코드
  String? mlnoLtno; // 본번지번
  String? slnoLtno; // 부번지번

  String? obstSeq; // 지장물 순번
  String? obstDivCd; // 지장물구분코드
  String? cmpnstnThingKndDtls; // 물건의종류
  String? obstStrctStndrdInfo; // 구조규격정보
  String? cmpnstnQtyAraVu; // 보상수량면적값
  String? cmpnstnThingUnitDivCd; // 보상물건단위구분코드
  String? sttusLndcgrDivCd; // 현황지목구분코드
  String? acqsPrpDivCd; // 취득용도구분코드
  String? aceptncUseDivCd; // 수용용도구분코드
  int? accdtInvstgSqnc; // 실태조사차수
  String? invstgDt; // 조사일시
  String? cmpnstnStepDivCd; // 보상단계구분코드
  String? spcitm; // 특이사항

  OwnerObstInfoDatasourceModel({
    this.lgdongNm,
    this.lgdongCd,
    this.lcrtsDivCd,
    this.mlnoLtno,
    this.slnoLtno,
    this.obstSeq,
    this.obstDivCd,
    this.cmpnstnThingKndDtls,
    this.obstStrctStndrdInfo,
    this.cmpnstnQtyAraVu,
    this.cmpnstnThingUnitDivCd,
    this.sttusLndcgrDivCd,
    this.acqsPrpDivCd,
    this.aceptncUseDivCd,
    this.accdtInvstgSqnc,
    this.invstgDt,
    this.cmpnstnStepDivCd,
    this.spcitm,
  });

  OwnerObstInfoDatasourceModel.fromJson(Map<String, dynamic> json) {
    lgdongNm = json['lgdongNm'];
    lgdongCd = json['lgdongCd'];
    lcrtsDivCd = json['lcrtsDivCd'];
    mlnoLtno = json['mlnoLtno'];
    slnoLtno = json['slnoLtno'];
    obstSeq = json['obstSeq'];
    obstDivCd = json['obstDivCd'];
    cmpnstnThingKndDtls = json['cmpnstnThingKndDtls'];
    obstStrctStndrdInfo = json['obstStrctStndrdInfo'];
    cmpnstnQtyAraVu = json['cmpnstnQtyAraVu'];
    cmpnstnThingUnitDivCd = json['cmpnstnThingUnitDivCd'];
    sttusLndcgrDivCd = json['sttusLndcgrDivCd'];
    acqsPrpDivCd = json['acqsPrpDivCd'];
    aceptncUseDivCd = json['aceptncUseDivCd'];
    accdtInvstgSqnc = json['accdtInvstgSqnc'];
    invstgDt = json['invstgDt'];
    cmpnstnStepDivCd = json['cmpnstnStepDivCd'];
    spcitm = json['spcitm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['lgdongNm'] = lgdongNm;
    data['lgdongCd'] = lgdongCd;
    data['lcrtsDivCd'] = lcrtsDivCd;
    data['mlnoLtno'] = mlnoLtno;
    data['slnoLtno'] = slnoLtno;
    data['obstSeq'] = obstSeq;
    data['obstDivCd'] = obstDivCd;
    data['cmpnstnThingKndDtls'] = cmpnstnThingKndDtls;
    data['obstStrctStndrdInfo'] = obstStrctStndrdInfo;
    data['cmpnstnQtyAraVu'] = cmpnstnQtyAraVu;
    data['cmpnstnThingUnitDivCd'] = cmpnstnThingUnitDivCd;
    data['sttusLndcgrDivCd'] = sttusLndcgrDivCd;
    data['acqsPrpDivCd'] = acqsPrpDivCd;
    data['aceptncUseDivCd'] = aceptncUseDivCd;
    data['accdtInvstgSqnc'] = accdtInvstgSqnc;
    data['invstgDt'] = invstgDt;
    data['cmpnstnStepDivCd'] = cmpnstnStepDivCd;
    data['spcitm'] = spcitm;
    return data;
  }

  @override
  String toString() {
    return toJson().toString().replaceAll(',', ',\n');
  }

}