// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print, unused_local_variable, prefer_interpolation_to_compose_strings

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../utils/appColors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  void efetuaLogin() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(
            email: emailController.text, password: senhaController.text)
        .then((firebaseUser) {
      final SnackBar snackBar = SnackBar(
          content: Text("Login efetuado com sucesso!"),
          duration: Duration(seconds: 5));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushNamed(context, 'home');
    }).catchError((error) {
      print("Erro ao efetuar o login" + error.toString());
      final SnackBar snackBar = SnackBar(
          content: Text("Email ou senha inválidos!"),
          duration: Duration(seconds: 5));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acesse nosso aplicativo"),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              lottieAnimation(),
              Text("HelpDesk",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 40,
                        color: AppColors.textColorBlue,
                        fontWeight: FontWeight.w500),
                  )),
              Text("O seu aplicativo de helpdesk!",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 22,
                      color: AppColors.textColorBlue,
                    ),
                  )),
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [
                  Icon(Icons.group_add, color: AppColors.primaryColor),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    child: Text("Criar uma conta",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 14, color: AppColors.textColorBlue))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.lock, color: AppColors.primaryColor),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Clicou no recuperar senha");
                    },
                    child: Text("Recuperar senha",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 14, color: AppColors.textColorBlue))),
                  ),
                ]),
              ),
              SizedBox(
                height: 30,
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
                    "Acessar",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    efetuaLogin();
                  },
                ),
              ),
              SizedBox(
                height: 5,
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
    child: Lottie.asset('assets/animations/login.json',
        width: 250, height: 250, fit: BoxFit.fill),
  );
}
