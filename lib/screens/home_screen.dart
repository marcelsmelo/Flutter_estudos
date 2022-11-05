import 'package:flutter/material.dart';
import 'package:login_provider_example/controllers/login_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;
  bool visible = false;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      print(scrollController.offset);
      bool newVisible = scrollController.offset >= 75;

      if (visible != newVisible) {
        setState(() {
          visible = newVisible;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('change');
    return Scaffold(
        body: CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          expandedHeight: 130,
          collapsedHeight: 60,
          //floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: visible ? Text("All Content Visible") : Text("Home Screen"),
            background: Image.network(
                "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                fit: BoxFit.cover),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<LoginController>(context, listen: false).logout();
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 150.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  height: 10,
                  width: 150,
                  color: Colors.red,
                );
              },
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 100,
                color: Colors.red,
              );
            },
            childCount: 10,
          ),
        )
      ],
    )

        // Column(
        //   children: [
        //     Container(
        //       height: MediaQuery.of(context).size.height * 0.2,
        //       child: ListView.builder(
        //         scrollDirection: Axis.horizontal,
        //         itemCount: 10,
        //         itemBuilder: ((context, index) {
        //           return Container(
        //             margin: EdgeInsets.all(10),
        //             height: 10,
        //             width: 100,
        //             color: Colors.red,
        //           );
        //         }),
        //       ),
        //     ),
        //     Container(
        //       margin:
        //           EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
        //       height: MediaQuery.of(context).size.height * 0.68,
        //       child: ListView.builder(
        //         scrollDirection: Axis.vertical,
        //         itemCount: 10,
        //         itemBuilder: ((context, index) {
        //           return Container(
        //             margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //             height: 100,
        //             color: Colors.red,
        //           );
        //         }),
        //       ),
        //     )
        //  ],
        // ),
        );
  }
}
