import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'initdetail.dart';
import 'detail.dart';
import 'home_screen.dart';
import 'menu.dart';
import 'initmenu.dart';

class Hotel extends StatelessWidget {
  final int index;

  const Hotel({Key? key, required this.index}) : super(key: key);
  int get Index => index;
  //Object get index => index;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference hotel = firestore.collection('Hotel');
    return StreamBuilder<QuerySnapshot>(
      stream: hotel.where('id', isEqualTo: index).snapshots(),
      builder: (BuildContext context, snapshot) {
          (snapshot.data! as QuerySnapshot)
              .docs
              .map(
                  (e) {
                    return DetailScreen(
                  Detail(
                    id: e['id'],
                    image: e['image'],
                    nama: e['nama'],
                    harga: e['harga'],
                    lat: e['lat'],
                    long: e['long'],
                    telp: e['telp'],
                  ),
                );
              });
        return Container();
      },);
  }
}


