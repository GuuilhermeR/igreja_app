// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:igreja_app/Models/User/user.dart';
import 'package:igreja_app/Services/login_service.dart';
import 'package:igreja_app/Services/route_service.dart';
import 'package:igreja_app/Widgets/custom_toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsuarioController = TextEditingController();

  TextEditingController txtSenhaController = TextEditingController();

  bool passwordVisibility = false;

  FocusNode focusNodeSenha = FocusNode();
  FocusNode focusNodeLogin = FocusNode();

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
              height: 70,
            ),
            CarregarFoto(),
            const Divider(
              color: Color.fromARGB(0, 255, 255, 255),
              height: 50,
            ),
            CampoUsuario(),
            const Divider(
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            CampoSenha(),
            const Divider(
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            ButtonLogar(),
            const Divider(
              color: Color.fromARGB(0, 255, 255, 255),
            ),
            ButtonCadastrar()
          ],
        ),
      ),
    );
  }

  void logar() {
    User user =
        User(txtUsuarioController.value.text, txtSenhaController.value.text);
    if (user.userId.isEmpty) {
      CustomToast.showError("Informe o usuário!");
    } else if (user.password.isEmpty) {
      CustomToast.showError("Informe a senha!");
    } else {
      LoginService _loginService = LoginService();
      _loginService.login(user).then((value) {
        if (value != null) {
          CustomToast.showSucess("Você logou!");
        }
      }).catchError((error) {
        CustomToast.showError(error.toString());
      });
    }
  }

  ElevatedButton ButtonLogar() {
    return ElevatedButton.icon(
      focusNode: focusNodeSenha,
      onPressed: () {
        logar();
      },
      icon: const Icon(Icons.login, size: 25),
      label: const Text("Login"),
    );
  }

  ElevatedButton ButtonCadastrar() {
    return ElevatedButton.icon(
      focusNode: focusNodeSenha,
      onPressed: () {},
      icon: const Icon(Icons.logout, size: 25),
      label: const Text("Cadastrar"),
    );
  }

  TextFormField CampoSenha() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: !passwordVisibility,
      controller: txtSenhaController,
      focusNode: focusNodeSenha,
      onFieldSubmitted: (String teste) => {logar()},
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
      onFieldSubmitted: (String teste) => {
        focusNodeSenha.requestFocus(),
        txtUsuarioController.text.toLowerCase()
      },
      onEditingComplete: () => {txtUsuarioController.text.toLowerCase()},
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
      width: 128,
      height: 150,
      fit: BoxFit.scaleDown,
    ));
  }
}
