import 'dart:convert';
/// ownerNm : "서울특별시"
/// bsnsNo : "2502"
/// bsnsZoneNo : "1"
/// ownerNo : "1000091655"
/// ownerRrnEnc : "fwYXxnCQHHLA/ZC5hfybdA=="
/// oldRegno : "fwYXxnCQHHLA/ZC5hfybdA=="
/// ownerTelno : null
/// ownerMbtlnum : null
/// rgsbukZip : null
/// delvyZip : null
/// moisZip : null
/// ownerRgsbukAddr : "서울특별시 종로구 교남동 5-6"
/// ownerDelvyAddr : null
/// ownerMoisAddr : null
/// accdtInvstgRm : null
/// frstRgstrId : "60004068"
/// frstRegistDt : 1650032938000
/// lastUpdusrId : "60004096"
/// lastUpdtDt : 1663334563000
/// conectIp : "127.0.0.1"
/// posesnDivCd : "04"
/// thingCnt : 2
/// bsnsCnt : 1
/// realOwnerNo : "1000091655"
/// ownerDivCd : "01"
/// ownerRgsbukAddrFull : "서울특별시 종로구 교남동 5-6"
/// ownerDelvyAddrFull : null
/// ownerMoisAddrFull : null

OwnerDataSourceModel ownerDatasourcModelFromJson(String str) => OwnerDataSourceModel.fromJson(json.decode(str));
String ownerDatasourcModelToJson(OwnerDataSourceModel data) => json.encode(data.toJson());

class OwnerDataSourceModel {
  OwnerDataSourceModel({
      this.ownerNm, 
      this.bsnsNo, 
      this.bsnsZoneNo, 
      this.ownerNo, 
      this.ownerRrnEnc, 
      this.oldRegno, 
      this.ownerTelno, 
      this.ownerMbtlnum, 
      this.rgsbukZip, 
      this.delvyZip, 
      this.moisZip, 
      this.ownerRgsbukAddr, 
      this.ownerDelvyAddr, 
      this.ownerMoisAddr, 
      this.accdtInvstgRm, 
      this.frstRgstrId, 
      this.frstRegistDt, 
      this.lastUpdusrId, 
      this.lastUpdtDt, 
      this.conectIp, 
      this.posesnDivCd,
      this.posesnDivNm,
      this.thingCnt, 
      this.bsnsCnt, 
      this.realOwnerNo, 
      this.ownerDivCd, 
      this.ownerRgsbukAddrFull, 
      this.ownerDelvyAddrFull, 
      this.ownerMoisAddrFull,});

  OwnerDataSourceModel.fromJson(dynamic json) {
    ownerNm = json['ownerNm'];
    bsnsNo = json['bsnsNo'];
    bsnsZoneNo = json['bsnsZoneNo'];
    ownerNo = json['ownerNo'];
    ownerRrnEnc = json['ownerRrnEnc'];
    oldRegno = json['oldRegno'];
    ownerTelno = json['ownerTelno'];
    ownerMbtlnum = json['ownerMbtlnum'];
    rgsbukZip = json['rgsbukZip'];
    delvyZip = json['delvyZip'];
    moisZip = json['moisZip'];
    ownerRgsbukAddr = json['ownerRgsbukAddr'];
    ownerDelvyAddr = json['ownerDelvyAddr'];
    ownerMoisAddr = json['ownerMoisAddr'];
    accdtInvstgRm = json['accdtInvstgRm'];
    frstRgstrId = json['frstRgstrId'];
    frstRegistDt = json['frstRegistDt'];
    lastUpdusrId = json['lastUpdusrId'];
    lastUpdtDt = json['lastUpdtDt'];
    conectIp = json['conectIp'];
    posesnDivCd = json['posesnDivCd'];
    posesnDivNm = json['posesnDivNm'];
    thingCnt = json['thingCnt'];
    bsnsCnt = json['bsnsCnt'];
    realOwnerNo = json['realOwnerNo'];
    ownerDivCd = json['ownerDivCd'];
    ownerRgsbukAddrFull = json['ownerRgsbukAddrFull'];
    ownerDelvyAddrFull = json['ownerDelvyAddrFull'];
    ownerMoisAddrFull = json['ownerMoisAddrFull'];
  }
  String? ownerNm;
  String? bsnsNo;
  String? bsnsZoneNo;
  String? ownerNo;
  String? ownerRrnEnc;
  String? oldRegno;
  dynamic ownerTelno;
  dynamic ownerMbtlnum;
  dynamic rgsbukZip;
  dynamic delvyZip;
  dynamic moisZip;
  String? ownerRgsbukAddr;
  dynamic ownerDelvyAddr;
  dynamic ownerMoisAddr;
  dynamic accdtInvstgRm;
  String? frstRgstrId;
  num? frstRegistDt;
  String? lastUpdusrId;
  num? lastUpdtDt;
  String? conectIp;
  String? posesnDivCd;
  String? posesnDivNm;
  num? thingCnt;
  num? bsnsCnt;
  String? realOwnerNo;
  String? ownerDivCd;
  String? ownerRgsbukAddrFull;
  dynamic ownerDelvyAddrFull;
  dynamic ownerMoisAddrFull;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ownerNm'] = ownerNm;
    map['bsnsNo'] = bsnsNo;
    map['bsnsZoneNo'] = bsnsZoneNo;
    map['ownerNo'] = ownerNo;
    map['ownerRrnEnc'] = ownerRrnEnc;
    map['oldRegno'] = oldRegno;
    map['ownerTelno'] = ownerTelno;
    map['ownerMbtlnum'] = ownerMbtlnum;
    map['rgsbukZip'] = rgsbukZip;
    map['delvyZip'] = delvyZip;
    map['moisZip'] = moisZip;
    map['ownerRgsbukAddr'] = ownerRgsbukAddr;
    map['ownerDelvyAddr'] = ownerDelvyAddr;
    map['ownerMoisAddr'] = ownerMoisAddr;
    map['accdtInvstgRm'] = accdtInvstgRm;
    map['frstRgstrId'] = frstRgstrId;
    map['frstRegistDt'] = frstRegistDt;
    map['lastUpdusrId'] = lastUpdusrId;
    map['lastUpdtDt'] = lastUpdtDt;
    map['conectIp'] = conectIp;
    map['posesnDivCd'] = posesnDivCd;
    map['posesnDivNm'] = posesnDivNm;
    map['thingCnt'] = thingCnt;
    map['bsnsCnt'] = bsnsCnt;
    map['realOwnerNo'] = realOwnerNo;
    map['ownerDivCd'] = ownerDivCd;
    map['ownerRgsbukAddrFull'] = ownerRgsbukAddrFull;
    map['ownerDelvyAddrFull'] = ownerDelvyAddrFull;
    map['ownerMoisAddrFull'] = ownerMoisAddrFull;
    return map;
  }

}