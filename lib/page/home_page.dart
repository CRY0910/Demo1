import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo1/page/detail_page.dart';
import 'package:flutter/material.dart';

import '../data/CurrencyInfo.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<String> entryList = <String>['BTC', 'ETH', 'TRX','UNI'];
  final List<String> imgList = <String>['assets/btc.png', 'assets/eth.png', 'assets/trx.png','assets/uni.png'];
  final List<String> priceList = <String>['30442.2', '2084.96', '0.07745','5.808'];
  @override
  Widget build(BuildContext context) {
    var tabs = <String>[];
    tabs = <String>[
      "行情",
      "熱門",
      "自選",
    ];

    return Scaffold(
      appBar: const GetAppBarWidget(),
      body:

      /// 加TabBar
      DefaultTabController(
        length: tabs.length, // This is the number of tabs.
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  pinned: true,
                  floating: true,
                  snap: false,
                  expandedHeight: 260.0,
                  elevation: 0,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: FlexibleSpaceBar(
                    background: CarouselSlider(
                      items: [
                        //1st Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage("assets/1.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage("assets/2.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //3rd Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage("assets/3.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //4th Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage("assets/4.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        //5th Image of Slider
                        Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: const DecorationImage(
                              image: AssetImage("assets/5.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: false,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                    ),
                  ),
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: tabs.map((String name) {
              //SafeArea 适配刘海屏的一个widget
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                          NestedScrollView.sliverOverlapAbsorberHandleFor(
                              context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(5.0),
                          sliver: SliverFixedExtentList(
                            itemExtent: 60.0, //item高度或宽度，取决于滑动方向
                            delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                return GestureDetector(
                                  child: Container(
                                    child:Row(children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Image.asset(
                                          imgList[index%4],
                                          width: 100.0,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top:10),
                                      ),
                                      Text(
                                        entryList[index%4],
                                        style: const TextStyle(fontSize: 20.0),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Padding(
                                        padding: const EdgeInsets.only(right:30),
                                        child:Text(
                                          priceList[index%4],
                                          style: const TextStyle(fontSize: 20.0),
                                        ),
                                      ),

                                    ],
                                  ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailPage(currencyInfo: CurrencyInfo(entryList[index%4], priceList[index%4])),
                                        ),);




                                  },
                                );
                              },
                              childCount: 16,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}


class GetAppBarWidget extends StatelessWidget implements PreferredSizeWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      centerTitle: true,
      title:  const Text("BOX"),
      elevation: 0.0, //shade
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => {},
        ),
        IconButton(
          icon: const Icon(Icons.supervisor_account),
          onPressed: () => {},
        ),
      ],
    );
  }



  const GetAppBarWidget({Key? key}) :super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);


  Size getSize() {
    return const Size(100.0, 100.0);
  }
}

