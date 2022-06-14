// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:igreja_app/database.dart';
import 'package:igreja_app/services/route_service.dart';

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

class _RegisterPageState extends State<RegisterPage> {
  late Database db;
  late List docs = [];
  initialise() {
    db = Database();
    db.initialise();
  }

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
      appBar: AppBar(
        title: const Text('Cadastro'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            RouteService routeService = RouteService();
            routeService.login();
          },
        ),
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.direction <= 0) {
            RouteService routeService = RouteService();
            routeService.login();
          }
        },
        child: Padding(
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
                height: 50,
              ),
              CampoSenha(),
              const Divider(
                color: Color.fromARGB(0, 255, 255, 255),
                height: 50,
              ),
              dtNascimento(),
              const Divider(
                color: Color.fromARGB(0, 255, 255, 255),
                height: 50,
              ),
              ButtonCadastrar(db)
            ],
          ),
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
    controller: txtNomeController,
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
            color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 16)),
  );
}

ElevatedButton ButtonCadastrar(Database db) {
  return ElevatedButton.icon(
    onPressed: () {
      //widget.db.create(txtUsuarioController.text, txtSenhaController.text);
    },
    icon: const Icon(Icons.logout, size: 25),
    label: const Text("Cadastrar-se"),
  );
}

void goToLogin() {
  Modular.to.navigate('/login/');
}

//void registrar() {
// Usuario user =
//     Usuario(txtUsuarioController.value.text, txtSenhaController.value.text);
// if (user.userId.isEmpty) {
//   CustomToast.showError("Informe o usuário!");
// } else if (user.password.isEmpty) {
//   CustomToast.showError("Informe a senha!");
// } else {
//   UserService _userService = UserService();
//   try {
//     _userService.createUser(user).then((value) {
//       RouteService routeService = RouteService();
//       routeService.home();
//     });
//   } on Exception catch (error) {
//     CustomToast.showError(error.toString());
//   }
// }
//}

