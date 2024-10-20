import 'dart:convert';
/// natpblndLdgrNo : "507861NODATA20060476"
/// ladSeq : 507861
/// ocpatSeq : 1
/// accdtInvstgNo : "507861-1"
/// locNm : "충청남도 천안시 동남구 청당동"
/// lgdongCd : "4413111100"
/// lcrtsDivCd : "1"
/// mlnoLtno : "925"
/// slnoLtno : "1"
/// natpblndAssetsGrpNm : null
/// squatAra : 50
/// usePurpsLclsCd : "4000"
/// usePurpsMclsCd : "4100"
/// usePurpsSclsCd : null
/// dtlDtls : "쓰레기 적치"
/// referMtt : null
/// possesnStrtDe : "20240708"
/// possesnEndDe : null
/// wtrmsOcpntDivCd : "00"
/// undongRequstCo : 1
/// applcntNm : "홍길동"
/// natpblndOcpatUseNo : "201100018"
/// applcntAddr : "대전 대덕구 읍내동196-6번지123"
/// applcntZip : "306070"
/// squatYn : "Y"
/// applcLawDivCd : "100"
/// actnBfAtchflId : "LDI24071515061886433"
/// actnAfAtchflId : "LDI24071515061986434"
/// ladBtypDivCd : "01"
/// nhtNoCnt : 0
/// drftNoCnt : 0
/// frstRgstrNm : "윤승용"
/// frstRegistDt : "20240715"
/// lastUpdusrNm : "윤승용"
/// lastUpdtDt : "20240715"
/// etcMtt : null

List wpmDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = WtwkaccdtinvstgModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}


WtwkaccdtinvstgModel WtwkaccdtinvstgModelFromJson(String str) => WtwkaccdtinvstgModel.fromJson(json.decode(str));
String WtwkaccdtinvstgModelToJson(WtwkaccdtinvstgModel data) => json.encode(data.toJson());
class WtwkaccdtinvstgModel {
  WtwkaccdtinvstgModel({
      this.natpblndLdgrNo, 
      this.ladSeq, 
      this.ocpatSeq, 
      this.accdtInvstgNo, 
      this.locNm, 
      this.lgdongCd, 
      this.lcrtsDivCd, 
      this.mlnoLtno, 
      this.slnoLtno, 
      this.natpblndAssetsGrpNm, 
      this.squatAra, 
      this.usePurpsLclsCd, 
      this.usePurpsMclsCd, 
      this.usePurpsSclsCd, 
      this.dtlDtls, 
      this.referMtt, 
      this.possesnStrtDe, 
      this.possesnEndDe, 
      this.wtrmsOcpntDivCd, 
      this.undongRequstCo, 
      this.applcntNm, 
      this.natpblndOcpatUseNo, 
      this.applcntAddr, 
      this.applcntZip, 
      this.squatYn, 
      this.applcLawDivCd, 
      this.actnBfAtchflId, 
      this.actnAfAtchflId, 
      this.ladBtypDivCd, 
      this.nhtNoCnt, 
      this.drftNoCnt, 
      this.frstRgstrNm, 
      this.frstRegistDt, 
      this.lastUpdusrNm, 
      this.lastUpdtDt, 
      this.etcMtt,});

  WtwkaccdtinvstgModel.fromJson(dynamic json) {
    natpblndLdgrNo = json['natpblndLdgrNo'] ?? '';
    ladSeq = json['ladSeq'] ?? 0;
    ocpatSeq = json['ocpatSeq'] ?? 0;
    accdtInvstgNo = json['accdtInvstgNo'] ?? '';
    locNm = json['locNm'] ?? '';
    lgdongCd = json['lgdongCd'] ?? '';
    lcrtsDivCd = json['lcrtsDivCd'] ?? '';
    mlnoLtno = json['mlnoLtno'] ?? '';
    slnoLtno = json['slnoLtno'] ?? '';
    natpblndAssetsGrpNm = json['natpblndAssetsGrpNm'] ?? '';
    squatAra = json['squatAra'] ?? 0;
    usePurpsLclsCd = json['usePurpsLclsCd'] ?? '';
    usePurpsMclsCd = json['usePurpsMclsCd'] ?? '';
    usePurpsSclsCd = json['usePurpsSclsCd'] ?? '';
    dtlDtls = json['dtlDtls'] ?? '';
    referMtt = json['referMtt'] ?? '';
    possesnStrtDe = json['possesnStrtDe'] ?? '';
    possesnEndDe = json['possesnEndDe'] ?? '';
    wtrmsOcpntDivCd = json['wtrmsOcpntDivCd'] ?? '';
    undongRequstCo = json['undongRequstCo'] ?? 0;
    applcntNm = json['applcntNm'] ?? '';
    natpblndOcpatUseNo = json['natpblndOcpatUseNo'] ?? '';
    applcntAddr = json['applcntAddr'] ?? '';
    applcntZip = json['applcntZip'] ?? '';
    squatYn = json['squatYn'] ?? '';
    applcLawDivCd = json['applcLawDivCd'] ?? '';
    actnBfAtchflId = json['actnBfAtchflId'] ?? '';
    actnAfAtchflId = json['actnAfAtchflId'] ?? '';
    ladBtypDivCd = json['ladBtypDivCd'] ?? '';
    nhtNoCnt = json['nhtNoCnt'] ?? 0;
    drftNoCnt = json['drftNoCnt'] ?? 0;
    frstRgstrNm = json['frstRgstrNm'] ?? '';
    frstRegistDt = json['frstRegistDt'] ?? '';
    lastUpdusrNm = json['lastUpdusrNm'] ?? '';
    lastUpdtDt = json['lastUpdtDt'] ?? '';
    etcMtt = json['etcMtt'] ?? '';
  }
  String? natpblndLdgrNo;
  num? ladSeq;
  num? ocpatSeq;
  String? accdtInvstgNo;
  String? locNm;
  String? lgdongCd;
  String? lcrtsDivCd;
  String? mlnoLtno;
  String? slnoLtno;
  dynamic natpblndAssetsGrpNm;
  num? squatAra;
  String? usePurpsLclsCd;
  String? usePurpsMclsCd;
  dynamic usePurpsSclsCd;
  String? dtlDtls;
  dynamic referMtt;
  String? possesnStrtDe;
  dynamic possesnEndDe;
  String? wtrmsOcpntDivCd;
  num? undongRequstCo;
  String? applcntNm;
  String? natpblndOcpatUseNo;
  String? applcntAddr;
  String? applcntZip;
  String? squatYn;
  String? applcLawDivCd;
  String? actnBfAtchflId;
  String? actnAfAtchflId;
  String? ladBtypDivCd;
  num? nhtNoCnt;
  num? drftNoCnt;
  String? frstRgstrNm;
  String? frstRegistDt;
  String? lastUpdusrNm;
  String? lastUpdtDt;
  dynamic etcMtt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['natpblndLdgrNo'] = natpblndLdgrNo;
    map['ladSeq'] = ladSeq;
    map['ocpatSeq'] = ocpatSeq;
    map['accdtInvstgNo'] = accdtInvstgNo;
    map['locNm'] = locNm;
    map['lgdongCd'] = lgdongCd;
    map['lcrtsDivCd'] = lcrtsDivCd;
    map['mlnoLtno'] = mlnoLtno;
    map['slnoLtno'] = slnoLtno;
    map['natpblndAssetsGrpNm'] = natpblndAssetsGrpNm;
    map['squatAra'] = squatAra;
    map['usePurpsLclsCd'] = usePurpsLclsCd;
    map['usePurpsMclsCd'] = usePurpsMclsCd;
    map['usePurpsSclsCd'] = usePurpsSclsCd;
    map['dtlDtls'] = dtlDtls;
    map['referMtt'] = referMtt;
    map['possesnStrtDe'] = possesnStrtDe;
    map['possesnEndDe'] = possesnEndDe;
    map['wtrmsOcpntDivCd'] = wtrmsOcpntDivCd;
    map['undongRequstCo'] = undongRequstCo;
    map['applcntNm'] = applcntNm;
    map['natpblndOcpatUseNo'] = natpblndOcpatUseNo;
    map['applcntAddr'] = applcntAddr;
    map['applcntZip'] = applcntZip;
    map['squatYn'] = squatYn;
    map['applcLawDivCd'] = applcLawDivCd;
    map['actnBfAtchflId'] = actnBfAtchflId;
    map['actnAfAtchflId'] = actnAfAtchflId;
    map['ladBtypDivCd'] = ladBtypDivCd;
    map['nhtNoCnt'] = nhtNoCnt;
    map['drftNoCnt'] = drftNoCnt;
    map['frstRgstrNm'] = frstRgstrNm;
    map['frstRegistDt'] = frstRegistDt;
    map['lastUpdusrNm'] = lastUpdusrNm;
    map['lastUpdtDt'] = lastUpdtDt;
    map['etcMtt'] = etcMtt;
    return map;
  }

}