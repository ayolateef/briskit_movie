
import 'dart:io';
import 'package:briskit_test/movie_names.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  
  int _selectedIndex = 0;
  
  // hold response
       MovieName? movieNames;
  // data is loading
  bool isLoading = false;
  //error message
  String errorMsg = '';
  // ApI call
  Future<MovieName> getDataFromApi() async {
    Uri url =
        Uri.parse('https://imdb-api.com/en/API/MostPopularMovies/k_pk92vapj');
    var response = await http.get(url);
    if (response.statusCode == HttpStatus.ok) {
      MovieName movieName = movieNameFromJson(response.body);
      return movieName;
    } else {
      errorMsg = '${response.statusCode}: ${response.body}';
      return MovieName(items: [], );
    }
  }

  assignData() async {
    movieNames = await getDataFromApi();
    setState(() {
      isLoading = true;
    });
  }
  void _onTappedItem(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: BottomNavigationBar(
         items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black,),
           label: ''
           ),
           BottomNavigationBarItem(icon: Icon(Icons.compass_calibration, color: Colors.black,
           ),
               label: ''),
           BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.black,
           ),label: ''),
           BottomNavigationBarItem(icon: Icon(Icons.bookmarks, color: Colors.black,
           ),label: ''),
           BottomNavigationBarItem(icon: Icon(Icons.notification_add_rounded, color: Colors.black,
           ),label: ''),

         ],
         currentIndex: _selectedIndex,
         onTap: _onTappedItem,
       ),
      
      
      body: !isLoading ? const
        Center(
         // child: CircularProgressIndicator(),
      ) : 
      errorMsg.isNotEmpty ? Center(child: Text(errorMsg)) : movieNames!.items.isEmpty ? Text('No Data') :

    ListView.separated(
      itemCount: movieNames!.items.length ,
      itemBuilder: (context, index) {
        return getMyMovie(index);
      }, 
      separatorBuilder: (BuildContext context, int index) { 
        return const Divider(height: 5.0,);
       },)
    );
    
  }
  
  Widget getMyMovie(int index) {
    return  Card(
      child: ListTile(
        leading:Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(movieNames!.items[index].image) )
          ),
         child: Text(movieNames!.items[index].image)
           ),
        title:Text(movieNames!.items[index].fullTitle),
        subtitle: Text(movieNames!.items[index].title),
        ),
    );
  }
}
