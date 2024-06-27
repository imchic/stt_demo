import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stt_demo/components/dialog_util.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'bsns_select_controller.dart';

/// [BsnsSelectScreen] 사업선택 화면
class BsnsSelectScreen extends GetView<BsnsController> {
  const BsnsSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BsnsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('사업선택'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // context menu
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(100, 100, 0, 100),
                items: [
                  PopupMenuItem(
                    child: Text('로그아웃'),
                    onTap: () {
                      print('로그아웃');
                      DialogUtil.showAlertDialog(context, '로그아웃', '로그아웃 하시겠습니까?', () {
                        // ok
                        //Navigator.of(context).pop();
                        //SystemNavigator.pop();
                      }, () {
                        // cancel
                        //Navigator.of(context).pop();
                      });
                    },
                  ),
                  PopupMenuItem(
                    child: Text('설정'),
                    onTap: () {
                      print('설정');
                    },
                  ),
                  PopupMenuItem(
                    child: Text('앱 종료'),
                    onTap: () {
                      print('앱 종료');
                      DialogUtil.showAlertDialog(context, '앱 종료', '앱을 종료하시겠습니까?', () {
                        // ok
                        //Navigator.of(context).pop();
                        //SystemNavigator.pop();
                      }, () {
                        // cancel
                        //Navigator.of(context).pop();
                      });
                    },
                  ),
                ],
              );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: buildDrawer(),
      body: Column(
        children: [
          buildRow1(),
          const SizedBox(height: 10),
          SizedBox(
            width: Get.width * 0.95,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade700,
                // shape
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onPressed: () {
                //controller.search();
              },
              child: const Text('조회',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Card listview
          Expanded(
            flex: 1,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 50,
              itemBuilder: (context, index) {
                return FutureBuilder(
                  future: controller.fetchItems(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return buildCard();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Card buildCard() {
    return Card(
      child: SizedBox(
        width: Get.width * 0.95,
        //height: Get.height * 0.45,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        //controller.search();
                      },
                      child: const Text('댐',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.purple.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        //controller.search();
                      },
                      child: const Text('건설',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '(5101102)대교천 재해예상사업(차수 : ㅇ)',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                '장군면 도계리 340~ 연기면 세종리 금강합류점검',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                '주관부서 : 수도개발처  I  ㅇㅇㅇ부   I   ㅇㅇㅇ팀  I   ㅇㅇㅇㅇ  I ㅇㅇㅇ  I ㅇㅇㅇㅇ',
                style: TextStyle(fontSize: 16),
              ),
              // more button
              const SizedBox(height: 10),
              Obx(
                () => SizedBox(
                  width: Get.width * 0.15,
                  child: Row(
                    children: [
                      const Text('상세내용', style: TextStyle(fontSize: 16)),
                      IconButton(
                        onPressed: () {
                          // controller.isExpanded.value = !controller.isExpanded.value;
                          // print(controller.isExpanded.value);
                          controller.isExpanded.toggle();
                        },
                        icon: controller.isExpanded.value
                            ? const Icon(Icons.arrow_drop_up, size: 24)
                            : const Icon(Icons.arrow_drop_down, size: 24),
                        iconSize: 24,
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (controller.isExpanded.value) {
                  return Column(
                    children: [
                      SizedBox(
                        width: Get.width * 0.95,
                        child: const Row(
                          children: [
                            Text('사업시작일'),
                            SizedBox(width: 10),
                            Text('2021-01-01'),
                            SizedBox(width: 10),
                            Text('사업종료일'),
                            SizedBox(width: 10),
                            Text('2021-12-31'),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: Get.width * 0.95,
                        child: const Row(
                          children: [
                            Text('승인일'),
                            SizedBox(width: 10),
                            Text('2021-01-01',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(width: 10),
                            Text('관보고시일'),
                            SizedBox(width: 10),
                            Text('2021-01-01',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(width: 10),
                            Text('준공일'),
                            SizedBox(width: 10),
                            Text('2021-01-01',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Table(
                          border: TableBorder.all(),
                          columnWidths: const {
                            0: FlexColumnWidth(0.35),
                            1: FlexColumnWidth(2),
                            2: FlexColumnWidth(1),
                            3: FlexColumnWidth(2),
                          },
                          defaultColumnWidth: const FlexColumnWidth(1),
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                    child: Container(
                                        width: 100,
                                        height: 50,
                                        child: const Center(
                                            child: Text('관련고시번호',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))))),
                                TableCell(
                                    child: Container(
                                        width: 100,
                                        height: 50,
                                        child: const Center(
                                            child: Text(
                                                '세종특별자치시 고시 제 2021-01호')))),
                                //TableCell(child: Center(child: Text('세종특별자치시 고시 제 2021-01호'))),
                              ],
                            ),
                            TableRow(
                              children: [
                                // TableCell(child: Center(child: Text('사업목적'))),
                                // TableCell(child: Center(child: Text('사업목적'))),
                                TableCell(
                                    child: Container(
                                        width: 100,
                                        height: 50,
                                        child: const Center(
                                            child: Text('시행방법',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))))),
                                TableCell(
                                    child: Container(
                                        width: 100,
                                        height: 50,
                                        child: const Center(child: Text('')))),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                      width: 100,
                                      height: 50,
                                      child: const Center(
                                          child: Text('사업목적',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold)))),
                                ),
                                TableCell(
                                  child: Container(
                                      width: 100,
                                      height: 50,
                                      child: const Center(
                                          child: Text(
                                              '홍수 범람 및 토지침하 예방을 위한 댐 건설'))),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                      width: 100,
                                      height: 50,
                                      child: const Center(
                                          child: Text('사업규모',
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold)))),
                                ),
                                TableCell(
                                  child: Container(
                                      width: 100,
                                      height: 50,
                                      child: const Center(child: Text('근거법령'))),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                    child: Container(
                                        width: 100,
                                        height: 50,
                                        child: const Center(
                                            child: Text('사업구역정보',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))))),
                                TableCell(
                                  child: Table(
                                    border: TableBorder.all(),
                                    columnWidths: const {
                                      0: FlexColumnWidth(1),
                                      1: FlexColumnWidth(1),
                                      2: FlexColumnWidth(1),
                                      3: FlexColumnWidth(1),
                                      4: FlexColumnWidth(1),
                                    },
                                    defaultColumnWidth:
                                        const FlexColumnWidth(1),
                                    children: [
                                      TableRow(
                                        children: [
                                          TableCell(
                                              child: Container(
                                                  width: 100,
                                                  height: 30,
                                                  child: const Center(
                                                      child: Text('구역번호')))),
                                          TableCell(
                                              child: Container(
                                                  width: 100,
                                                  height: 30,
                                                  child: const Center(
                                                      child: Text('구역명')))),
                                          TableCell(
                                              child: Container(
                                                  width: 100,
                                                  height: 30,
                                                  child: const Center(
                                                      child: Text('필지수')))),
                                          TableCell(
                                              child: Container(
                                                  width: 100,
                                                  height: 30,
                                                  child: const Center(
                                                      child: Text('면적')))),
                                          TableCell(
                                              child: Container(
                                                  width: 100,
                                                  height: 30,
                                                  child: const Center(
                                                      child: Text('열람공고일')))),
                                        ],
                                      ),
                                      TableRow(
                                        children: [
                                          TableCell(
                                              child: Container(
                                                  width: 100,
                                                  height: 30,
                                                  child: const Center(
                                                      child: Text('1')))),
                                          TableCell(
                                              child: Container(
                                                  width: 100,
                                                  height: 30,
                                                  child: const Center(
                                                      child: Text('대교천')))),
                                          TableCell(
                                              child: Container(
                                                  width: 100,
                                                  height: 30,
                                                  child: const Center(
                                                      child: Text('1')))),
                                          TableCell(
                                              child: Container(
                                                  width: 100,
                                                  height: 30,
                                                  child: const Center(
                                                      child: Text('1,000')))),
                                          TableCell(
                                              child: Container(
                                                  width: 100,
                                                  height: 30,
                                                  child: const Center(
                                                      child:
                                                          Text('2024-01-01')))),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ]),
                      buildSfDataGrid()
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/debrix_ci.png'),
              backgroundColor: Colors.white,
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/debrix_ci.png'),
                backgroundColor: Colors.white,
              )
            ],
            accountName: Text('test'),
            accountEmail: Text('test@gmail.com'),
            onDetailsPressed: () {
              print('arrow is clicked');
            },
            decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0))),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.grey[150]),
            title: Text('사업선택'),
            onTap: () {
              print('Home is clicked');
            },
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[150]),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.grey[150]),
            title: Text('소유자관리'),
            onTap: () {
              print('Setting is clicked');
            },
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.question_answer, color: Colors.grey[150]),
            title: Text('실태조사'),
            onTap: () {
              print('Q&A is clicked');
            },
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[150]),
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.grey[150]),
            title: Text('통계정보'),
            onTap: () {
              print('Info is clicked');
            },
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[150]),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.grey[150]),
            title: Text('고객카드'),
            onTap: () {
              print('Setting is clicked');
            },
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[150]),
          ),
        ],
      ),
    );
  }

  Widget buildNavigationRail() {
    return NavigationRail(
      selectedIndex: 0,
      onDestinationSelected: (index) {
        //controller.changeNavigationIndex(index);
      },
      labelType: NavigationRailLabelType.selected,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          selectedIcon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.info),
          selectedIcon: Icon(Icons.info),
          label: Text('Info'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings),
          selectedIcon: Icon(Icons.settings),
          label: Text('Settings'),
        ),
      ],
    );
  }

  Widget buildRow1() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('사업명'),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 30,
                  child: TextField(
                    controller: controller.searchController,
                    // border
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      //controller.search();
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Text('사업번호'),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 30,
                  child: TextField(
                    controller: controller.searchController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      //controller.search();
                    },
                  ),
                ),
              ),
            ],
          ),
          // radio button
          const SizedBox(height: 10),
          SizedBox(
            width: Get.width - 20,
            child: buildRadio(),
          ),
        ],
      ),
    );
  }

  Widget buildSfDataGrid() {
    return SfDataGrid(
      source: controller.dataSource.value,
      columnWidthMode: ColumnWidthMode.fill,
      showHorizontalScrollbar: true,
      showVerticalScrollbar: true,
      allowColumnsDragging: true,
      allowSorting: true,
      selectionMode: SelectionMode.single,
      headerGridLinesVisibility: GridLinesVisibility.both,
      columnSizer: ColumnSizer(),
      columns: <GridColumn>[
        GridColumn(
            columnName: 'no',
            allowSorting: true,
            label: Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: const Text(
                  'NO.',
                ))),
        GridColumn(
            columnName: 'areaNo',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('구역번호'))),
        GridColumn(
            columnName: 'bizName',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('사업구역명'))),
        GridColumn(
            columnName: 'bizCount',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('필지수'))),
        GridColumn(
            columnName: 'bizArea',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('면적'))),
        GridColumn(
            columnName: 'bizDate',
            label: Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text('열람공고일'))),
      ],
    );
  }

  Widget buildRadio() {
    return Row(
      children: [
        const Text('사업구분(대)', style: TextStyle(fontSize: 16)),
        Radio(
          value: 0,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        const Text('댐'),
        Radio(
          value: 1,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        const Text('수도용지'),
        Radio(
          value: 2,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        const Text('택지개발'),
        Radio(
          value: 3,
          groupValue: controller.radioValue.value,
          onChanged: (value) {
            //controller.changeRadioValue(value);
          },
        ),
        const Text('기타'),
      ],
    );
  }
}
