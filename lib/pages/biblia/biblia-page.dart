// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

class BibliaPage extends StatefulWidget {
  const BibliaPage({Key? key}) : super(key: key);

  @override
  State<BibliaPage> createState() => _BibliaPageState();
}

class _BibliaPageState extends State<BibliaPage> {
  String nomeCapitulo = "";
  final List _capitulosAnt = [
    "Gênesis",
    "Êxodo",
    "Levítico",
    "Números",
    "Deuteronômio",
    "Josué",
    "Juízes",
    "Rute",
    "I Samuel",
    "II Samuel",
    "I Reis",
    "II Reis",
    "I Crônicas",
    "II Crônicas",
    "Esdras",
    "Neemias",
    "Ester",
    "Jó",
    "Salmos",
    "Provérbios",
    "Eclesiastes",
    "Cânticos dos Cânticos",
    "Isaías",
    "Jeremias",
    "Lamentações",
    "Ezequiel",
    "Daniel",
    "Oseias",
    "Joel",
    "Amós",
    "Obadias",
    "Jonas",
    "Miqueias",
    "Naum",
    "Habacuque",
    "Sofonias",
    "Ageu",
    "Zacarias",
    "Malaquias"
  ];

  late List<DropdownMenuItem<String>> _dropDownMenuItems;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCap = _dropDownMenuItems[0].value!;
    super.initState();
  }

  late String _currentCap;

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String cap in _capitulosAnt) {
      items.add(new DropdownMenuItem(value: cap, child: new Text(cap)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.all(16.0),
                ),
                new DropdownButton(
                  value: _currentCap,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                ),
                new DropdownButton(
                  value: _currentCap,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void changedDropDownItem(selectedCap) {
    setState(() {
      _currentCap = selectedCap;
    });
  }
}
