// ignore_for_file: unnecessary_new, avoid_single_cascade_in_expression_statements, prefer_final_fields

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
  late List<Biblia> _chaptersName = getChapters();
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
    for (Biblia cap in _chaptersName) {
      items.add(new DropdownMenuItem(
          value: cap.author, child: new Text(cap.author.toString())));
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

  List<Biblia> getChapters() {
    BibliaService bibliaService = BibliaService();
    bibliaService.GetAllBookChap().then((value) {
      if (value != null) {
        return value;
      }
    }).catchError((error) {
      CustomToast.showError(error.toString());
    });
    return List.empty();
  }

  void changedDropDownItem(selectedCap) {
    setState(() {
      _currentCap = selectedCap;
    });
  }
}
