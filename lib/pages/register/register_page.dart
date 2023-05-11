// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print, unnecessary_new, unused_local_variable, prefer_interpolation_to_compose_strings

import 'package:app_helpdesk/Model/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../utils/appColors.dart';

class RegisterPage extends StatefulWidget {
  //const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Controllers dos Textfields
  TextEditingController nomeController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController senhaController = new TextEditingController();

  // Método que valida campos
  void validaCampos() {
    // Passo 1: recuperar os dados
    String nome = nomeController.text;
    String email = emailController.text;
    String senha = senhaController.text;
    String msgErro = "";

    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty && senha.length < 6) {
          msgErro = "Preencha a senha com mais de 6 caracteres!";
        } else {
          // Cadastra no banco de dados
          // Passo 1: receber os dados da interface em um obj model
          Users user = new Users();
          user.nome = nome;
          user.email = email;
          user.senha = senha;

          // Passo 2: executar o método Cadastrausuario(user)
          cadastraUsuario(user);
        }
      } else {
        msgErro = "Preencha o campo email!";
      }
    } else {
      msgErro = "Preencha o campo nome!";
    }
  }

  // Método que cadastra no firebase o usuário
  void cadastraUsuario(user) async {
    // instanciar o firebase
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(email: user.email, password: user.senha)
        .then((firebaseUser) {
      final SnackBar snackBar = SnackBar(
          content: Text("Cadastrado com sucesso!"),
          duration: Duration(seconds: 5));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }).catchError((erro) {
      print("Aconteceu o erro: " + erro.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crie sua conta"),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              lottieAnimation(),
              Text("Cadastro",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 40,
                        color: AppColors.textColorBlue,
                        fontWeight: FontWeight.w500),
                  )),
              Text("Crie sua conta agora mesmo!",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 22,
                      color: AppColors.textColorBlue,
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                color: AppColors.primaryOpacityColor,
                child: TextField(
                  controller: nomeController,
                  decoration: InputDecoration(
                      hintText: "Nome",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintStyle: TextStyle(color: AppColors.primaryColor),
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.primaryColor,
                      )),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                color: AppColors.primaryOpacityColor,
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "E-mail",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintStyle: TextStyle(color: AppColors.primaryColor),
                      prefixIcon: Icon(
                        Icons.email,
                        color: AppColors.primaryColor,
                      )),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                color: AppColors.primaryOpacityColor,
                child: TextField(
                  controller: senhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Senha",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15),
                      hintStyle: TextStyle(color: AppColors.primaryColor),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.primaryColor,
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    validaCampos();
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonRed,
                  ),
                  child: Text(
                    "Voltar",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    print("Clicou no botão Voltar");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget lottieAnimation() {
  return Container(
    margin: EdgeInsets.only(top: 1, bottom: 3),
    child: Lottie.asset('assets/animations/users.json',
        width: 250, height: 250, fit: BoxFit.fill),
  );
}
