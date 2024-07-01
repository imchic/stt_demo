class BsnsModel {

  String? title;
  String? subTitle;
  String? bizName;
  String? bizCount;
  String? bizArea;
  String? bizDate;
  bool? select;
  int? no;
  int? areaNo;

  BsnsModel({
    this.title,
    this.subTitle,
    this.bizName,
    this.bizCount,
    this.bizArea,
    this.bizDate,
    this.select,
    this.no,
    this.areaNo,
  });

  BsnsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subTitle'];
    bizName = json['bizName'];
    bizCount = json['bizCount'];
    bizArea = json['bizArea'];
    bizDate = json['bizDate'];
    select = json['select'];
    no = json['no'];
    areaNo = json['areaNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['bizName'] = bizName;
    data['bizCount'] = bizCount;
    data['bizArea'] = bizArea;
    data['bizDate'] = bizDate;
    data['select'] = select;
    data['no'] = no;
    data['areaNo'] = areaNo;
    return data;
  }

  @override
  String toString() {
    return toJson().toString().replaceAll(',', ',\n');
  }

}