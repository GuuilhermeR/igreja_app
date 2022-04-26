// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:igreja_app/Models/User/user.dart';
import 'package:igreja_app/Services/user_service.dart';
import 'package:igreja_app/Widgets/custom_toast.dart';
import 'package:igreja_app/services/route_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

TextEditingController txtNomeController = TextEditingController();
TextEditingController txtUsuarioController = TextEditingController();
TextEditingController txtSenhaController = TextEditingController();
bool passwordVisibility = false;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            const Divider(
              color: Color.fromARGB(0, 255, 255, 255),
              height: 70,
            ),
            CampoNome(),
            const Divider(
              color: Color.fromARGB(0, 255, 255, 255),
              height: 50,
            ),
            CampoUsuario(),
            const Divider(
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            CampoSenha(),
          ],
        ),
      ),
    );
  }
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
            color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 16)),
  );
}

TextFormField CampoNome() {
  return TextFormField(
    keyboardType: TextInputType.text,
    controller: txtUsuarioController,
    onFieldSubmitted: (String teste) =>
        {txtUsuarioController.text.toLowerCase()},
    decoration: const InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        icon: Icon(Icons.person),
        labelText: 'Nome',
        labelStyle: TextStyle(
            color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 16)),
  );
}

TextFormField CampoSenha() {
  return TextFormField(
    keyboardType: TextInputType.text,
    obscureText: !passwordVisibility,
    controller: txtSenhaController,
    decoration: InputDecoration(
      icon: const Icon(Icons.password_rounded),
      labelText: 'Senha',
      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      labelStyle: const TextStyle(
          color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 16),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black38,
          width: 1,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.0),
          topRight: Radius.circular(4.0),
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black38,
          width: 1,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4.0),
          topRight: Radius.circular(4.0),
        ),
      ),
      suffixIcon: InkWell(
        // onTap: () => setState(
        //   () => passwordVisibility = !passwordVisibility,
        // ),
        child: Icon(
          passwordVisibility
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: const Color(0xFF757575),
          size: 22,
        ),
      ),
    ),
  );
}
