
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({ Key? key }) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with SingleTickerProviderStateMixin<Sidebar>{
  
  get child => null;

  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink; 

  final _animationDuration=const Duration(milliseconds: 500);

  @override
  void initState(){
    super.initState();
    _animationController=AnimationController(vsync: this,duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream= isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink=isSidebarOpenedStreamController.sink;
  }
  @override
  void dispose(){
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed(){
    final animationStatus=_animationController.status;
    final isAnimationCompleated = animationStatus==AnimationStatus.completed;

    if(isAnimationCompleated){
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    }else{
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }
  @override
  Widget build(BuildContext context) {
    
    final ScreenWidth=MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context,isSidebarOpenedAsync){
        return AnimatedPositioned(
        duration: _animationDuration,
        top: 0,
        bottom: 0,

        left: isSidebarOpenedAsync.data!?0 :0,
        right: isSidebarOpenedAsync.data!?0:ScreenWidth-45,

        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                color:const Color(0xFF262AAA),
              ),
            ),
            Align(
              alignment: const Alignment(0,-0.9),
              child: GestureDetector(
                onTap: (){
                  onIconPressed();
                },
                child: Container(
                  width: 35,
                  height: 110,
                  color:const Color(0xFF262AAA),
                  alignment: Alignment.centerLeft,
                  child: AnimatedIcon(
                    progress: _animationController.view,
                    icon: AnimatedIcons.menu_close,
                    color:const Color(0xFF1BB5FD),
                    size: 25,
                    ),
                ),
              ),
            )
          ],
        ),
      );
      },
    );
  }
}