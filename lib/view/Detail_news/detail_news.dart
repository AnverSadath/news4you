import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:provider/provider.dart';
import 'package:News4you/model_class/model_class.dart';

class detailed_news extends StatefulWidget {
  const detailed_news({super.key, required this.newarticle});
  final Article newarticle;

  @override
  State<detailed_news> createState() => _detailed_newsState();
}

class _detailed_newsState extends State<detailed_news> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          label: Text(
            "Read more",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            launchUrl(Uri.parse(widget.newarticle.url.toString()),
                mode: LaunchMode.inAppWebView);
          },
          backgroundColor: Colors.lightBlue.shade300,
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.amber,
                child: Image.network(
                  widget.newarticle.urlToImage.toString(),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      widget.newarticle.title.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.newarticle.description.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(widget.newarticle.content.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.newarticle.author.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                        Text(widget.newarticle.publishedAt.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Share.share(widget.newarticle.url.toString());
                          },
                          icon: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.bookmark,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                height: 600,
                width: double.infinity,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
