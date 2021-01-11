import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_suggestions_4_u/Controller/mainScreen_controller.dart';
import 'package:readmore/readmore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MainScreen extends StatelessWidget {
  final MainScreenController _mainScreenController =
      Get.put(MainScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies Time"),
      ),
      body: Obx(
        () => ListView.builder(
          controller: _mainScreenController.scrollController,
          itemCount: _mainScreenController.movies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: CachedNetworkImage(
                          imageUrl:
                              _mainScreenController.movies[index].imageURL,
                          placeholder: (context, url) =>
                              Center(child: new CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  _mainScreenController.movies[index].title,
                                  style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1.5),
                                ),
                                SizedBox(height: 15),
                                ReadMoreText(
                                  _mainScreenController.movies[index].summary,
                                  trimLines: 2,
                                  colorClickableText: Colors.pink,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'Show more',
                                  trimExpandedText: 'Show less',
                                  moreStyle: TextStyle(
                                      fontSize: 13,
                                      letterSpacing: 1
                                      ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 120,
                                      child: Row(
                                        children: [
                                          Text(
                                            "IMDb : ",
                                            style:
                                                TextStyle(color: Colors.yellow),
                                          ),
                                          Text(_mainScreenController
                                              .movies[index].imdb
                                              .toString())
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: MaterialButton(
                                        color: Colors.teal,
                                        height: 30,
                                        minWidth: 70,
                                        child: Text("Detail"),
                                        onPressed: () {
                                          _mainScreenController.loadOnBrowser(
                                              _mainScreenController
                                                  .movies[index].webURL);
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
