
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'botomNavBar/health.dart';
import '../controller/news_controller.dart';
import 'botomNavBar/science.dart';
import 'botomNavBar/sport.dart';
class HomePage extends GetWidget<NewsController>{
  List<Widget> screens =[
    Sport(),
    Science(),
    Health(),
  ];
  @override
  Widget build(BuildContext context) {
    NewsController  controller=Get.put(NewsController());
   return Scaffold(

     bottomNavigationBar: GetX<NewsController>(builder:(controller)=>BottomNavigationBar(
         selectedItemColor: Colors.pink,
         onTap: (val){
           controller.pageIndex.value=val;
         },
         currentIndex: controller.pageIndex.value,
         items:const [
           BottomNavigationBarItem(icon: Icon(Icons.sports),label: "Sports"),
           BottomNavigationBarItem(icon:Icon(Icons.science),label: "Science"),
           BottomNavigationBarItem(icon:Icon(Icons.health_and_safety),label: "Health"),
         ]
     ),),
     body:GetX<NewsController>(builder:(controller)=>screens[controller.pageIndex.value]) ,
   );
  }

}