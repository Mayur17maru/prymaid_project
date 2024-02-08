import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramid/features/home/ui/tile.dart';
import '../../WelcomeHome/ui/WelcomHome.dart';
import '../bloc/hbloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentIndex = 0;
  List<String> listOfStrings = ['Home','Explore','DashBoard','Profile'];                              //bottom nav bar icons name
  List<IconData> listOfIcons = [Icons.home,Icons.explore,Icons.dashboard,Icons.person];           //bottom navigation bar icons
  List<String> listOfStringsc = ['Plank\nChallenge','Sprint\nChallenge','Squat\nChallenge']; //challenges name
  List<Color> listOfColorStrings = [Colors.limeAccent.shade400,Colors.greenAccent.shade700,Colors.black26]; //challenges background color
  List<Color> listOfColorStringsc = [Colors.black,Colors.white,Colors.black];                //challenges text color
  List<Color> listOfColorStringsci = [Colors.white,Colors.black87,Colors.limeAccent.shade200]; ////challenges icon color
  List<IconData> listOfIconsc = [Icons.fireplace_outlined,Icons.running_with_errors_outlined,Icons.water_drop_outlined];  ////challenges icon

  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(HomeInitialEvent());    //bloc pushes initial home page when app is launched
    super.initState();
  }

  @override
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
        listener: (BuildContext context, Object? state) {
          if(state is HomeNavigateToPageActionState){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomHome()));
          }
        },
      builder: (BuildContext context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            double displayWidth = MediaQuery.of(context).size.width;
          return
            Scaffold(
              bottomNavigationBar: Container(
                margin: EdgeInsets.all(displayWidth * .05),
                height: displayWidth * .155,
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 30,
                      offset: Offset(0, 10),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50)
                ),
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        setState(() {
                          currentIndex = index;
                          HapticFeedback.lightImpact();
                        });
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.greenAccent,
                      child: Stack(
                        children: [
                          AnimatedContainer(
                              duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex ? displayWidth * .32 : displayWidth * .18,
                            alignment: Alignment.center,
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.fastLinearToSlowEaseIn,
                              height: index == currentIndex ? displayWidth * .12 : 0,
                              width: index == currentIndex ? displayWidth * .32 : 0,
                              decoration: BoxDecoration(
                                color: index == currentIndex ? Colors.limeAccent.shade400.withOpacity(1):Colors.transparent,
                                borderRadius: BorderRadius.circular(50)
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex ? displayWidth * .31: displayWidth * .18,
                            alignment: Alignment.center,
                            child: Stack(
                              children: [
                                Row(
                                  children: [
                                    AnimatedContainer(duration: Duration(seconds: 1),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                      width: index == currentIndex ? displayWidth * .13:0,
                                    ),
                                    AnimatedOpacity(
                                        opacity : index == currentIndex ? 1:0,
                                        duration: Duration(seconds: 1),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      child: Text(index == currentIndex
                                      ? '${listOfStrings[index]}':'',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    AnimatedContainer(duration: Duration(seconds: 1),
                                    curve : Curves.fastLinearToSlowEaseIn,
                                      width: index == currentIndex ? displayWidth * .03:20,
                                    ),
                                    Icon(
                                      listOfIcons[index],
                                      size: displayWidth * .076,
                                      color: index == currentIndex ? Colors.black:Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
              ),
            body: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        width: double.infinity,
                        height: 250,
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                  child: Image.network('https://i.pinimg.com/originals/5d/c2/31/5dc23115c579dc71600fd0f39c6f2402.jpg',fit: BoxFit.fill,)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                gradient: LinearGradient(
                                  colors: [Colors.black,Colors.transparent.withOpacity(0.5),Colors.transparent.withOpacity(.2), Colors.transparent],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.center,
                                  stops: [0.2,0.5,0.7,0.8],
                                  tileMode: TileMode.decal,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 60,left: 20),
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text('Best Quarantine',textAlign: TextAlign.left,style:TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w700),),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0,left: 20),
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text('Workout',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w700),),
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                InkWell(
                                  onTap: (){
                                    homeBloc.add(HomeProductClickedNavigateEvent());
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 25,left: 20),
                                    alignment: Alignment.bottomLeft,
                                    child: Text('See more  >',style: TextStyle(fontSize: 15,color: Colors.limeAccent.shade400),),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 2),
                        child: Text('Best for you',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black,)),
                      ),//Best for you
                    Container(
                      height: 250,
                      width: double.maxFinite,
                      child:
                          GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: successState.products.length,
                            itemBuilder: (BuildContext context, index ) {
                              return InkWell(
                                  onTap: (){
                                    homeBloc.add(HomeProductClickedNavigateEvent());
                                  },
                                  child: ProductTileWidget(productDataModel: successState.products[index], homeBloc: homeBloc));
                            }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: .58) ,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text('Challenge',textAlign: TextAlign.start,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.black,)),
                      ),
                    ),
                    Container(
                      height: 180,
                      width: double.infinity,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: listOfStringsc.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, index){
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: (){
                                    homeBloc.add(HomeProductClickedNavigateEvent());
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: listOfColorStrings[index],
                                    ),
                                    width: 140,
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 12,right: 12),
                                          alignment :Alignment.topRight,
                                          child: Icon(listOfIconsc[index],color: listOfColorStringsci[index], size: 60,),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 12,left: 12),
                                          alignment: Alignment.bottomLeft,
                                          child: Text(listOfStringsc[index],style: TextStyle(color: listOfColorStringsc[index],fontSize: 20,fontWeight: FontWeight.bold),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                        ),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text('Fast Warmup',textAlign: TextAlign.start,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.black,)),
                      ),
                    ),
                    Container(
                      height: 250,
                      width: double.maxFinite,
                      child:
                      GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: successState.products.length,
                        itemBuilder: (BuildContext context, index ) {
                          return InkWell(
                              onTap: (){
                                homeBloc.add(HomeProductClickedNavigateEvent());
                              },
                              child: ProductTileWidget(productDataModel: successState.products[index], homeBloc: homeBloc));
                        }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: .58) ,
                      ),
                    ),
                  ],
                ),
            ),

          );
          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}

