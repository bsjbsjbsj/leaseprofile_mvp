import 'package:flutter/material.dart';
import 'package:flutter_leaseprofile/model/fakeModel.dart';
import 'package:flutter_leaseprofile/provider/postProvier.dart';
import 'package:flutter_leaseprofile/repository/fetchData.dart';
import 'package:provider/provider.dart';

class EstimatePage extends StatefulWidget {
  const EstimatePage({Key? key}) : super(key: key);

  @override
  _EstimatePageState createState() => _EstimatePageState();
}

class _EstimatePageState extends State<EstimatePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Widget> estimateList = [
    Tab(text: '스튜디오'),
    Tab(text: '메이크업'),
    Tab(text: '사진사'),
    Tab(text: '왁싱'),
    Tab(text: '태닝'),
    Tab(text: '패키지'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: estimateList.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: TabBar(
            tabs: estimateList,
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            labelColor: Colors.black,
            indicatorColor: Colors.transparent,
          ),
        ),
        Container(
          height: 1000,
          child: TabBarView(
            controller: _tabController,
            children: [
              Mystudio(),
              Mymakeup(),
              Myphotographer(),
              Mywaxing(),
              Mytanning(),
              Mypackage(),
            ],
          ),
        )
      ],
    );
  }
}

class Mystudio extends StatefulWidget {
  const Mystudio({Key? key}) : super(key: key);

  @override
  State<Mystudio> createState() => _MystudioState();
}

class _MystudioState extends State<Mystudio> {
  bool? _ischecked = false;
  List<Widget> Mystudiolist = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4.0,
              child: ListTile(
                leading: Checkbox(
                  activeColor: Colors.green,
                  value: _ischecked,
                  onChanged: (value) {
                    setState(() {
                      _ischecked = value;
                    });
                  },
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/1.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('제이스튜디오'),
                          Text(
                            '최상급 조명 장비 비치완료, 가성비 값',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('옵션 선택'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('상품금액',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            )),
                        Text(
                          '100,000원',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            '삭제하기',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '예약하기',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class Mymakeup extends StatefulWidget {
  const Mymakeup({Key? key}) : super(key: key);

  @override
  State<Mymakeup> createState() => _MymakeupState();
}

class _MymakeupState extends State<Mymakeup> {
  PostProvider _postProvider = PostProvider();

  @override
  Widget build(BuildContext context) {
    _postProvider = Provider.of<PostProvider>(context, listen: false);
    return Container(child: Text(_postProvider.shops[0].desc!.hash.toString()));
  }
}

class Myphotographer extends StatelessWidget {
  const Myphotographer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Mywaxing extends StatelessWidget {
  const Mywaxing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Mytanning extends StatelessWidget {
  const Mytanning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Mypackage extends StatelessWidget {
  const Mypackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
