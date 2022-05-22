import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[

          const SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title:Text("111"),
            centerTitle: true,
            collapseMode: CollapseMode.pin,
            ),
            expandedHeight:230.0,
            floating:false,
            pinned:true,
            snap:false,
          ),
          SliverFixedExtentList(
              delegate:SliverChildBuilderDelegate(
                      (context, index) => ListTile(
                        title: Text("Item $index"),
                      ),childCount: 30,), itemExtent: 50.0)
        ],
      ),
    );
  }
}