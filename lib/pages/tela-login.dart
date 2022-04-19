// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../login/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsuarioController = TextEditingController();

  TextEditingController txtSenhaController = TextEditingController();

  bool passwordVisibility = false;

  @override
  void initState() {
    super.initState();
    txtUsuarioController = TextEditingController();
    txtSenhaController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            const Divider(
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            CarregarFoto(),
            const Divider(
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            CampoUsuario(),
            const Divider(
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            CampoSenha(),
            const Divider(
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            ButtonLogar()
          ],
        ),
      ),
    );
  }

  ElevatedButton ButtonLogar() {
    return ElevatedButton.icon(
      onPressed: () {
        Login teste = Login(txtUsuarioController.text, txtSenhaController.text);
        debugPrint('Usuário ' + teste.usuario + '\nSenha: ' + teste.senha);
      },
      icon: const Icon(Icons.login, size: 25),
      label: const Text("Login"),
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
          onTap: () => setState(
            () => passwordVisibility = !passwordVisibility,
          ),
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

  TextFormField CampoUsuario() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: txtUsuarioController,
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          icon: Icon(Icons.person),
          labelText: 'Usuário',
          labelStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w400,
              fontSize: 16)),
    );
  }

  SizedBox CarregarFoto() {
    return SizedBox(
        child: Image.network(
      'https://www.ielb.org.br/public/download/281/simbolo-rgb.png.png',
      width: 100,
      height: 100,
      fit: BoxFit.scaleDown,
    ));
  }
}
