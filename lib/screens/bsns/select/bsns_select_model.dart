/// [BsnsSelectModel] 모델 클래스

// 사업선택
class BsnsSelectModel {

  String? title;
  String? subTitle;
  String? bizName;
  String? bizCount;
  String? bizArea;
  String? bizDate;
  bool? isExpand;
  bool? isSelect;
  String? no;
  String? areaNo;

  BsnsSelectModel({
    this.title,
    this.subTitle,
    this.bizName,
    this.bizCount,
    this.bizArea,
    this.bizDate,
    this.isExpand,
    this.isSelect,
    this.no,
    this.areaNo,
  });

  BsnsSelectModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subTitle'];
    bizName = json['bizName'];
    bizCount = json['bizCount'];
    bizArea = json['bizArea'];
    bizDate = json['bizDate'];
    isExpand = json['isExpand'];
    isSelect = json['isSelect'];
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
    data['isExpand'] = isExpand;
    data['isSelect'] = isSelect;
    data['no'] = no;
    data['areaNo'] = areaNo;
    return data;
  }

  @override
  String toString() {
    return toJson().toString().replaceAll(',', ',\n');
  }

}