import 'package:flutter/material.dart';

class ListModel{
  String? title;
  String? name;
  String? image;
  String? button;
  IconData? icon;
  String? numOfComments;
  ListModel({this.title, this.name,  this.image, this.button, required this.icon, this.numOfComments});
  
}