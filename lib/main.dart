// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:app_helpdesk/pages/home/home_page.dart';
import 'package:app_helpdesk/pages/login/login_page.dart';
import 'package:app_helpdesk/pages/orders/order-page.dart';
import 'package:app_helpdesk/pages/register/register_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  // Função para inicializar o firebase, segundo a documentação:
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Para testarmos vamos inserir um usuario
  FirebaseFirestore db = FirebaseFirestore.instance;
  //db.collection("usuarios").doc("001").set({"nome": "Lara scaranello"});

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'order',
    routes: {
      'home': (BuildContext context) => HomePage(),
      'login': (BuildContext context) => LoginPage(),
      'register': (BuildContext context) => RegisterPage(),
      'order': (BuildContext context) => OrderPage(),
    },
  ));
}
