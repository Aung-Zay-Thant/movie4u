import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_suggestions_4_u/Model/moviesModel.dart';
import 'package:http/http.dart' as http;
import 'package:movie_suggestions_4_u/Utility/url.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreenController extends GetxController {
  var movies = List<Movie>().obs;
  ScrollController scrollController = ScrollController();
  int pageNumber = 2;
  @override
  void onInit() {
    _apiGetMovies();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _getMoreData(pageNumber);
      }
    });
    super.onInit();
  }

  _apiGetMovies() async {
    await http.get(baseURL).then((value) {
      MovieList movieList = MovieList.fromJson(json.decode(value.body));
      movies.value = movieList.movie;
      // }).catchError((onError) {
      //   Get.snackbar("Error!","Some error occured!");
      // });
    });
  }

  _getMoreData(int page) async {
    await http.get(baseURL + "?page=$page").then((value) {
      pageNumber = pageNumber + 1;
      print(pageNumber);
      MovieList movieList = MovieList.fromJson(json.decode(value.body));
      for (Movie movie in movieList.movie) {
        movies.add(movie);
      }
    });
  }

  loadOnBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar('Error',"Can't launch in browser");
    }
  }
}
