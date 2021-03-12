import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newspaper_app/helper/categorydata.dart';
import 'package:newspaper_app/helper/newsdata.dart';
import 'package:newspaper_app/model/categorymodel.dart';
import 'package:newspaper_app/model/newsmodel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //get categories list
  List<CategoryModel> categories = List<CategoryModel>();

  //get news list first


  List<ArticleModel> articles = List<ArticleModel>();

  getNews() async{
     News newsdata = News();
     await newsdata.getNews();
     articles = newsdata.dataobesavedin;

  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
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
              style: TextStyle(color: Colors.red),
            ),
            Text(
              "NewsPaper",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      categoryName: categories[index].categorytName,
                    );
                  },
                ),
              ),

              Container(
                child: ListView.builder(
                  itemCount: articles.length,
                  physics: ClampingScrollPhysics() ,
                  shrinkWrap: true,
                  itemBuilder: (context,index){

                    return NewsTemplate(
                      urlToImage: articles[index].urlToImage,
                      title: articles[index].title,
                      description: articles[index].description,
                    );

                  },
                ),
              )
            ],
          ),
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

    return GestureDetector(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.only(right: 16, top: 6),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 180,
                  height: 110,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              width: 180,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class NewsTemplate extends StatelessWidget {

  String title, description, url, urlToImage;
  NewsTemplate({this.title, this.description, this.urlToImage, this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(

        children: <Widget>[

          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(imageUrl: urlToImage, width: 380, height: 200, fit: BoxFit.cover,)),

          SizedBox(height: 8),

          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.black),),

          SizedBox(height: 8),

          Text(description, style: TextStyle( fontSize: 15.0, color: Colors.grey[800]),),





        ],



      ),
    );
  }
}