import 'dart:convert';
/// bsnsNo : "3015"
/// bsnsZoneNo : "1"
/// thingSerNo : "L-0000003015-0001-3611039023-1-0155-0000-000001"
/// ownerNo : "1000083328"
/// posesnDivCd : "03"
/// posesnShreDnmntrInfo : "1"
/// posesnShreNmrtrInfo : "1"
/// realOwnerNo : "1000083328"
/// oldRealOwnerNo : "1000083328"
/// obstSeq : null
/// wtnessYn : "N"
/// chnCtnt : null
/// cmpnstnStepDivCd : null
/// sttusLndcgrDivCd : null
/// accdtInvstgRm : null
/// ownerAtchflId : null
/// lnkNo : null
/// ownerNm : "박희수"
/// ownerRrnEnc : "7611021451217"
/// ownerMbtlnum : "01034337339"
/// ownerTelno : null
/// rgsbukZip : "30001"
/// ownerRgsbukAddr : "세종특별자치시 소정면 대사동길 131-3, "
/// delvyZip : "30001"
/// ownerDelvyAddr : "세종특별자치시 소정면 대사동길 131-3, "
/// moisZip : null
/// ownerMoisAddr : null
/// frstRgstrId : "20162970"
/// frstRegistDt : 1504141414000
/// lastUpdusrId : "20162970"
/// lastUpdtDt : 1504141414000
/// conectIp : "172.20.161.15"
/// oldownerno : "1000083328"
/// ownerDivCd : "01"

List accdtlnvstgLadOwnerDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = AccdtlnvstgLadOwnerModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

AccdtlnvstgLadOwnerModel AccdtlnvstgLadOwnerModelFromJson(String str) => AccdtlnvstgLadOwnerModel.fromJson(json.decode(str));
String AccdtlnvstgLadOwnerModelToJson(AccdtlnvstgLadOwnerModel data) => json.encode(data.toJson());
class AccdtlnvstgLadOwnerModel {
  AccdtlnvstgLadOwnerModel({
    this.bsnsNo,
    this.bsnsZoneNo,
    this.thingSerNo,
    this.ownerNo,
    this.posesnDivCd,
    this.posesnShreDnmntrInfo,
    this.posesnShreNmrtrInfo,
    this.realOwnerNo,
    this.oldRealOwnerNo,
    this.obstSeq,
    this.wtnessYn,
    this.chnCtnt,
    this.cmpnstnStepDivCd,
    this.sttusLndcgrDivCd,
    this.accdtInvstgRm,
    this.ownerAtchflId,
    this.lnkNo,
    this.ownerNm,
    this.ownerRrnEnc,
    this.ownerMbtlnum,
    this.ownerTelno,
    this.rgsbukZip,
    this.ownerRgsbukAddr,
    this.delvyZip,
    this.ownerDelvyAddr,
    this.moisZip,
    this.ownerMoisAddr,
    this.frstRgstrId,
    this.frstRegistDt,
    this.lastUpdusrId,
    this.lastUpdtDt,
    this.conectIp,
    this.oldownerno,
    this.ownerDivCd,});

  AccdtlnvstgLadOwnerModel.fromJson(dynamic json) {
    bsnsNo = json['bsnsNo'];
    bsnsZoneNo = json['bsnsZoneNo'];
    thingSerNo = json['thingSerNo'];
    ownerNo = json['ownerNo'];
    posesnDivCd = json['posesnDivCd'];
    posesnShreDnmntrInfo = json['posesnShreDnmntrInfo'];
    posesnShreNmrtrInfo = json['posesnShreNmrtrInfo'];
    realOwnerNo = json['realOwnerNo'];
    oldRealOwnerNo = json['oldRealOwnerNo'];
    obstSeq = json['obstSeq'];
    wtnessYn = json['wtnessYn'];
    chnCtnt = json['chnCtnt'];
    cmpnstnStepDivCd = json['cmpnstnStepDivCd'];
    sttusLndcgrDivCd = json['sttusLndcgrDivCd'];
    accdtInvstgRm = json['accdtInvstgRm'];
    ownerAtchflId = json['ownerAtchflId'];
    lnkNo = json['lnkNo'];
    ownerNm = json['ownerNm'];
    ownerRrnEnc = json['ownerRrnEnc'];
    ownerMbtlnum = json['ownerMbtlnum'];
    ownerTelno = json['ownerTelno'] ?? '';
    rgsbukZip = json['rgsbukZip'];
    ownerRgsbukAddr = json['ownerRgsbukAddr'];
    delvyZip = json['delvyZip'];
    ownerDelvyAddr = json['ownerDelvyAddr'];
    moisZip = json['moisZip'];
    ownerMoisAddr = json['ownerMoisAddr'];
    frstRgstrId = json['frstRgstrId'];
    frstRegistDt = json['frstRegistDt'];
    lastUpdusrId = json['lastUpdusrId'];
    lastUpdtDt = json['lastUpdtDt'];
    conectIp = json['conectIp'];
    oldownerno = json['oldownerno'];
    ownerDivCd = json['ownerDivCd'];
  }
  String? bsnsNo;
  String? bsnsZoneNo;
  String? thingSerNo;
  String? ownerNo;
  String? posesnDivCd;
  String? posesnShreDnmntrInfo;
  String? posesnShreNmrtrInfo;
  String? realOwnerNo;
  String? oldRealOwnerNo;
  dynamic obstSeq;
  String? wtnessYn;
  dynamic chnCtnt;
  dynamic cmpnstnStepDivCd;
  dynamic sttusLndcgrDivCd;
  dynamic accdtInvstgRm;
  dynamic ownerAtchflId;
  dynamic lnkNo;
  String? ownerNm;
  String? ownerRrnEnc;
  String? ownerMbtlnum;
  dynamic ownerTelno;
  String? rgsbukZip;
  String? ownerRgsbukAddr;
  String? delvyZip;
  String? ownerDelvyAddr;
  dynamic moisZip;
  dynamic ownerMoisAddr;
  String? frstRgstrId;
  num? frstRegistDt;
  String? lastUpdusrId;
  num? lastUpdtDt;
  String? conectIp;
  String? oldownerno;
  String? ownerDivCd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bsnsNo'] = bsnsNo;
    map['bsnsZoneNo'] = bsnsZoneNo;
    map['thingSerNo'] = thingSerNo;
    map['ownerNo'] = ownerNo;
    map['posesnDivCd'] = posesnDivCd;
    map['posesnShreDnmntrInfo'] = posesnShreDnmntrInfo;
    map['posesnShreNmrtrInfo'] = posesnShreNmrtrInfo;
    map['realOwnerNo'] = realOwnerNo;
    map['oldRealOwnerNo'] = oldRealOwnerNo;
    map['obstSeq'] = obstSeq;
    map['wtnessYn'] = wtnessYn;
    map['chnCtnt'] = chnCtnt;
    map['cmpnstnStepDivCd'] = cmpnstnStepDivCd;
    map['sttusLndcgrDivCd'] = sttusLndcgrDivCd;
    map['accdtInvstgRm'] = accdtInvstgRm;
    map['ownerAtchflId'] = ownerAtchflId;
    map['lnkNo'] = lnkNo;
    map['ownerNm'] = ownerNm;
    map['ownerRrnEnc'] = ownerRrnEnc;
    map['ownerMbtlnum'] = ownerMbtlnum;
    map['ownerTelno'] = ownerTelno;
    map['rgsbukZip'] = rgsbukZip;
    map['ownerRgsbukAddr'] = ownerRgsbukAddr;
    map['delvyZip'] = delvyZip;
    map['ownerDelvyAddr'] = ownerDelvyAddr;
    map['moisZip'] = moisZip;
    map['ownerMoisAddr'] = ownerMoisAddr;
    map['frstRgstrId'] = frstRgstrId;
    map['frstRegistDt'] = frstRegistDt;
    map['lastUpdusrId'] = lastUpdusrId;
    map['lastUpdtDt'] = lastUpdtDt;
    map['conectIp'] = conectIp;
    map['oldownerno'] = oldownerno;
    map['ownerDivCd'] = ownerDivCd;
    return map;
  }

}