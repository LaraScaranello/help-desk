// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace

import 'package:app_helpdesk/model/orders.dart';
import 'package:app_helpdesk/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatefulWidget {
  //const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<Orders> listaChamados = [
    Orders(1, 'Problema com monitor', DateTime.now(), true),
    Orders(2, 'Problema com teclado', DateTime.now(), false),
    Orders(3, 'Problema com internet', DateTime.now(), true),
    Orders(4, 'Falta de energia', DateTime.now(), false),
    Orders(5, 'Sistema operacional travando', DateTime.now(), true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: ListTile(
            title: Text(
              "HelpDesk",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 40,
                    color: AppColors.textColorBlue,
                    fontWeight: FontWeight.w600),
              ),
            ),
            subtitle: Text(
              "Conta conosco, estamos aqui para ajudar",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 12,
                  color: AppColors.textColorBlue,
                ),
              ),
            ),
            trailing: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor,
              ),
              child: InkWell(
                child: Icon(
                  Icons.phone_callback_rounded,
                  color: Colors.white,
                ),
                onTap: () {
                  exibirModal(context);
                },
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 32),
          child: Column(
            children: [
              Text(
                "Filtre pelo status do chamado",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: AppColors.textColorBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    width: 124,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primaryColor,
                    ),
                    child: Text(
                      "Finalizados",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    width: 124,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.buttonRed,
                    ),
                    child: Text(
                      "Em aberto",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                      itemCount: listaChamados.length,
                      itemBuilder: (context, index) =>
                          buildOrder(listaChamados[index])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // método que cria a lista de ordens de serviço
  Widget buildOrder(Orders obj) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: 340,
      height: 100,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 234, 235, 236),
        border: Border(
          left: BorderSide(width: 4, color: Colors.red),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        title: Text(
          obj.descricao,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textColorBlue,
            ),
          ),
        ),
        subtitle: Container(
          margin: EdgeInsets.only(top: 25),
          child: Text(
            "Data do chamado " + obj.dataChamado.toString(),
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textDescriptionCard,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // método que vai exibir o modal de criação de uma nova ordem de serviço
  void exibirModal(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Novo chamado",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColorBlue),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Título do chamado",
                    hintStyle: TextStyle(color: AppColors.textColorBlue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Descrição",
                    hintStyle: TextStyle(color: AppColors.textColorBlue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Salvar chamado",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
