///
/// Created by GaoJinKai on 2021/8/7.
/// Copyright (c) 2021 flutter_study. All rights reserved.
/// Description: 横向纵向滚动的demo，仿支付宝自选效果
///

import 'package:flutter/material.dart';

class HorizontalVerticalScrollView extends StatefulWidget {
  const HorizontalVerticalScrollView({Key? key}) : super(key: key);

  @override
  _HorizontalVerticalScrollViewState createState() =>
      _HorizontalVerticalScrollViewState();
}

class _HorizontalVerticalScrollViewState
    extends State<HorizontalVerticalScrollView> {
  ///主滚动控制器
  ScrollController _mainScrollController = ScrollController();

  ///横向滚动控制器
  ScrollController _hScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomScrollView(
        controller: _mainScrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              color: Colors.blueGrey,
              alignment: Alignment.center,
              height: 100,
              child: Text('这里是滚动广告', style: TextStyle(
                fontSize: 30,
                color: Colors.blue
              ),),
            ),
          ),
          SliverPersistentHeader(
              delegate: QTabBarSliverPersistentHeader(_hScrollController), pinned: true,),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                child: Text('哈哈哈哈哈'),
              );
            },
            childCount: 30,
          ))
        ],
      ),
    );
  }
}

/*
*
* 悬停的头部
*
* */
class QTabBarSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  QTabBarSliverPersistentHeader(this._scrollController);

  ScrollController _scrollController;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return CustomListTile(left: Text('标题'), leftFlex: 1, rightFlex: 1, scrollController: _scrollController,);
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class CustomListTile extends StatefulWidget {
  CustomListTile(
      {Key? key,
      this.left,
      this.leftFlex = 1,
      this.rights,
      this.rightFlex = 1,
      this.scrollController})
      : super(key: key);

  final Widget? left;
  final List<Widget>? rights;
  final int leftFlex;
  final int rightFlex;
  final ScrollController? scrollController;

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: widget.left ?? Text('左标题'),
            ),
            flex: widget.leftFlex,
          ),
          Expanded(
            child: ListView.builder(
              controller: widget.scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(child: Text('内容$index'));
                }),
            flex: widget.rightFlex,
          ),
        ],
      )
    );
  }
}
