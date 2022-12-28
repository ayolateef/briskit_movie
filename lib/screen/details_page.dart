

import 'package:briskit_test/utils/list_items.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Widget> slides = itemMaterials.map((item) => 
  Container(
    height: 400.0,
    width: 400.0,
    color: Colors.grey,
    child: Image.asset(item['images'],
    fit: BoxFit.fitWidth,
    width: 342,
    height: 345,
    ),
  )).toList();
List<Widget> indicator() => List<Widget>.generate(
      slides.length,
      (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            height: 10.0,
            width: 10.0,
            decoration: BoxDecoration(
                color: currentPage.round() == index
                    ? Colors.grey
                    : Colors.black,
                borderRadius: BorderRadius.circular(10.0)),
          ));
  double currentPage = 0.0;
  final _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              PageView.builder(
                controller: _pageViewController,
                itemCount: slides.length,
                itemBuilder: (BuildContext context, int index){
                  _pageViewController.addListener(() {
                    setState(() {
                      currentPage = _pageViewController.page!;
                    });
                  });
                  return slides[index];
                }
                ),
                 Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicator(),
                  ),
                ))
            ],
          ),
          const Text('Lorem text Messages', style:  TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10.0),
Row(
  children: const [

  ],
)
        ],
      )
      );
  }
}