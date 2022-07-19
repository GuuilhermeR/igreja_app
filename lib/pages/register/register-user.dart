// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:igreja_app/models/user/user.dart';
import 'package:igreja_app/services/route_service.dart';
import 'package:igreja_app/services/user_service.dart';
import 'package:igreja_app/widgets/custom_toast.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';

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
            RouteService().login();
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
          margin: const EdgeInsets.only(
            top: 60,
            left: 15,
            right: 15,
            bottom: 60,
          ),
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
                        CampoUsuario(),
                        const Divider(
                          color: Color.fromARGB(0, 255, 255, 255),
                          height: 20,
                        ),
                        CampoSenha(),
                      ],
                    ),
                    formGroup: form),
                const Divider(
                  color: Color.fromARGB(0, 63, 9, 9),
                  height: 30,
                ),
                ButtonCadastrar(context),
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

SizedBox ButtonCadastrar(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.05,
    child: ElevatedButton.icon(
      onPressed: () {
        RouteService().registerUser();
      },
      icon: const Icon(Icons.logout, size: 25),
      label: const Text("Cadastrar-se"),
    ),
  );
}

void registrar(BuildContext context) {
  User user =
      User(txtUsuarioController.value.text, txtSenhaController.value.text);
  if (user.userId.isEmpty) {
    CustomToast.showError("Informe o usuário!", context);
  } else if (user.password.isEmpty) {
    CustomToast.showError("Informe a senha!", context);
  } else {
    UserService _userService = UserService();
    try {
      _userService.createUser(user, context).then((value) {
        RouteService().login();
      });
    } on Exception catch (error) {
      CustomToast.showError(error.toString(), context);
    }
  }
}
