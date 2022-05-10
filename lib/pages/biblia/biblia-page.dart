// ignore_for_file: unnecessary_new, avoid_single_cascade_in_expression_statements, prefer_final_fields, file_names

import 'dart:async';
import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:igreja_app/models/biblia/biblia.dart';
import 'package:igreja_app/services/biblia_api_service.dart';
import 'package:igreja_app/widgets/custom_toast.dart';

class BibliaPage extends StatefulWidget {
  const BibliaPage({Key? key}) : super(key: key);

  @override
  State<BibliaPage> createState() => _BibliaPageState();
}

class _BibliaPageState extends State<BibliaPage> {
  List<Biblia> _dropdownItems = [];

  getChapters() async {
    setState(() {
      _dropdownItems.clear();
      BibliaService bibliaService = BibliaService();
      bibliaService.GetAllBookChap().then((value) {
        for (var cap in value) {
          _dropdownItems.add(new Biblia(
              cap.id.toString(),
              cap.bibleId.toString(),
              cap.abbreviation.toString(),
              cap.name.toString(),
              cap.nameLong.toString()));
        }
        _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
        _selectedItem = _dropdownMenuItems[0].value;
      }).catchError((error) {
        CustomToast.showError('Erro: ' + error.toString());
      });
    });
  }

  List<DropdownMenuItem<Biblia>> _dropdownMenuItems;
  Biblia _selectedItem;

  @override
  void initState() {
    super.initState();
    getChapters();
  }

  List<DropdownMenuItem<Biblia>> buildDropDownMenuItems(List listBiblia) {
    List<DropdownMenuItem<Biblia>> items = [];
    for (Biblia bibliaItem in listBiblia) {
      items.add(
        DropdownMenuItem(
          child: Text(bibliaItem.name.toString()),
          value: bibliaItem,
        ),
      );
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
                  value: _selectedItem,
                  items: _dropdownMenuItems,
                  onChanged: changedDropDownItem,
                ),
                new DropdownButton(
                  value: _selectedItem,
                  items: _dropdownMenuItems,
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
      _selectedItem = selectedCap;
    });
  }
}
