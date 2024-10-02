import 'dart:convert';
/// usrId : "19900921"
/// usrEmpno : "19900921"
/// usrNm : "김상수"
/// sysGrpNm : null
/// usrDeptCd : "10950023"
/// usrDeptNm : "정보관리처"
/// usrOfcpsCd : "3010"
/// usrOfcpsNm : "차장"
/// usrJgrdCd : "0130"
/// usrJgrdNm : "3급"
/// usrHqCd : "50043825"
/// usrHqNm : "디지털혁신본부"
/// usrSectCd : "20060129"
/// usrSectNm : "정보서비스부"
/// usrTeamCd : "50041155"
/// usrTeamNm : "경영정보"
/// usrJbgpCd : "01"
/// usrJbgpNm : "일반직"
/// usrJblnCd : "0801"
/// usrJblnNm : "전산"
/// usrDtyCd : "48200128"
/// usrDtyNm : "정보시스템개발·운영"
/// cstctCd : "0000001104"
/// ldiCustVal1 : "LDICUSTVAL1"
/// ldiCustVal2 : "LDICUSTVAL2"
/// ldiCustVal3 : "LDICUSTVAL3"

List userModelSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = UserModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  UserModel({
      this.usrId, 
      this.usrEmpno, 
      this.usrNm, 
      this.sysGrpNm, 
      this.usrDeptCd, 
      this.usrDeptNm, 
      this.usrOfcpsCd, 
      this.usrOfcpsNm, 
      this.usrJgrdCd, 
      this.usrJgrdNm, 
      this.usrHqCd, 
      this.usrHqNm, 
      this.usrSectCd, 
      this.usrSectNm, 
      this.usrTeamCd, 
      this.usrTeamNm, 
      this.usrJbgpCd, 
      this.usrJbgpNm, 
      this.usrJblnCd, 
      this.usrJblnNm, 
      this.usrDtyCd, 
      this.usrDtyNm, 
      this.cstctCd, 
      this.ldiCustVal1, 
      this.ldiCustVal2, 
      this.ldiCustVal3,});

  UserModel.fromJson(dynamic json) {
    usrId = json['usrId'];
    usrEmpno = json['usrEmpno'];
    usrNm = json['usrNm'];
    sysGrpNm = json['sysGrpNm'];
    usrDeptCd = json['usrDeptCd'];
    usrDeptNm = json['usrDeptNm'];
    usrOfcpsCd = json['usrOfcpsCd'];
    usrOfcpsNm = json['usrOfcpsNm'];
    usrJgrdCd = json['usrJgrdCd'];
    usrJgrdNm = json['usrJgrdNm'];
    usrHqCd = json['usrHqCd'];
    usrHqNm = json['usrHqNm'];
    usrSectCd = json['usrSectCd'];
    usrSectNm = json['usrSectNm'];
    usrTeamCd = json['usrTeamCd'];
    usrTeamNm = json['usrTeamNm'];
    usrJbgpCd = json['usrJbgpCd'];
    usrJbgpNm = json['usrJbgpNm'];
    usrJblnCd = json['usrJblnCd'];
    usrJblnNm = json['usrJblnNm'];
    usrDtyCd = json['usrDtyCd'];
    usrDtyNm = json['usrDtyNm'];
    cstctCd = json['cstctCd'];
    ldiCustVal1 = json['ldiCustVal1'];
    ldiCustVal2 = json['ldiCustVal2'];
    ldiCustVal3 = json['ldiCustVal3'];
  }
  String? usrId;
  String? usrEmpno;
  String? usrNm;
  dynamic sysGrpNm;
  String? usrDeptCd;
  String? usrDeptNm;
  String? usrOfcpsCd;
  String? usrOfcpsNm;
  String? usrJgrdCd;
  String? usrJgrdNm;
  String? usrHqCd;
  String? usrHqNm;
  String? usrSectCd;
  String? usrSectNm;
  String? usrTeamCd;
  String? usrTeamNm;
  String? usrJbgpCd;
  String? usrJbgpNm;
  String? usrJblnCd;
  String? usrJblnNm;
  String? usrDtyCd;
  String? usrDtyNm;
  String? cstctCd;
  String? ldiCustVal1;
  String? ldiCustVal2;
  String? ldiCustVal3;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['usrId'] = usrId;
    map['usrEmpno'] = usrEmpno;
    map['usrNm'] = usrNm;
    map['sysGrpNm'] = sysGrpNm;
    map['usrDeptCd'] = usrDeptCd;
    map['usrDeptNm'] = usrDeptNm;
    map['usrOfcpsCd'] = usrOfcpsCd;
    map['usrOfcpsNm'] = usrOfcpsNm;
    map['usrJgrdCd'] = usrJgrdCd;
    map['usrJgrdNm'] = usrJgrdNm;
    map['usrHqCd'] = usrHqCd;
    map['usrHqNm'] = usrHqNm;
    map['usrSectCd'] = usrSectCd;
    map['usrSectNm'] = usrSectNm;
    map['usrTeamCd'] = usrTeamCd;
    map['usrTeamNm'] = usrTeamNm;
    map['usrJbgpCd'] = usrJbgpCd;
    map['usrJbgpNm'] = usrJbgpNm;
    map['usrJblnCd'] = usrJblnCd;
    map['usrJblnNm'] = usrJblnNm;
    map['usrDtyCd'] = usrDtyCd;
    map['usrDtyNm'] = usrDtyNm;
    map['cstctCd'] = cstctCd;
    map['ldiCustVal1'] = ldiCustVal1;
    map['ldiCustVal2'] = ldiCustVal2;
    map['ldiCustVal3'] = ldiCustVal3;
    return map;
  }

}