import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/new_controller.dart';
import 'package:newsapp/model/news_model.dart';
class Sports extends GetWidget{
  NewsController controller=Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("News App"),
      ),
      body: FutureBuilder(
          future: controller.getData("sports"),
          builder:(context ,AsyncSnapshot snapshot ){
            Articals date =snapshot.data;
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: date.articles.length,
                  itemBuilder: (context , int index ){
                    return Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 150,
                            child: Image.network(date.articles[index].urlToImage.toString() ,
                              fit: BoxFit.fill,),
                          ),
                          Text(date.articles[index].title ,
                            style: TextStyle(
                                fontSize: 20 , fontWeight: FontWeight.bold ),),
                          Text(date.articles[index].description,
                            style: TextStyle(
                                fontSize: 20 , fontWeight: FontWeight.bold ),),
                        ],
                      ),
                    );
                  }
              );
            }
            else {
              return Center(child: CircularProgressIndicator());
            }
          } ),
    );
  }

}