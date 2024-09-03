import 'dart:convert';
/// bsnsNo : "3015"
/// bsnsZoneNo : "1"
/// thingSerNo : "L-0000003015-0001-3611039023-1-0474-0018-000001"
/// ownerNo : "1000083354"
/// partcpntSeq : "1"
/// cmpnstnPartcpntRsn : "근저당권"
/// partcpntNm : "(주)국민은행"
/// partcpntAddr : "서울특별시 중구 남대문로 84(을지로2가)"
/// partcpntTelno : null
/// partcpntMbtlnum : null
/// partcpntZip : "04534"
/// partcpntRghtKndInfo : null
/// frstRgstrId : "20162970"
/// frstRegistDt : 1504593158000
/// lastUpdusrId : "20162970"
/// lastUpdtDt : 1504593158000
/// conectIp : "172.20.161.15"

List accdtlnvstgLadPartcpntDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = AccdtlnvstgLadPartcpntModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

AccdtlnvstgLadPartcpntModel AccdtlnvstgLadPartcpntModelFromJson(String str) => AccdtlnvstgLadPartcpntModel.fromJson(json.decode(str));
String AccdtlnvstgLadPartcpntModelToJson(AccdtlnvstgLadPartcpntModel data) => json.encode(data.toJson());
class AccdtlnvstgLadPartcpntModel {
  AccdtlnvstgLadPartcpntModel({
    this.bsnsNo,
    this.bsnsZoneNo,
    this.thingSerNo,
    this.ownerNo,
    this.partcpntSeq,
    this.cmpnstnPartcpntRsn,
    this.partcpntNm,
    this.partcpntAddr,
    this.partcpntTelno,
    this.partcpntMbtlnum,
    this.partcpntZip,
    this.partcpntRghtKndInfo,
    this.frstRgstrId,
    this.frstRegistDt,
    this.lastUpdusrId,
    this.lastUpdtDt,
    this.conectIp,});

  AccdtlnvstgLadPartcpntModel.fromJson(dynamic json) {
    bsnsNo = json['bsnsNo'];
    bsnsZoneNo = json['bsnsZoneNo'];
    thingSerNo = json['thingSerNo'];
    ownerNo = json['ownerNo'];
    partcpntSeq = json['partcpntSeq'];
    cmpnstnPartcpntRsn = json['cmpnstnPartcpntRsn'];
    partcpntNm = json['partcpntNm'];
    partcpntAddr = json['partcpntAddr'];
    partcpntTelno = json['partcpntTelno'];
    partcpntMbtlnum = json['partcpntMbtlnum'];
    partcpntZip = json['partcpntZip'];
    partcpntRghtKndInfo = json['partcpntRghtKndInfo'];
    frstRgstrId = json['frstRgstrId'];
    frstRegistDt = json['frstRegistDt'];
    lastUpdusrId = json['lastUpdusrId'];
    lastUpdtDt = json['lastUpdtDt'];
    conectIp = json['conectIp'];
  }
  String? bsnsNo;
  String? bsnsZoneNo;
  String? thingSerNo;
  String? ownerNo;
  String? partcpntSeq;
  String? cmpnstnPartcpntRsn;
  String? partcpntNm;
  String? partcpntAddr;
  dynamic partcpntTelno;
  dynamic partcpntMbtlnum;
  String? partcpntZip;
  dynamic partcpntRghtKndInfo;
  String? frstRgstrId;
  num? frstRegistDt;
  String? lastUpdusrId;
  num? lastUpdtDt;
  String? conectIp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bsnsNo'] = bsnsNo;
    map['bsnsZoneNo'] = bsnsZoneNo;
    map['thingSerNo'] = thingSerNo;
    map['ownerNo'] = ownerNo;
    map['partcpntSeq'] = partcpntSeq;
    map['cmpnstnPartcpntRsn'] = cmpnstnPartcpntRsn;
    map['partcpntNm'] = partcpntNm;
    map['partcpntAddr'] = partcpntAddr;
    map['partcpntTelno'] = partcpntTelno;
    map['partcpntMbtlnum'] = partcpntMbtlnum;
    map['partcpntZip'] = partcpntZip;
    map['partcpntRghtKndInfo'] = partcpntRghtKndInfo;
    map['frstRgstrId'] = frstRgstrId;
    map['frstRegistDt'] = frstRegistDt;
    map['lastUpdusrId'] = lastUpdusrId;
    map['lastUpdtDt'] = lastUpdtDt;
    map['conectIp'] = conectIp;
    return map;
  }

}