// 통계정보 > 지장물 > 지장물현황정보조회
class ObstSttusInqireModel {
  // 지장물기본정보
  String? addr; // 소재지
  String? lcrtsNm; // 특지
  String? mlnoLtno; // 본번
  String? slnoLtno; // 부번

  // 진행단계
  String? prgsStepInfo;

  // 취득용도
  String? acqsPrpDivCd;

  // 실태조사
  String? obstDivNm; // 물건구분
  String? cmpnstnThingKndDtls; // 물건종류
  String? obstStrctStndrdInfo; // 구조 및 규격
  String? dtaPrcsSittnCtnt; // 상황
  String? cmpnstnQtyAraVu; // 수량 및 면적
  String? unitNm; // 단위
  String? spcitm; // 특이사항
  String? accdtInvstgDe; // 조사일자
  String? accdtInvstgSqnc; // 조사차수

  // 소유자정보
  String? ownerDivCd; // 소유자구분
  String? ownerNm; // 성명
  String? ownerRgsbukAddr; // 소유자등기부주소
  String? posesnShreNmrtrInfo; // 분자
  String? posesnShreDnmntrInfo; // 분모

  // 감정평가
  String? apasmtDivCd; // 평가부분
  String? apasmtSqnc; // 평가차수
  String? prceDt; // 가격시점

  // A평가법인
  String? apasmtInsttNm1; // 평가법인명
  String? apasmtInsttEvlUpc1; // 평가법인단가
  String? apasmtInsttEvlAmt1; // 평가법인금액

  // B평가법인
  String? apasmtInsttNm2; // 평가법인명
  String? apasmtInsttEvlUpc2; // 평가법인단가
  String? apasmtInsttEvlAmt2; // 평가법인금액

  // C평가법인
  String? apasmtInsttNm3; // 평가법인명
  String? apasmtInsttEvlUpc3; // 평가법인단가
  String? apasmtInsttEvlAmt3; // 평가법인금액

  // 보상비산정
  String? cmpnstnCmptnUpc; // 보상비산정단가
  String? cpsmnCmptnAmt; // 보상비산정금액

  // 보상비지급
  String? pymntRequstDt; // 보상비지급요청일
  String? cpsmnUpc; // 보상비지급단가
  String? cpsmnPymamt; // 보상비지급금액

  // 수용재결
  String? aceptncAdjdcUpc; // 수용재결단가
  String? aceptncAdjdcAmt; // 수용재결금액
  String? aceptncAdjdcDt; // 수용재결일자
  String? aceptncUseBeginDe; // 수용/사용개시일
  String? aceptncAdjdcPymntDe; // 수용재결지급요청일자
  String? cpsmnPymntLdgmntDivCd; // 지급/공탁 구분

  // 이의재결
  String? objctnAdjdcUpc; // 이의재결단가
  String? objctnAdjdcAmt; // 이의재결금액
  String? objctnAdjdcDt; // 이의재결일자
  String? objctnPymntRequstDt; // 이의/사용개시일
  String? objctncpsmnPymntLdgmntDivCd; // 지급/공탁

  ObstSttusInqireModel({
    this.addr,
    this.lcrtsNm,
    this.mlnoLtno,
    this.slnoLtno,
    this.prgsStepInfo,
    this.acqsPrpDivCd,
    this.accdtInvstgDe,
    this.accdtInvstgSqnc,
    this.ownerDivCd,
    this.ownerNm,
    this.ownerRgsbukAddr,
    this.posesnShreNmrtrInfo,
    this.posesnShreDnmntrInfo,
    this.apasmtDivCd,
    this.apasmtSqnc,
    this.prceDt,
    this.apasmtInsttNm1,
    this.apasmtInsttEvlUpc1,
    this.apasmtInsttEvlAmt1,
    this.apasmtInsttNm2,
    this.apasmtInsttEvlUpc2,
    this.apasmtInsttEvlAmt2,
    this.apasmtInsttNm3,
    this.apasmtInsttEvlUpc3,
    this.apasmtInsttEvlAmt3,
    this.cmpnstnCmptnUpc,
    this.cpsmnCmptnAmt,
    this.pymntRequstDt,
    this.cpsmnUpc,
    this.cpsmnPymamt,
    this.aceptncAdjdcUpc,
    this.aceptncAdjdcAmt,
    this.aceptncAdjdcDt,
    this.aceptncUseBeginDe,
    this.aceptncAdjdcPymntDe,
    this.cpsmnPymntLdgmntDivCd,
    this.objctnAdjdcUpc,
    this.objctnAdjdcAmt,
    this.objctnAdjdcDt,
    this.objctnPymntRequstDt,
    this.objctncpsmnPymntLdgmntDivCd,
  });

  // from
  factory ObstSttusInqireModel.fromJson(Map<String, dynamic> json) {
    return ObstSttusInqireModel(
      addr: json['addr'],
      lcrtsNm: json['lcrtsNm'],
      mlnoLtno: json['mlnoLtno'],
      slnoLtno: json['slnoLtno'],
      prgsStepInfo: json['prgsStepInfo'],
      acqsPrpDivCd: json['acqsPrpDivCd'],
      accdtInvstgDe: json['accdtInvstgDe'],
      accdtInvstgSqnc: json['accdtInvstgSqnc'],
      ownerDivCd: json['ownerDivCd'],
      ownerNm: json['ownerNm'],
      ownerRgsbukAddr: json['ownerRgsbukAddr'],
      posesnShreNmrtrInfo: json['posesnShreNmrtrInfo'],
      posesnShreDnmntrInfo: json['posesnShreDnmntrInfo'],
      apasmtDivCd: json['apasmtDivCd'],
      apasmtSqnc: json['apasmtSqnc'],
      prceDt: json['prceDt'],
      apasmtInsttNm1: json['apasmtInsttNm1'],
      apasmtInsttEvlUpc1: json['apasmtInsttEvlUpc1'],
      apasmtInsttEvlAmt1: json['apasmtInsttEvlAmt1'],
      apasmtInsttNm2: json['apasmtInsttNm2'],
      apasmtInsttEvlUpc2: json['apasmtInsttEvlUpc2'],
      apasmtInsttEvlAmt2: json['apasmtInsttEvlAmt2'],
      apasmtInsttNm3: json['apasmtInsttNm3'],
      apasmtInsttEvlUpc3: json['apasmtInsttEvlUpc3'],
      apasmtInsttEvlAmt3: json['apasmtInsttEvlAmt3'],
      cmpnstnCmptnUpc: json['cmpnstnCmptnUpc'],
      cpsmnCmptnAmt: json['cpsmnCmptnAmt'],
      pymntRequstDt: json['pymntRequstDt'],
      cpsmnUpc: json['cpsmnUpc'],
      cpsmnPymamt: json['cpsmnPymamt'],
      aceptncAdjdcUpc: json['aceptncAdjdcUpc'],
      aceptncAdjdcAmt: json['aceptncAdjdcAmt'],
      aceptncAdjdcDt: json['aceptncAdjdcDt'],
      aceptncUseBeginDe: json['aceptncUseBeginDe'],
      aceptncAdjdcPymntDe: json['aceptncAdjdcPymntDe'],
      cpsmnPymntLdgmntDivCd: json['cpsmnPymntLdgmntDivCd'],
      objctnAdjdcUpc: json['objctnAdjdcUpc'],
      objctnAdjdcAmt: json['objctnAdjdcAmt'],
      objctnAdjdcDt: json['objctnAdjdcDt'],
      objctnPymntRequstDt: json['objctnPymntRequstDt'],
      objctncpsmnPymntLdgmntDivCd: json['objctncpsmnPymntLdgmntDivCd'],
    );
  }

  // to
  Map<String, dynamic> toJson() => {
        'addr': addr,
        'lcrtsNm': lcrtsNm,
        'mlnoLtno': mlnoLtno,
        'slnoLtno': slnoLtno,
        'prgsStepInfo': prgsStepInfo,
        'acqsPrpDivCd': acqsPrpDivCd,
        'accdtInvstgDe': accdtInvstgDe,
        'accdtInvstgSqnc': accdtInvstgSqnc,
        'ownerDivCd': ownerDivCd,
        'ownerNm': ownerNm,
        'ownerRgsbukAddr': ownerRgsbukAddr,
        'posesnShreNmrtrInfo': posesnShreNmrtrInfo,
        'posesnShreDnmntrInfo': posesnShreDnmntrInfo,
        'apasmtDivCd': apasmtDivCd,
        'apasmtSqnc': apasmtSqnc,
        'prceDt': prceDt,
        'apasmtInsttNm1': apasmtInsttNm1,
        'apasmtInsttEvlUpc1': apasmtInsttEvlUpc1,
        'apasmtInsttEvlAmt1': apasmtInsttEvlAmt1,
        'apasmtInsttNm2': apasmtInsttNm2,
        'apasmtInsttEvlUpc2': apasmtInsttEvlUpc2,
        'apasmtInsttEvlAmt2': apasmtInsttEvlAmt2,
        'apasmtInsttNm3': apasmtInsttNm3,
        'apasmtInsttEvlUpc3': apasmtInsttEvlUpc3,
        'apasmtInsttEvlAmt3': apasmtInsttEvlAmt3,
        'cmpnstnCmptnUpc': cmpnstnCmptnUpc,
        'cpsmnCmptnAmt': cpsmnCmptnAmt,
        'pymntRequstDt': pymntRequstDt,
        'cpsmnUpc': cpsmnUpc,
        'cpsmnPymamt': cpsmnPymamt,
        'aceptncAdjdcUpc': aceptncAdjdcUpc,
        'aceptncAdjdcAmt': aceptncAdjdcAmt,
        'aceptncAdjdcDt': aceptncAdjdcDt,
        'aceptncUseBeginDe': aceptncUseBeginDe,
        'aceptncAdjdcPymntDe': aceptncAdjdcPymntDe,
        'cpsmnPymntLdgmntDivCd': cpsmnPymntLdgmntDivCd,
        'objctnAdjdcUpc': objctnAdjdcUpc,
        'objctnAdjdcAmt': objctnAdjdcAmt,
        'objctnAdjdcDt': objctnAdjdcDt,
        'objctnPymntRequstDt': objctnPymntRequstDt,
        'objctncpsmnPymntLdgmntDivCd': objctncpsmnPymntLdgmntDivCd,
      };

  @override
  String toString() {
    return toJson().toString().replaceAll(",", ",\n");
  }
}
