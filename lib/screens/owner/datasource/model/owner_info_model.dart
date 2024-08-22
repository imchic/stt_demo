import 'dart:convert';
/// ownerNo : "1000023417"
/// ownerRrnEnc : "kWmCJDEHHteTeCgtzjBHUQ=="
/// ownerNm : "권오승"
/// ownerTelno : null
/// ownerMbtlnum : "01048093213"
/// rgsbukZip : "380772"
/// delvyZip : "380772"
/// moisZip : null
/// ownerRgsbukAddr : "충북 충주시 국원대로 166, 103동 903호"
/// ownerDelvyAddr : "충북 충주시 국원대로 166, 103동 903호"
/// ownerMoisAddr : null
/// accdtInvstgRm : null
/// posesnDivCd : "03"
/// ownerDivCd : "01"
/// chnSqnc : null
/// cmpnstnDtaCreatId : null
/// bcncNo : null
/// delYn : "N"
/// frstRgstrId : "MIG"
/// frstRegistDt : 1443679899000
/// lastUpdusrId : "MIG"
/// lastUpdtDt : 1443679886000
/// conectIp : "168"

OwnerInfoModel ownerInfoModelFromJson(String str) => OwnerInfoModel.fromJson(json.decode(str));
String ownerInfoModelToJson(OwnerInfoModel data) => json.encode(data.toJson());
class OwnerInfoModel {
  OwnerInfoModel({
      this.ownerNo, 
      this.ownerRrnEnc, 
      this.ownerNm, 
      this.ownerTelno, 
      this.ownerMbtlnum, 
      this.rgsbukZip, 
      this.delvyZip, 
      this.moisZip, 
      this.ownerRgsbukAddr, 
      this.ownerDelvyAddr, 
      this.ownerMoisAddr, 
      this.accdtInvstgRm, 
      this.posesnDivCd, 
      this.ownerDivCd, 
      this.chnSqnc, 
      this.cmpnstnDtaCreatId, 
      this.bcncNo, 
      this.delYn, 
      this.frstRgstrId, 
      this.frstRegistDt, 
      this.lastUpdusrId, 
      this.lastUpdtDt, 
      this.conectIp,});

  OwnerInfoModel.fromJson(dynamic json) {
    ownerNo = json['ownerNo'];
    ownerRrnEnc = json['ownerRrnEnc'];
    ownerNm = json['ownerNm'];
    ownerTelno = json['ownerTelno'];
    ownerMbtlnum = json['ownerMbtlnum'];
    rgsbukZip = json['rgsbukZip'];
    delvyZip = json['delvyZip'];
    moisZip = json['moisZip'];
    ownerRgsbukAddr = json['ownerRgsbukAddr'];
    ownerDelvyAddr = json['ownerDelvyAddr'];
    ownerMoisAddr = json['ownerMoisAddr'];
    accdtInvstgRm = json['accdtInvstgRm'];
    posesnDivCd = json['posesnDivCd'];
    ownerDivCd = json['ownerDivCd'];
    chnSqnc = json['chnSqnc'];
    cmpnstnDtaCreatId = json['cmpnstnDtaCreatId'];
    bcncNo = json['bcncNo'];
    delYn = json['delYn'];
    frstRgstrId = json['frstRgstrId'];
    frstRegistDt = json['frstRegistDt'];
    lastUpdusrId = json['lastUpdusrId'];
    lastUpdtDt = json['lastUpdtDt'];
    conectIp = json['conectIp'];
  }
  String? ownerNo;
  String? ownerRrnEnc;
  String? ownerNm;
  dynamic ownerTelno;
  String? ownerMbtlnum;
  String? rgsbukZip;
  String? delvyZip;
  dynamic moisZip;
  String? ownerRgsbukAddr;
  String? ownerDelvyAddr;
  dynamic ownerMoisAddr;
  dynamic accdtInvstgRm;
  String? posesnDivCd;
  String? ownerDivCd;
  dynamic chnSqnc;
  dynamic cmpnstnDtaCreatId;
  dynamic bcncNo;
  String? delYn;
  String? frstRgstrId;
  num? frstRegistDt;
  String? lastUpdusrId;
  num? lastUpdtDt;
  String? conectIp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ownerNo'] = ownerNo;
    map['ownerRrnEnc'] = ownerRrnEnc;
    map['ownerNm'] = ownerNm;
    map['ownerTelno'] = ownerTelno;
    map['ownerMbtlnum'] = ownerMbtlnum;
    map['rgsbukZip'] = rgsbukZip;
    map['delvyZip'] = delvyZip;
    map['moisZip'] = moisZip;
    map['ownerRgsbukAddr'] = ownerRgsbukAddr;
    map['ownerDelvyAddr'] = ownerDelvyAddr;
    map['ownerMoisAddr'] = ownerMoisAddr;
    map['accdtInvstgRm'] = accdtInvstgRm;
    map['posesnDivCd'] = posesnDivCd;
    map['ownerDivCd'] = ownerDivCd;
    map['chnSqnc'] = chnSqnc;
    map['cmpnstnDtaCreatId'] = cmpnstnDtaCreatId;
    map['bcncNo'] = bcncNo;
    map['delYn'] = delYn;
    map['frstRgstrId'] = frstRgstrId;
    map['frstRegistDt'] = frstRegistDt;
    map['lastUpdusrId'] = lastUpdusrId;
    map['lastUpdtDt'] = lastUpdtDt;
    map['conectIp'] = conectIp;
    return map;
  }

}