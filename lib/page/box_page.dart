
import 'package:flutter/material.dart';

import '../tool/CirclePainter.dart';


class BoxPage extends StatefulWidget {
  const BoxPage({Key? key}) : super(key: key);

  @override
  State<BoxPage> createState() => BoxPageState();
}

class BoxPageState extends State<BoxPage> {
  // generate dummy data to feed the second SliverGrid
  final List<String> imgList = <String>['assets/game1.png','assets/game2.png', 'assets/game3.png', 'assets/game4.png', 'assets/game5.png', 'assets/game6.png', 'assets/game7.png', 'assets/game8.png', 'assets/game9.png', 'assets/game10.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BOX'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => {},
          ),
          IconButton(
            icon: const Icon(Icons.account_balance_wallet_outlined),
            onPressed: () => {},
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
            height: Axis.vertical == Axis.vertical ? double.infinity : 210.0,
            child:CustomScrollView(slivers: <Widget>[
              SliverGrid.count(
                crossAxisCount: 1,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 2,
                children: [
                  Card(
                    child: Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/4.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),

              const SliverPadding(padding: EdgeInsets.symmetric(vertical: 6)),


              // SliverGrid #1
              SliverGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 2.5,
                children: [
                  Card(
                      child: Container(
                          padding: const EdgeInsets.fromLTRB(6, 6, 0, 0),
                          child: const Text('已鑄造',style: TextStyle(color: Colors.blue,),
                          )
                      )
                  ),
                  Card(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(6, 6, 0, 0),
                        child: const Text('上架中',style: TextStyle(color: Colors.blue,),
                        )
                    ),
                  ),
                ],
              ),

              //排行榜
              SliverToBoxAdapter(
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0,10),
                          child: const Text('排行榜',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold,),
                          )
                      ),
                      const Expanded(child: SizedBox()),


                      Container(

                        padding: const EdgeInsets.fromLTRB(0,0, 10,0),
                        child:const Text('更多'),)
                    ],
                  )
              ),

              SliverToBoxAdapter(
                child: SizedBox(
                  height: 150.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Row(
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0,80),
                                child:  Text((index+1).toString(),style: const TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold,),
                                )
                            ),
                            SizedBox(
                                width: 140.0,
                                height: 150.0,
                                child: Column(
                                    children: <Widget>[Card( child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      margin: const EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.0),
                                        image:  DecorationImage(
                                          image: AssetImage(imgList[index]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    ),
                                      Text('GAME${index+1}')]
                                )
                            )
                          ]

                      );
                    },
                  ),
                ),
              ),

              //探索
              SliverToBoxAdapter(
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0,10),
                          child: const Text('探索',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold,),
                          )
                      ),
                      const Expanded(child: SizedBox()),


                      Container(

                        padding: const EdgeInsets.fromLTRB(0,0, 10,0),
                        child:const Text('更多'),)
                    ],
                  )
              ),

              SliverToBoxAdapter(
                child : SizedBox(
                  width: 210.0,
                  height: 320.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 210.0,
                        height: 320.0,
                        child: Card(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: <Widget>[
                                  Container(
                                    width: 200.0,
                                    height: 220.0,
                                    alignment:Alignment.topLeft,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image:  DecorationImage(
                                        image: AssetImage(imgList[index]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),


                                  Container(
                                      padding: const EdgeInsets.fromLTRB(6, 10, 0,0),
                                      child: const Text('NFT Battle Miners',style: TextStyle(fontSize: 12,),
                                      )
                                  ),
                                  Container(

                                      padding: const EdgeInsets.fromLTRB(6, 6, 0,0),
                                      child: const Text('Transooter Z',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold,),
                                      )
                                  ),
                                  Row( children: <Widget>[
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(6, 0, 0,0),
                                        child: CustomPaint(
                                          size: const Size(20, 20),
                                          painter: CirclePainter(),
                                        )),Container(
                                        padding: const EdgeInsets.fromLTRB(6,0 , 0,0),
                                        child: const Text('90.0',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,),
                                        )
                                    ),

                                    Container(
                                      padding: const EdgeInsets.fromLTRB(90,0 , 0,0),
                                      child: const FittedBox(fit: BoxFit.fill, child: Icon(Icons.add_circle_outline)),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(6,0 , 0,0),
                                        child: const Text('0',style: TextStyle(color: Colors.black,fontSize: 16),
                                        )
                                    ),
                                  ]),

                                ],
                              ),

                            ],
                          ),
                        ),

                      );



                    },
                  ),
                ),
              ),

              //作品集
              SliverToBoxAdapter(
                  child: Row(
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0,10),
                          child: const Text('作品集',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold,),
                          )
                      ),
                      const Expanded(child: SizedBox()),


                      Container(

                        padding: const EdgeInsets.fromLTRB(0,0, 10,0),
                        child:const Text('更多'),)
                    ],
                  )
              ),

              SliverToBoxAdapter(
                child : SizedBox(
                  width: 210.0,
                  height: 280.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 210.0,
                        height: 280.0,
                        child: Card(

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment:MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: <Widget>[
                                  Container(
                                    width: 200.0,
                                    height: 200.0,
                                    alignment:Alignment.topLeft,
                                    color: Colors.blue[100],
                                  ),

                                  Row(children: <Widget>[
                                    Container(
                                        padding: const EdgeInsets.fromLTRB(6, 14, 0,0),
                                        child: const Text('65222',style: TextStyle(fontSize: 12,),
                                        )
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(10,12 , 0,0),
                                      child: const FittedBox(fit: BoxFit.fill, child: Icon(Icons.accessibility)),
                                    ),
                                  ]),

                                  Container(

                                      padding: const EdgeInsets.fromLTRB(6, 8, 0,0),
                                      child: const Text('Transooter Z',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),
                                      )
                                  ),


                                ],
                              ),

                            ],
                          ),
                        ),

                      );



                    },
                  ),
                ),
              ),


              // Just add some padding
              const SliverPadding(padding: EdgeInsets.symmetric(vertical: 20)),




            ],
            )
        ),
      ),
    );
  }
}
