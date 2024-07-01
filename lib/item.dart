class Item {

  Item({
      this.select = false,
      this.no,
      this.areaNo,
      this.bizName,
      this.bizCount,
      this.bizArea,
      this.bizDate
  });

  bool select = false;
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
