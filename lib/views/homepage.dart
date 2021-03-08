import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newspaper_app/helper/categorydata.dart';
import 'package:newspaper_app/model/categorymodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = List<CategoryModel>();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "International ",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "News Paper",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      body: Container(

        //color: Colors.white,


          child: Column(
            children: [
              Container(
                height: 100.0,
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                       imageUrl: categories[index].imageUrl,
                    );
                  },
                ),
              ),
            ],
          ),

      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  String categoryName, imageUrl;

  CategoryTile({this.categoryName, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(right: 16,top: 6),

      child: Stack(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(imageUrl: imageUrl,width: 180,height: 110,fit: BoxFit.cover,)),

        ],
      ),
    );
  }
}
