/// [AccdtlnvstgLadModel] 실태조사서 > 지장물

class AccdtlnvstgObstModel {

  int obstSeq = 0; // 지장물 순번
  String obstDivCd = ""; // 지장물 구분 코드
  String cmpnstnThingKndDtls = ""; // 물건의 종류
  String cmpnstnThingNm = ""; // 물건명
  String obstStrctStndrdInfo = ""; // 지장물 구조규격정보
  int cmpnstnQtyAraVu = 0; // 보상수량(면적)
  String cmpnstnThingUnitDivCd = ""; // 보상물건단위구분코드

  // 조사자
  String invstrEmpNo = ""; // 조사자 사번
  String invstrJgrdNm = ""; // 조사자 직급
  String invstrNm = ""; // 조사자 성명

  // 입회자
  String obsrverNm = ""; // 입회자 사번
  String accdtInvstgObsrverAddr = ""; // 입회자 주소

  String acddtInvstgSqnc = ""; // 조사차수
  String invstgDt = ""; // 조사차수명
  String spcitm = ""; // 비고

  AccdtlnvstgObstModel({
    this.obstSeq = 0,
    this.obstDivCd = "",
    this.cmpnstnThingKndDtls = "",
    this.cmpnstnThingNm = "",
    this.obstStrctStndrdInfo = "",
    this.cmpnstnQtyAraVu = 0,
    this.cmpnstnThingUnitDivCd = "",
    this.invstrEmpNo = "",
    this.invstrJgrdNm = "",
    this.invstrNm = "",
    this.obsrverNm = "",
    this.accdtInvstgObsrverAddr = "",
    this.acddtInvstgSqnc = "",
    this.invstgDt = "",
    this.spcitm = "",
  });

  factory AccdtlnvstgObstModel.fromJson(Map<String, dynamic> json) {
    return AccdtlnvstgObstModel(
      obstSeq: json['obstSeq'] as int,
      obstDivCd: json['obstDivCd'] as String,
      cmpnstnThingKndDtls: json['cmpnstnThingKndDtls'] as String,
      cmpnstnThingNm: json['cmpnstnThingNm'] as String,
      obstStrctStndrdInfo: json['obstStrctStndrdInfo'] as String,
      cmpnstnQtyAraVu: json['cmpnstnQtyAraVu'] as int,
      cmpnstnThingUnitDivCd: json['cmpnstnThingUnitDivCd'] as String,
      invstrEmpNo: json['invstrEmpNo'] as String,
      invstrJgrdNm: json['invstrJgrdNm'] as String,
      invstrNm: json['invstrNm'] as String,
      obsrverNm: json['obsrverNm'] as String,
      accdtInvstgObsrverAddr: json['accdtInvstgObsrverAddr'] as String,
      acddtInvstgSqnc: json['acddtInvstgSqnc'] as String,
      invstgDt: json['invstgDt'] as String,
      spcitm: json['spcitm'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'obstSeq': obstSeq,
      'obstDivCd': obstDivCd,
      'cmpnstnThingKndDtls': cmpnstnThingKndDtls,
      'cmpnstnThingNm': cmpnstnThingNm,
      'obstStrctStndrdInfo': obstStrctStndrdInfo,
      'cmpnstnQtyAraVu': cmpnstnQtyAraVu,
      'cmpnstnThingUnitDivCd': cmpnstnThingUnitDivCd,
      'invstrEmpNo': invstrEmpNo,
      'invstrJgrdNm': invstrJgrdNm,
      'invstrNm': invstrNm,
      'obsrverNm': obsrverNm,
      'accdtInvstgObsrverAddr': accdtInvstgObsrverAddr,
      'acddtInvstgSqnc': acddtInvstgSqnc,
      'invstgDt': invstgDt,
      'spcitm': spcitm,
    };
  }

  @override
  String toString() {
    return toJson().toString().replaceAll(",", ",\n");
  }

}