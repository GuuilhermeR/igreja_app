// ignore_for_file: file_names, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:igreja_app/Models/User/user.dart';
import 'package:igreja_app/Services/login_service.dart';
import 'package:igreja_app/Widgets/custom_toast.dart';
import 'package:igreja_app/services/route_service.dart';
import 'package:lottie/lottie.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordVisibility = false;

  FocusNode focusNodeSenha = FocusNode();
  FocusNode focusNodeLogin = FocusNode();

  final form = FormGroup({
    'userId': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  @override
  void initState() {
    super.initState();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(top: 60, left: 15, right: 15, bottom: 60),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              const Divider(
                color: Color.fromARGB(0, 255, 255, 255),
                height: 50,
              ),
              CarregarFoto(),
              const Divider(
                color: Color.fromARGB(0, 255, 255, 255),
                height: 50,
              ),
              ReactiveForm(
                  child: Column(
                    children: [
                      CampoUsuario(),
                      const Divider(
                        color: Color.fromARGB(0, 255, 255, 255),
                        height: 30,
                      ),
                      CampoSenha(),
                    ],
                  ),
                  formGroup: form),
              const Divider(
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              const Divider(
                color: Color.fromARGB(0, 255, 255, 255),
                height: 40,
              ),
              ButtonLogar(),
              const Divider(
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              ButtonCadastrar()
            ],
          ),
        ),
      ),
    );
  }

  void logar() {
    form.markAsTouched();
    if (form.valid) {
      Future.delayed(Duration.zero, () => showAlert(context));
      User user = User.fromJson(form.value);
      LoginService _loginService = LoginService();
      _loginService.login(user).then((value) {
        if (value != null) {
          Navigator.of(context).pop();
          RouteService routeService = RouteService();
          routeService.home();
        }
      }).catchError((error) {
        Navigator.of(context).pop();
        CustomToast.showError(error.toString());
        return;
      });
      Navigator.of(context).pop();
    }
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Lottie.asset("79582-gec-church.json"),
            ));
  }

  SizedBox ButtonLogar() {
    return SizedBox(
      height: 40,
      width: 220,
      child: ElevatedButton.icon(
        onPressed: () {
          form.valid ? logar() : null;
        },
        icon: const Icon(Icons.login, size: 25),
        label: const Text("Login"),
      ),
    );
  }

  SizedBox ButtonCadastrar() {
    return SizedBox(
      height: 40,
      width: 220,
      child: ElevatedButton.icon(
        onPressed: () {
          RouteService routeService = RouteService();
          routeService.registerUser();
        },
        icon: const Icon(Icons.logout, size: 25),
        label: const Text("Cadastrar-se"),
      ),
    );
  }

  ReactiveTextField CampoSenha() {
    return ReactiveTextField(
      keyboardType: TextInputType.text,
      obscureText: !passwordVisibility,
      formControlName: 'password',
      validationMessages: (control) => {'required': 'Campo Obrigatório.'},
      decoration: InputDecoration(
        icon: const Icon(Icons.password),
        labelText: 'Senha',
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        labelStyle: const TextStyle(
            color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 16),
        suffixIcon: InkWell(
          onTap: () => setState(
            () => passwordVisibility = !passwordVisibility,
          ),
          child: Icon(
            passwordVisibility
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: const Color(0xFF757575),
            size: 16,
          ),
        ),
      ),
    );
  }

  ReactiveTextField CampoUsuario() {
    return ReactiveTextField(
      formControlName: 'userId',
      validationMessages: (control) => {'required': 'Campo Obrigatório.'},
      textInputAction: TextInputAction.next,
      onSubmitted: () => form.focus('password'),
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
        child: Image.asset(
      "logo-header.png",
      width: 80,
      height: 150,
      fit: BoxFit.scaleDown,
    ));
    // child: Lottie.asset("98432-loading.json", width: 128, height: 150));
  }
}
