
import 'dart:async';
import 'package:demo1/sidebar/menu_item.dart';
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
    
    // ignore: non_constant_identifier_names
    final ScreenWidth=MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context,isSidebarOpenedAsync){
        return AnimatedPositioned(
        duration: _animationDuration,
        top: 0,
        bottom: 0,

        left: isSidebarOpenedAsync.data!?0 :-ScreenWidth,
        right: isSidebarOpenedAsync.data!?0:ScreenWidth-45,

        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color:const Color(0xFF262AAA),
                child: Column(
                  children:  <Widget>[
                    const SizedBox(height: 100,),
                    const ListTile(
                      title: Text(
                        "Shakti",
                        style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "shaktimad646@gmail.com",
                        style: TextStyle(
                          color: Color(0xFF1BB5FD),
                          fontSize: 20,
                        ),
                      ),
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.perm_identity,
                          color: Colors.white,
                        ),
                        radius: 40,
                      ),
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.white.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),
                    const Menuitem(
                      icon: Icons.home, 
                      title: "Home",
                    ),
                    const Menuitem(
                      icon: Icons.person,
                      title: "My Account",
                    ),
                    const Menuitem(
                      icon: Icons.shopping_basket,
                      title: "My Orders",
                    ),
                    const Menuitem(
                      icon: Icons.card_giftcard,
                      title: "Wishlist",
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.white.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),
                    const Menuitem(
                      icon: Icons.settings,
                      title: "Settings",
                    ),
                    const Menuitem(
                      icon: Icons.exit_to_app,
                      title: "Log Out",
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0,-0.9),
              child: GestureDetector(
                onTap: (){
                  onIconPressed();
                },
                child: ClipPath(
                  clipper: CustomMenuClipper(),
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
              ),
            )
          ],
        ),
      );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Paint paint=Paint();
    paint.color=Colors.white;
    
    final width = size.width;
    final height= size.height;

    Path path=Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(0,8, 10, 16);
    path.quadraticBezierTo(width-1, height/2-20, width,height/2);
    path.quadraticBezierTo(width+1, height/2+20, 10,height-16);
    path.quadraticBezierTo(0, height-8, 0,height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}