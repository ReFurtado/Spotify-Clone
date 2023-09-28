// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SearchView extends StatefulWidget {

  @override
  State<SearchView> createState() => _SearchViewState();
}


class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Appbar
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Buscar',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(FontAwesomeIcons.camera),
          )
        ],
      ),

      //Barra busca
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8
            ),
            child: Column(
              children: [
                
                //Barra busca
                Form(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.magnifyingGlass, 
                            size: 18,
                            color: Colors.black
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'O que você quer ouvir?',
                                hintStyle: TextStyle(color: Colors.black),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                SizedBox(height: 30),
          
                //Titulo escolhido
                Row(
                  children: [
                    Text(
                      'Escolhido para você',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold, 
                        color: Colors.white
                      ),
                    )
                  ],
                ),
          
                SizedBox(height: 10),
          
                //Banner
                Container(
                  padding: EdgeInsetsDirectional.all(10),
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6)
                  ),
                  
                  child: Row(
                    children: [
                      //Album
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            image: AssetImage('assets/charlie.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      //Infos
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Crimes reais',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Charlie Brown Jr',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('As melhores músicas de Santos'),
                              SizedBox(height: 30),
                              Row(
                                children: [
                                  Icon(FontAwesomeIcons.ellipsis),
                                  SizedBox(width: 160),
                                  Icon(FontAwesomeIcons.circlePlay),
                                ],
                              ),
                            ],
                          )
                        ],
                      )
            
                    ],
                  ),
                ),
          
                SizedBox(height: 30),
          
                //Titulo navegação
                Row(
                  children: [
                    Text(
                      'Navegar por todas as seções',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold, 
                        color: Colors.white
                      ),
                    )
                  ],
                ),
          
                SizedBox(height: 10),
          
                //Mini banners
                Column(
                  children: [
                    for (int i = 0; i < 3; i++)
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 14,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 180,
                            height: 100,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 25, 103, 28),
                              borderRadius: BorderRadius.circular(6)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Podcasts',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 180,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 37, 11, 117),
                              borderRadius: BorderRadius.circular(6)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Podcasts',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
          
              ],
            ),
          ),
        ),
      ),

    );
  }
}
