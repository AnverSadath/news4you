import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:News4you/controller/home_screen_controller.dart';
import 'package:News4you/view/Detail_news/detail_news.dart';

class search_page extends StatefulWidget {
  const search_page({super.key});

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<home_screen_controller>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.orange.shade100,
                    prefixIcon: Icon(Icons.search),
                    hintText: "SEARCH",
                    border: OutlineInputBorder()),
                onChanged: (value) {
                  homeProvider.fetchdata(searchquery: searchcontroller.text);
                },
                controller: searchcontroller,
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Text("RECENT NEWS",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                  height: 679,
                  width: 400,
                  child: ListView.builder(
                    itemCount: homeProvider.responceData?.articles?.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => detailed_news(
                                    newarticle: homeProvider
                                        .responceData!.articles![index]),
                              ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 180,
                                  width: 150,
                                  child: Image.network(
                                    homeProvider.responceData?.articles?[index]
                                            .urlToImage
                                            .toString() ??
                                        "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 18,
                                      width: 180,
                                      child: Text(
                                        homeProvider.responceData
                                                ?.articles?[index].author
                                                .toString() ??
                                            "",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 70,
                                    width: 200,
                                    child: Text(
                                      homeProvider.responceData
                                              ?.articles?[index].title
                                              .toString() ??
                                          "",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    height: 30,
                                    width: 200,
                                    child: Text(
                                      homeProvider.responceData
                                              ?.articles?[index].publishedAt
                                              .toString() ??
                                          "",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 140),
                                    child: Container(
                                      height: 30,
                                      width: 50,
                                      child: Row(children: [
                                        Icon(
                                          Icons.bookmark_border,
                                          color: Colors.white,
                                        ),
                                        Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                        )
                                      ]),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          height: 180,
                          width: 180,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
