import 'dart:convert';
/// plotUseNo : "202403145"
/// natpblndOcpatUseNo : "202300001"
/// rqstDe : "20240311"
/// useRqstDtls : null
/// useRqstSbmtrNm : null
/// prmisnSpeclObsryMtt : null
/// prmisnApplcntDivCd : "00"
/// ladBtypDivCd : "01"
/// prmisnRqstDivCd : null
/// prmisnNo : null
/// usePrmisnYn : "N"
/// prmisnYnDcsnDe : null
/// useNnpmsnRsn : null
/// prmisnRqstDrftNo : "240498616"
/// nnpmsnDrftNo : null
/// chrgDeptCd : "50039727"
/// chrgDeptNm : "경기서남권지사"
/// chargerId : null
/// canclYn : "N"
/// usePrmisnRqstDrftYn : "N"
/// usePrmisnCntrctDivCd : null
/// damBsnsDivCd : null
/// prcsTmlmtDe : null
/// oldChrgDeptCd : null
/// vstdRiverUsrYn : "N"
/// rcpmnyVtlactNo : null
/// vtlactNoUseYn : "N"
/// elctrRceptYn : "Y"
/// applcLawDivCd : "100"
/// etcAtchflId : null
/// usePrmisnDocAtchflId : null
/// delYn : "N"
/// frstRgstrId : "20202669"
/// frstRegistDt : "20240311"
/// lastUpdusrId : "20202669"
/// lastUpdtDt : "20240311"
/// conectIp : "172.20.3.116"
/// frstRgstrNm : "윤승용"
/// lastUpdusrNm : "윤승용"
/// bcncNo : null
/// applcntNm : "홍길동"
/// applcntRrnEnc : "111111-1111111"
/// applcntBizrno : null
/// applcntZip : "12507"
/// applcntAddr : "경기도 양평군 옥천면 백현길 26"
/// applcntTelno : null
/// applcntMbtlnum : "010-8706-3338"
/// applcntFaxno : null
/// applcntEmail : null
/// brthdy : null
/// drftNo : null
/// sanctnStatCd : null
/// bsnsNo : null
/// bsnsZoneNo : null
/// sanctnDocNo : null
/// sanctnTit : null
/// sbmtDe : null
/// sanctnDe : null
/// accdtInvstgRm : null
/// cmpnstnDtaCreatId : null
/// ladCnt : 1
/// flflWrgrntiCnt : 0
/// conInKey : "#202403145#202300001"
/// rgstNmbr : "전문생성대상"


List usePrmisnCanclAprvDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = UsePrmisnCanclAprvModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

UsePrmisnCanclAprvModel usePrmisnCanclAprvModelFromJson(String str) => UsePrmisnCanclAprvModel.fromJson(json.decode(str));
String usePrmisnCanclAprvModelToJson(UsePrmisnCanclAprvModel data) => json.encode(data.toJson());
class UsePrmisnCanclAprvModel {
  UsePrmisnCanclAprvModel({
      this.plotUseNo, 
      this.natpblndOcpatUseNo, 
      this.rqstDe, 
      this.useRqstDtls, 
      this.useRqstSbmtrNm, 
      this.prmisnSpeclObsryMtt, 
      this.prmisnApplcntDivCd, 
      this.ladBtypDivCd, 
      this.prmisnRqstDivCd, 
      this.prmisnNo, 
      this.usePrmisnYn, 
      this.prmisnYnDcsnDe, 
      this.useNnpmsnRsn, 
      this.prmisnRqstDrftNo, 
      this.nnpmsnDrftNo, 
      this.chrgDeptCd, 
      this.chrgDeptNm, 
      this.chargerId, 
      this.canclYn, 
      this.usePrmisnRqstDrftYn, 
      this.usePrmisnCntrctDivCd, 
      this.damBsnsDivCd, 
      this.prcsTmlmtDe, 
      this.oldChrgDeptCd, 
      this.vstdRiverUsrYn, 
      this.rcpmnyVtlactNo, 
      this.vtlactNoUseYn, 
      this.elctrRceptYn, 
      this.applcLawDivCd, 
      this.etcAtchflId, 
      this.usePrmisnDocAtchflId, 
      this.delYn, 
      this.frstRgstrId, 
      this.frstRegistDt, 
      this.lastUpdusrId, 
      this.lastUpdtDt, 
      this.conectIp, 
      this.frstRgstrNm, 
      this.lastUpdusrNm, 
      this.bcncNo, 
      this.applcntNm, 
      this.applcntRrnEnc, 
      this.applcntBizrno, 
      this.applcntZip, 
      this.applcntAddr, 
      this.applcntTelno, 
      this.applcntMbtlnum, 
      this.applcntFaxno, 
      this.applcntEmail, 
      this.brthdy, 
      this.drftNo, 
      this.sanctnStatCd, 
      this.bsnsNo, 
      this.bsnsZoneNo, 
      this.sanctnDocNo, 
      this.sanctnTit, 
      this.sbmtDe, 
      this.sanctnDe, 
      this.accdtInvstgRm, 
      this.cmpnstnDtaCreatId, 
      this.ladCnt, 
      this.flflWrgrntiCnt, 
      this.conInKey, 
      this.rgstNmbr,});

  UsePrmisnCanclAprvModel.fromJson(dynamic json) {
    plotUseNo = json['plotUseNo'];
    natpblndOcpatUseNo = json['natpblndOcpatUseNo'];
    rqstDe = json['rqstDe'];
    useRqstDtls = json['useRqstDtls'];
    useRqstSbmtrNm = json['useRqstSbmtrNm'];
    prmisnSpeclObsryMtt = json['prmisnSpeclObsryMtt'];
    prmisnApplcntDivCd = json['prmisnApplcntDivCd'];
    ladBtypDivCd = json['ladBtypDivCd'];
    prmisnRqstDivCd = json['prmisnRqstDivCd'];
    prmisnNo = json['prmisnNo'];
    usePrmisnYn = json['usePrmisnYn'];
    prmisnYnDcsnDe = json['prmisnYnDcsnDe'];
    useNnpmsnRsn = json['useNnpmsnRsn'];
    prmisnRqstDrftNo = json['prmisnRqstDrftNo'];
    nnpmsnDrftNo = json['nnpmsnDrftNo'];
    chrgDeptCd = json['chrgDeptCd'];
    chrgDeptNm = json['chrgDeptNm'];
    chargerId = json['chargerId'];
    canclYn = json['canclYn'];
    usePrmisnRqstDrftYn = json['usePrmisnRqstDrftYn'];
    usePrmisnCntrctDivCd = json['usePrmisnCntrctDivCd'];
    damBsnsDivCd = json['damBsnsDivCd'];
    prcsTmlmtDe = json['prcsTmlmtDe'];
    oldChrgDeptCd = json['oldChrgDeptCd'];
    vstdRiverUsrYn = json['vstdRiverUsrYn'];
    rcpmnyVtlactNo = json['rcpmnyVtlactNo'];
    vtlactNoUseYn = json['vtlactNoUseYn'];
    elctrRceptYn = json['elctrRceptYn'];
    applcLawDivCd = json['applcLawDivCd'];
    etcAtchflId = json['etcAtchflId'];
    usePrmisnDocAtchflId = json['usePrmisnDocAtchflId'];
    delYn = json['delYn'];
    frstRgstrId = json['frstRgstrId'];
    frstRegistDt = json['frstRegistDt'];
    lastUpdusrId = json['lastUpdusrId'];
    lastUpdtDt = json['lastUpdtDt'];
    conectIp = json['conectIp'];
    frstRgstrNm = json['frstRgstrNm'];
    lastUpdusrNm = json['lastUpdusrNm'];
    bcncNo = json['bcncNo'];
    applcntNm = json['applcntNm'];
    applcntRrnEnc = json['applcntRrnEnc'];
    applcntBizrno = json['applcntBizrno'];
    applcntZip = json['applcntZip'];
    applcntAddr = json['applcntAddr'];
    applcntTelno = json['applcntTelno'];
    applcntMbtlnum = json['applcntMbtlnum'];
    applcntFaxno = json['applcntFaxno'];
    applcntEmail = json['applcntEmail'];
    brthdy = json['brthdy'];
    drftNo = json['drftNo'];
    sanctnStatCd = json['sanctnStatCd'];
    bsnsNo = json['bsnsNo'];
    bsnsZoneNo = json['bsnsZoneNo'];
    sanctnDocNo = json['sanctnDocNo'];
    sanctnTit = json['sanctnTit'];
    sbmtDe = json['sbmtDe'];
    sanctnDe = json['sanctnDe'];
    accdtInvstgRm = json['accdtInvstgRm'];
    cmpnstnDtaCreatId = json['cmpnstnDtaCreatId'];
    ladCnt = json['ladCnt'];
    flflWrgrntiCnt = json['flflWrgrntiCnt'];
    conInKey = json['conInKey'];
    rgstNmbr = json['rgstNmbr'];
  }
  String? plotUseNo;
  String? natpblndOcpatUseNo;
  String? rqstDe;
  dynamic useRqstDtls;
  dynamic useRqstSbmtrNm;
  dynamic prmisnSpeclObsryMtt;
  String? prmisnApplcntDivCd;
  String? ladBtypDivCd;
  dynamic prmisnRqstDivCd;
  dynamic prmisnNo;
  String? usePrmisnYn;
  dynamic prmisnYnDcsnDe;
  dynamic useNnpmsnRsn;
  String? prmisnRqstDrftNo;
  dynamic nnpmsnDrftNo;
  String? chrgDeptCd;
  String? chrgDeptNm;
  dynamic chargerId;
  String? canclYn;
  String? usePrmisnRqstDrftYn;
  dynamic usePrmisnCntrctDivCd;
  dynamic damBsnsDivCd;
  dynamic prcsTmlmtDe;
  dynamic oldChrgDeptCd;
  String? vstdRiverUsrYn;
  dynamic rcpmnyVtlactNo;
  String? vtlactNoUseYn;
  String? elctrRceptYn;
  String? applcLawDivCd;
  dynamic etcAtchflId;
  dynamic usePrmisnDocAtchflId;
  String? delYn;
  String? frstRgstrId;
  String? frstRegistDt;
  String? lastUpdusrId;
  String? lastUpdtDt;
  String? conectIp;
  String? frstRgstrNm;
  String? lastUpdusrNm;
  dynamic bcncNo;
  String? applcntNm;
  String? applcntRrnEnc;
  dynamic applcntBizrno;
  String? applcntZip;
  String? applcntAddr;
  dynamic applcntTelno;
  String? applcntMbtlnum;
  dynamic applcntFaxno;
  dynamic applcntEmail;
  dynamic brthdy;
  dynamic drftNo;
  dynamic sanctnStatCd;
  dynamic bsnsNo;
  dynamic bsnsZoneNo;
  dynamic sanctnDocNo;
  dynamic sanctnTit;
  dynamic sbmtDe;
  dynamic sanctnDe;
  dynamic accdtInvstgRm;
  dynamic cmpnstnDtaCreatId;
  num? ladCnt;
  num? flflWrgrntiCnt;
  String? conInKey;
  String? rgstNmbr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['plotUseNo'] = plotUseNo;
    map['natpblndOcpatUseNo'] = natpblndOcpatUseNo;
    map['rqstDe'] = rqstDe;
    map['useRqstDtls'] = useRqstDtls;
    map['useRqstSbmtrNm'] = useRqstSbmtrNm;
    map['prmisnSpeclObsryMtt'] = prmisnSpeclObsryMtt;
    map['prmisnApplcntDivCd'] = prmisnApplcntDivCd;
    map['ladBtypDivCd'] = ladBtypDivCd;
    map['prmisnRqstDivCd'] = prmisnRqstDivCd;
    map['prmisnNo'] = prmisnNo;
    map['usePrmisnYn'] = usePrmisnYn;
    map['prmisnYnDcsnDe'] = prmisnYnDcsnDe;
    map['useNnpmsnRsn'] = useNnpmsnRsn;
    map['prmisnRqstDrftNo'] = prmisnRqstDrftNo;
    map['nnpmsnDrftNo'] = nnpmsnDrftNo;
    map['chrgDeptCd'] = chrgDeptCd;
    map['chrgDeptNm'] = chrgDeptNm;
    map['chargerId'] = chargerId;
    map['canclYn'] = canclYn;
    map['usePrmisnRqstDrftYn'] = usePrmisnRqstDrftYn;
    map['usePrmisnCntrctDivCd'] = usePrmisnCntrctDivCd;
    map['damBsnsDivCd'] = damBsnsDivCd;
    map['prcsTmlmtDe'] = prcsTmlmtDe;
    map['oldChrgDeptCd'] = oldChrgDeptCd;
    map['vstdRiverUsrYn'] = vstdRiverUsrYn;
    map['rcpmnyVtlactNo'] = rcpmnyVtlactNo;
    map['vtlactNoUseYn'] = vtlactNoUseYn;
    map['elctrRceptYn'] = elctrRceptYn;
    map['applcLawDivCd'] = applcLawDivCd;
    map['etcAtchflId'] = etcAtchflId;
    map['usePrmisnDocAtchflId'] = usePrmisnDocAtchflId;
    map['delYn'] = delYn;
    map['frstRgstrId'] = frstRgstrId;
    map['frstRegistDt'] = frstRegistDt;
    map['lastUpdusrId'] = lastUpdusrId;
    map['lastUpdtDt'] = lastUpdtDt;
    map['conectIp'] = conectIp;
    map['frstRgstrNm'] = frstRgstrNm;
    map['lastUpdusrNm'] = lastUpdusrNm;
    map['bcncNo'] = bcncNo;
    map['applcntNm'] = applcntNm;
    map['applcntRrnEnc'] = applcntRrnEnc;
    map['applcntBizrno'] = applcntBizrno;
    map['applcntZip'] = applcntZip;
    map['applcntAddr'] = applcntAddr;
    map['applcntTelno'] = applcntTelno;
    map['applcntMbtlnum'] = applcntMbtlnum;
    map['applcntFaxno'] = applcntFaxno;
    map['applcntEmail'] = applcntEmail;
    map['brthdy'] = brthdy;
    map['drftNo'] = drftNo;
    map['sanctnStatCd'] = sanctnStatCd;
    map['bsnsNo'] = bsnsNo;
    map['bsnsZoneNo'] = bsnsZoneNo;
    map['sanctnDocNo'] = sanctnDocNo;
    map['sanctnTit'] = sanctnTit;
    map['sbmtDe'] = sbmtDe;
    map['sanctnDe'] = sanctnDe;
    map['accdtInvstgRm'] = accdtInvstgRm;
    map['cmpnstnDtaCreatId'] = cmpnstnDtaCreatId;
    map['ladCnt'] = ladCnt;
    map['flflWrgrntiCnt'] = flflWrgrntiCnt;
    map['conInKey'] = conInKey;
    map['rgstNmbr'] = rgstNmbr;
    return map;
  }

}