// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../repository/artist_repository.dart';

class AlbumView extends StatefulWidget {
  AlbumView({required int id});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}
class _AlbumViewState extends State<AlbumView> {

  //Posição de rolagem
  late ScrollController scrollController;

  //Tamanho da imagem
  double initialSize = 240;
  double imageSize = 0;

  //Tamanho container
  double containeInitialHeight = 500;
  double containerHeight = 500;
  
  //Opacidade da imagem
  double imageOpacity = 1;

  //Mostrar Menu
  bool showTopBar = false;

  @override
  void initState() {
    imageSize = initialSize;
    scrollController = ScrollController()
    ..addListener(() {

      imageSize = initialSize - scrollController.offset * .6;
      if (imageSize < 0) {
        imageSize = 0;
      }

      containerHeight = containeInitialHeight - scrollController.offset;
      if (containerHeight < 0) {
        containerHeight = 0;
      }

      imageOpacity = imageSize / initialSize;
      if(scrollController.offset > 120) {
        showTopBar = true;
      } else {
        showTopBar = false;
      }
      print(scrollController.offset);

        setState(() {});
    });
    super.initState();
  }

  //Repositório
  final table = ArtistRepository.table;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
            children: [
              
              //Album
              Container(
                width: MediaQuery.of(context).size.width,
                height: containerHeight,
                alignment: Alignment.center,
                color: table[i].color,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: imageOpacity.clamp(0, 1),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.5),
                              offset: Offset(0, 0),
                              blurRadius: 20,
                              spreadRadius: 10,
                            )
                          ]
                        ),
                        child: Image(
                          image: AssetImage(table[i].photo),
                          //AssetImage(table[artist].photo),
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox( height: 80),
                  ],
                ),
              ),

              //Infos
              SafeArea(
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        //color: Colors.blue.withOpacity(0.1),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   color: Colors.blue,
                          //   width: 2,
                          // ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(1),
                            ]
                          )
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              SizedBox(height: initialSize + 32),
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [                                                               
                                    Row( //Title
                                      children: [
                                        Text(
                                          table[i].title,
                                          //table[artist].info,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white60,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),                                  
                                    Row( //Logo Spotift
                                      children: [                  
                                        Icon(
                                          FontAwesomeIcons.spotify,
                                          size: 20,
                                          color: const Color.fromARGB(255, 73, 238, 79),
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          'Spotify',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],                
                                    ),
                                    SizedBox(height: 10),                                 
                                    Row( //Tempo
                                      children: [
                                        Text(
                                          '2.000.000 salvamentos - 2h 43m',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white60,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 18),                                
                                    Padding( //Icons
                                      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [                                 
                                          Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.circlePlus,
                                                size: 20,
                                                color: Colors.white60,
                                              ),
                                              SizedBox(width: 24),
                                              Icon(
                                                FontAwesomeIcons.circleDown,
                                                size: 20,
                                                color: Colors.white60,
                                              ),
                                              SizedBox(width: 24),
                                              Icon(
                                                FontAwesomeIcons.ellipsis,
                                                size: 20,
                                                color: Colors.white60,
                                              ),
                                            ],
                                          ),                               
                                          Row(
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.shuffle,
                                                size: 20,
                                                color: Colors.white60,
                                              ),
                                              SizedBox(width: 60),
                                              // Icon(
                                              //   FontAwesomeIcons.solidCirclePlay,
                                              //   size: 46,
                                              //   color: Color.fromARGB(255, 73, 238, 79),
                                              // ),
                                            ],
                                          )                                                      
                                        ],
                                      ),
                                    ),
                                  ]
                                ),            
                              ),
                            ],
                          ),
                        ),
                      ),

                      //Lista de músicas
                      Column(
                        children: [
                          Container(
                            color: Colors.black,
                            padding:
                            EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 30,
                            ),
                            height: MediaQuery.of(context).size.height,
                            //alignment: Alignment.topCenter,
                            child: Row(
                              children: [
                                Column( //Image album
                                  children: [
                                    Image(
                                      image: AssetImage(table[i].photoList),
                                      width: 50,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 16),
                                Column( //Info
                                  children: [
                                    Text( //Nome da músic
                                      table[i].music,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text( //Nome do artista
                                      table[i].title,
                                      //table[artist].title,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),                          
                              ],
                            ),                     
                          ),
                        ],
                      ),                  
                    ],
                  ),
                )
              ),

              //Componentes
              Positioned(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: SafeArea(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [

                          //Seta voltar
                          Positioned(
                            left: 2,
                            top: 10,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                FontAwesomeIcons.chevronLeft,
                                color: Colors.black,
                                size: 16,
                              ),
                            )
                          ), 

                          AnimatedOpacity(
                            duration: Duration(milliseconds: 100),
                            opacity: showTopBar ? 1 : 0,
                          ),
                          
                          //Botão reproduzir
                          Positioned(
                            right: 0,
                            bottom: 90 - containerHeight.clamp(125.0, double.infinity),
                            child: Stack(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff14D860),
                                  ),
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 38,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ]
                      ),
                    ),
                  )          
                )
              ),
            ]
          )
        
      
    );
  }
}
