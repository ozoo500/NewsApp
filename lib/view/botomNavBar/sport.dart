
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';

class Sport extends GetWidget<NewsController>{
  @override
  Widget build(BuildContext context) {
    NewsController  controller=Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text.rich(
              TextSpan(
                  children: [
                    TextSpan(
                        text: 'News',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.orange)
                    ),
                    TextSpan(
                        text: 'App',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)
                    )
                  ]
              )
          )
      ),
      body: FutureBuilder (
        future: controller.getData("sports"),
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount:controller.list.length,
                itemBuilder: (context,index){
                  return Card(
                    elevation: 4,
                    shadowColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          child: Image.network(controller.list[index].urlToImage.toString(),fit: BoxFit.cover,
                          ),
                        ),

                        Text(controller.list[index].title.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(controller.list[index].description.toString(),
                              style: const TextStyle(fontSize:16)),
                        ),

                      ],

                    ),
                  );
                }
            );
          } else{
            return  const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

}