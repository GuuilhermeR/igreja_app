// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_app/base_model.dart';
import 'package:igreja_app/models/user/user.dart';
import 'package:igreja_app/services/route_service.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

TextEditingController txtNomeController = TextEditingController();
TextEditingController txtUsuarioController = TextEditingController();
TextEditingController txtSenhaController = TextEditingController();
TextEditingController txtDtNascController = TextEditingController();

bool passwordVisibility = false;

FocusNode focusNodeNome = FocusNode();
FocusNode focusNodeUsuario = FocusNode();
FocusNode focusNodeSenha = FocusNode();
FocusNode focusDataNascimento = FocusNode();
DateTime? selectedDate;

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();
    txtUsuarioController = TextEditingController();
    txtSenhaController = TextEditingController();
    passwordVisibility = false;
  }

  final form = FormGroup({
    'userId': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
    'dataNascimento': FormControl<DateTime>(value: DateTime.now()),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Cadastrar'),
        centerTitle: true,
        toolbarHeight: 50,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            RouteService.login();
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 500,
          height: 800,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          margin:
              const EdgeInsets.only(top: 60, left: 15, right: 15, bottom: 60),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
                const Divider(
                  color: Color.fromARGB(0, 255, 255, 255),
                  height: 40,
                ),
                ReactiveForm(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CampoNome(),
                        const Divider(
                          color: Color.fromARGB(0, 255, 255, 255),
                          height: 20,
                        ),
                        CampoUsuario(),
                        const Divider(
                          color: Color.fromARGB(0, 255, 255, 255),
                          height: 20,
                        ),
                        CampoSenha(),
                        const Divider(
                          color: Color.fromARGB(0, 255, 255, 255),
                          height: 40,
                        ),
                        Container(
                          child: CampoNascimento(),
                        ),
                      ],
                    ),
                    formGroup: form),
                const Divider(
                  color: Color.fromARGB(0, 63, 9, 9),
                  height: 30,
                ),
                ButtonCadastrar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

ReactiveDateTimePicker CampoNascimento() {
  return ReactiveDateTimePicker(
    formControlName: 'dataNascimento',
    type: ReactiveDatePickerFieldType.date,
    dateFormat: DateFormat("dd/MM/yyyy"),
    decoration: const InputDecoration(
      labelText: 'Data Nascmento',
      helperText: '',
    ),
  );
}

TextFormField CampoUsuario() {
  return TextFormField(
    keyboardType: TextInputType.text,
    controller: txtUsuarioController,
    onFieldSubmitted: (String teste) =>
        {txtUsuarioController.text.toLowerCase()},
    onEditingComplete: () => {txtUsuarioController.text.toLowerCase()},
    decoration: const InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      icon: Icon(Icons.person),
      labelText: 'Usuário',
      labelStyle: TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    ),
  );
}

TextFormField CampoNome() {
  return TextFormField(
    keyboardType: TextInputType.text,
    controller: txtNomeController,
    onFieldSubmitted: (String teste) =>
        {txtUsuarioController.text.toLowerCase()},
    decoration: const InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      icon: Icon(Icons.person),
      labelText: 'Nome',
      labelStyle: TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    ),
  );
}

TextFormField CampoSenha() {
  return TextFormField(
    keyboardType: TextInputType.text,
    obscureText: !passwordVisibility,
    controller: txtSenhaController,
    decoration: const InputDecoration(
      icon: Icon(Icons.password_rounded),
      labelText: 'Senha',
      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      labelStyle: TextStyle(
          color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 16),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black38,
          width: 1,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.0),
          topRight: Radius.circular(4.0),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black38,
          width: 1,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.0),
          topRight: Radius.circular(4.0),
        ),
      ),
      // suffixIcon: InkWell(
      //   // onTap: () => setState(
      //   //   () => passwordVisibility = !passwordVisibility,
      //   // ),
      //   child: Icon(
      //     passwordVisibility
      //         ? Icons.visibility_outlined
      //         : Icons.visibility_off_outlined,
      //     color: const Color(0xFF757575),
      //     size: 22,
      //   ),
      // ),
    ),
  );
}

TextFormField dtNascimento() {
  return TextFormField(
    keyboardType: TextInputType.datetime,
    controller: txtDtNascController,
    onFieldSubmitted: (String teste) =>
        {txtUsuarioController.text.toLowerCase()},
    decoration: const InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      icon: Icon(Icons.calendar_month),
      labelText: 'Data Nascimento',
      labelStyle: TextStyle(
        color: Colors.black38,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
    ),
  );
}

ElevatedButton ButtonCadastrar() {
  return ElevatedButton.icon(
    onPressed: () {
      Usuario(txtUsuarioController.text, textToMd5(txtSenhaController.text),
          txtNomeController.text, txtDtNascController.text);
    },
    icon: const Icon(
      Icons.logout,
      size: 30,
    ),
    label: const Text("Cadastrar-se"),
  );
}

String textToMd5(String text) {
  return md5.convert(utf8.encode(text)).toString();
}
