import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:News4you/view/Detail_news/detail_news.dart';
import 'package:News4you/controller/home_screen_controller.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  void initState() {
    Provider.of<home_screen_controller>(context, listen: false).fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<home_screen_controller>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "NEWS 4 YOU...!",
            style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: homeProvider.loading
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () async {
                  await homeProvider.fetchdata();
                },
                child: SafeArea(
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(right: 200),
                          child: Text("TRENDING NEWS",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 15),
                        CarouselSlider(
                            items: List.generate(
                                homeProvider.responceData?.articles?.length ??
                                    0,
                                (index) => Stack(children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    detailed_news(
                                                        newarticle: homeProvider
                                                            .responceData!
                                                            .articles![index]),
                                              ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    homeProvider
                                                            .responceData
                                                            ?.articles?[index]
                                                            .urlToImage
                                                            .toString() ??
                                                        "",
                                                  ),
                                                  fit: BoxFit.cover)),
                                          height: 200,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 50,
                                        child: Column(
                                          children: [
                                            Text(
                                                homeProvider.responceData
                                                        ?.articles?[index].title
                                                        .toString() ??
                                                    "",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontStyle: FontStyle.italic,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                homeProvider
                                                        .responceData
                                                        ?.articles?[index]
                                                        .author
                                                        .toString() ??
                                                    "",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontStyle: FontStyle.italic,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                    ])),
                            options: CarouselOptions(
                              height: 300,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.3,
                              scrollDirection: Axis.horizontal,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(right: 200),
                          child: Text(
                            "TOP HEADLINES",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              homeProvider.responceData?.articles?.length ?? 0,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                if (homeProvider
                                        .responceData?.articles?[index] !=
                                    null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => detailed_news(
                                          newarticle: homeProvider
                                              .responceData!.articles![index],
                                        ),
                                      ));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.cyan.shade100,
                                    borderRadius: BorderRadius.circular(10)),
                                height: 275,
                                width: 300,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        homeProvider.responceData
                                                ?.articles?[index].title
                                                .toString() ??
                                            "",
                                        maxLines: 2,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height: 200,
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            width: 180,
                                            height: 250,
                                            child: Image.network(
                                              homeProvider
                                                      .responceData
                                                      ?.articles?[index]
                                                      .urlToImage
                                                      .toString() ??
                                                  "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 250,
                                            width: 200,
                                            child: Text(
                                              homeProvider
                                                      .responceData
                                                      ?.articles?[index]
                                                      .description
                                                      .toString() ??
                                                  "",
                                              maxLines: 5,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
