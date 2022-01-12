import 'package:flutter/material.dart';

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
            labelColor: Colors.black,
            indicatorColor: Colors.transparent,
          ),
        ),
        Container(
          height: 300,
          child: TabBarView(
            controller: _tabController,
            children: [
              Mystudio(),
              Mymakeup(),
            ],
          ),
        )
      ],
    );
  }
}

class Mystudio extends StatelessWidget {
  const Mystudio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class Mymakeup extends StatelessWidget {
  const Mymakeup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}
