class Item{

  Item({this.no, this.areaNo, this.bizName, this.bizCount, this.bizArea, this.bizDate});

  int? no;
  int? areaNo;
  String? bizName;
  String? bizCount;
  String? bizArea;
  String? bizDate;

  @override
  String toString() {
    return 'Item{no: $no, areaNo: $areaNo, bizName: $bizName, bizCount: $bizCount, bizArea: $bizArea, bizDate: $bizDate}';
  }

}