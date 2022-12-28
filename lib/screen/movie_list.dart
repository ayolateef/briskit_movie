import 'dart:io';
import 'package:briskit_test/movie_names.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details_page.dart';
import 'models/list_model.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int _selectedIndex = 0;
  List<ListModel> items = [
    ListModel(
        title: 'Lorem title man',
        name: 'by Francis Smith',
        button: 'label 1',
        icon: Icons.bookmarks,
        numOfComments: '5 comments',
        image: ''),
    ListModel(
        title: 'Lorem title man',
        name: 'by Francis Smith',
        button: 'label 1',
        icon: Icons.bookmarks,
        numOfComments: '5 comments',
        image: ''),
    ListModel(
        title: 'Lorem title man',
        name: 'by Francis Smith',
        button: 'label 1',
        icon: Icons.bookmarks,
        numOfComments: '5 comments'),
    ListModel(
        title: 'Lorem title man',
        image: '',
        name: 'by Francis Smith',
        button: 'label 1',
        icon: Icons.bookmarks,
        numOfComments: '5 comments'),
  ];
  // hold response
  //MovieName? movieNames;
  // data is loading
  bool isLoading = false;
  //error message
  String errorMsg = '';
  // ApI call
  // Future<MovieName> getDataFromApi() async {
  //   Uri url =
  //       Uri.parse('https://imdb-api.com/en/API/MostPopularMovies/k_pk92vapj');
  //   var response = await http.get(url);
  //   if (response.statusCode == HttpStatus.ok) {
  //     MovieName movieName = movieNameFromJson(response.body);
  //     return movieName;
  //   } else {
  //     errorMsg = '${response.statusCode}: ${response.body}';
  //     return MovieName(items: [], );
  //   }
  // }

  // assignData() async {
  //   movieNames = await getDataFromApi();
  //   setState(() {
  //     isLoading = true;
  //   });
  // }

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.compass_calibration,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmarks,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notification_add_rounded,
                  color: Colors.black,
                ),
                label: ''),
          ],
          currentIndex: _selectedIndex,
          onTap: _onTappedItem,
        ),
        body: ListView.separated(
          //movieNames!.items.length ,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return getMyMovie(index);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              thickness: 3,
              height: 15.0,
            );
          },
        ));
  }

  Widget getMyMovie(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20),
      child: Row(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: const BoxDecoration(color: Colors.grey
                // image: DecorationImage(image: NetworkImage(items[index].image!)

                // )
                ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                items[index].title!,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              Text(
                items[index].name!,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailsPage()));
                    },
                    child: Container(
                        height: 30.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Center(
                          child: Text(
                            items[index].button!,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                      height: 30.0,
                      width: 70.0,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Center(
                        child: Text(
                          items[index].button!,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(items[index].icon),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(items[index].numOfComments!)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
  //   children: ListTile(
  //     leading:Container(
  //       height: 100,
  //       width: 100,
  //       decoration: BoxDecoration(
  //         image: DecorationImage(image: NetworkImage(movieNames!.items[index].image) )
  //       ),
  //      child: Text(movieNames!.items[index].image)
  //        ),
  //     title:Text(movieNames!.items[index].fullTitle),
  //     subtitle: Text(movieNames!.items[index].title),
  //     ),
