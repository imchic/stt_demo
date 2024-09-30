import 'dart:convert';

List wpmThingDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = WtwkaccdtinvstgThingModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}


WtwkaccdtinvstgThingModel WtwkaccdtinvstgThingModelFromJson(String str) => WtwkaccdtinvstgThingModel.fromJson(json.decode(str));
String WtwkaccdtinvstgThingModelToJson(WtwkaccdtinvstgThingModel data) => json.encode(data.toJson());
class WtwkaccdtinvstgThingModel {
  WtwkaccdtinvstgThingModel({
    this.instThingMngNo, /* 설치물건관리번호 */
    this.ladSeq, /* 토지순번 */
    this.ocpatSeq, /* 점용순번 */
    this.instDe, /* 설치일 */
    this.instThingStndrdInfo, /* 설치물건규격정보 */
    this.pdm, /* 관경 */
    this.instWidthLcNo, /* 설치가로위치번호 */
    this.instHighLcNo, /* 설치세로위치번호 */
    this.instThingLt, /* 설치물건길이 */
    this.rlwayNm, /* 선로명 */
    this.gisRefrnKeyInfo, /* GIS참조키정보 */
    this.drwDc, /* 도면설명 */
    this.natpblndOcpatUseNo, /* 국유지점유사용번호 */
    this.instThingAtchflId, /* 설치물건첨부파일ID */
    this.instThingRm, /* 설치물건비고 */
    this.delYn, /* 삭제여부 */
    this.frstRgstrId, /* 최초등록자ID */
    this.frstRegistDt, /* 최초등록일시 */
    this.lastUpdtDt, /* 최종수정일시 */
    this.lastUpdusrId, /* 최종수정자ID */
    this.conectIp, /* 접속IP */
  });

  String? instThingMngNo;
  String? ladSeq;
  String? ocpatSeq;
  String? instDe;
  String? instThingStndrdInfo;
  String? pdm;
  String? instWidthLcNo;
  String? instHighLcNo;
  String? instThingLt;
  String? rlwayNm;
  String? gisRefrnKeyInfo;
  String? drwDc;
  String? natpblndOcpatUseNo;
  String? instThingAtchflId;
  String? instThingRm;
  String? delYn;
  String? frstRgstrId;
  String? frstRegistDt;
  String? lastUpdusrId;
  String? lastUpdtDt;
  String? conectIp;

  factory WtwkaccdtinvstgThingModel.fromJson(Map<String, dynamic> json) => WtwkaccdtinvstgThingModel(
    instThingMngNo: json["instThingMngNo"],
    ladSeq: json["ladSeq"],
    ocpatSeq: json["ocpatSeq"],
    instDe: json["instDe"],
    instThingStndrdInfo: json["instThingStndrdInfo"],
    pdm: json["pdm"],
    instWidthLcNo: json["instWidthLcNo"],
    instHighLcNo: json["instHighLcNo"],
    instThingLt: json["instThingLt"],
    rlwayNm: json["rlwayNm"],
    gisRefrnKeyInfo: json["gisRefrnKeyInfo"],
    drwDc: json["drwDc"],
    natpblndOcpatUseNo: json["natpblndOcpatUseNo"],
    instThingAtchflId: json["instThingAtchflId"],
    instThingRm: json["instThingRm"],
    delYn: json["delYn"],
    frstRgstrId: json["frstRgstrId"],
    frstRegistDt: json["frstRegistDt"],
    lastUpdusrId: json["lastUpdusrId"],
    lastUpdtDt: json["lastUpdtDt"],
    conectIp: json["conectIp"],
  );

  Map<String, dynamic> toJson() => {
    "instThingMngNo": instThingMngNo,
    "ladSeq": ladSeq,
    "ocpatSeq": ocpatSeq,
    "instDe": instDe,
    "instThingStndrdInfo": instThingStndrdInfo,
    "pdm": pdm,
    "instWidthLcNo": instWidthLcNo,
    "instHighLcNo": instHighLcNo,
    "instThingLt": instThingLt,
    "rlwayNm": rlwayNm,
    "gisRefrnKeyInfo": gisRefrnKeyInfo,
    "drwDc": drwDc,
    "natpblndOcpatUseNo": natpblndOcpatUseNo,
    "instThingAtchflId": instThingAtchflId,
    "instThingRm": instThingRm,
    "delYn": delYn,
    "frstRgstrId": frstRgstrId,
    "frstRegistDt": frstRegistDt,
    "lastUpdusrId": lastUpdusrId,
    "lastUpdtDt": lastUpdtDt,
    "conectIp": conectIp,
  };


}