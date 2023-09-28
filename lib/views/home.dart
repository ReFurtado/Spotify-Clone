// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widget/album_card.dart';
import '../widget/recently_album.dart';
import '../widget/row_album.dart';
import 'album_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  //Data atual
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                children: [   

                  //Cabeçalho
                  Padding(  
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [                   
                        Text( //Titulo                   
                          classHours(now.hour),
                          style: TextStyle(
                            fontSize: 18,                        
                            fontWeight: FontWeight.bold,
                          ),
                        ),  
                        Row( //iCones
                          children: [
                            Icon(FontAwesomeIcons.bell),
                            SizedBox(width: 14),
                            Icon(Icons.history),
                            SizedBox(width: 14),
                            Icon(Icons.settings),
                          ]                
                        )
                      ]                
                    )
                  ),

                  //1º Categoria
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            RowAlbum(
                              label: 'Mega Hit Mix',
                              image: AssetImage('assets/megahit.jpg'),
                            ),
                            SizedBox(width: 12),
                            RowAlbum(
                              label: 'Indie Rock Club',
                              image: AssetImage('assets/indie.jpg'),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            RowAlbum(
                              label: 'TED Talks',
                              image: AssetImage('assets/ted.jpg'),
                            ),
                            SizedBox(width: 12),
                            RowAlbum(
                              label: 'Relax',
                              image: AssetImage('assets/relax.jpg'),
                            ),
                          ],
                        ),                      
                      ],
                    ),
                  ),

                  //2º Categoria
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: Row(
                      children: [                      
                        Text(
                          'Álbuns em alta pra você',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),

                  //Albuns
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),                    
                    child: Row(
                      children: [
                        AlbumCard(
                          label: 'The essential tracks',
                          image: AssetImage('assets/thisis1.jpg'),
                          onTap: () {
                            navigateToAlbumView(context);
                          }
                        ),
                        SizedBox(width: 20),
                        AlbumCard(
                          label: 'Hinos Pop',
                          image: AssetImage('assets/hinos.jpg'),
                          onTap: () {
                            navigateToAlbumView(context);
                          }
                        ),
                        SizedBox(width: 20),
                        AlbumCard(
                          label: 'The essential tracks',
                          image: AssetImage('assets/thisis2.jpg'),
                          onTap: () {
                            navigateToAlbumView(context);
                          }
                        ),
                        SizedBox(width: 20),
                        AlbumCard(
                          label: 'Best Mode',
                          image: AssetImage('assets/dualipa.jpg'),
                          onTap: () {
                            navigateToAlbumView(context);
                          }
                        ),
                        SizedBox(width: 20),
                        AlbumCard(
                          label: 'Best Mode',
                          image: AssetImage('assets/theweeknd.jpg'),
                          onTap: () {
                            navigateToAlbumView(context);
                          }
                        ),                
                      ],
                    )
                  ),

                  //3º Categoria
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: Row(
                      children: [                      
                        Text(
                          'Tocados recentemente',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),

                  //Albuns
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),                    
                    child: Row(
                      children: [
                        RecentlyAlbum(
                          label: 'Dua Lipa',
                          image: AssetImage('assets/dualipa.jpg'),
                        ),
                        SizedBox(width: 20),
                        RecentlyAlbum(
                          label: 'Artic Monkeys',
                          image: AssetImage('assets/articmonkeys.jpg'),
                        ),
                        SizedBox(width: 20),
                        RecentlyAlbum(
                          label: 'The Weeknd',
                          image: AssetImage('assets/theweeknd.jpg'),
                        ),
                        SizedBox(width: 20),
                        RecentlyAlbum(
                          label: 'Charlie Brown Jr',
                          image: AssetImage('assets/charlie.jpg'),
                        ),
                        SizedBox(width: 20),
                        RecentlyAlbum(
                          label: 'TED Talks',
                          image: AssetImage('assets/ted.jpg'),
                        ),                
                      ],
                    )
                  ),

                  //4º Categoria
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: Row(
                      children: [                      
                        Text(
                          'Mais tocadas',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),

                  //Albuns
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),                    
                    child: Row(
                      children: [
                        AlbumCard(
                          label: 'Mundo: seu relatório diário das faixas mais tocadas',
                          image: AssetImage('assets/top50global.jpg'),
                          onTap: () {
                            navigateToAlbumView(context);
                          }
                        ),
                        SizedBox(width: 20),
                        AlbumCard(
                          label: 'Brasil: seu relatório diário das faixas mais tocadas',
                          image: AssetImage('assets/top50brazil.jpg'),
                          onTap: () {
                            navigateToAlbumView(context);
                          }
                        ),
                        SizedBox(width: 20),
                        AlbumCard(
                          label: 'USA: seu relatório diário das faixas mais tocadas',
                          image: AssetImage('assets/top50usa.jpg'),
                          onTap: () {
                            navigateToAlbumView(context);
                          }
                        ),
                        SizedBox(width: 20),
                        AlbumCard(
                          label: 'México: seu relatório diário das faixas mais tocadas',
                          image: AssetImage('assets/top50mexico.jpg'),
                          onTap: () {
                            navigateToAlbumView(context);
                          }
                        ),
                        SizedBox(width: 20),
                        AlbumCard(
                          label: 'Espanha: seu relatório diário das faixas mais tocadas',
                          image: AssetImage('assets/top50spain.jpg'),
                          onTap: () {
                            navigateToAlbumView(context);
                          }
                        ),                  
                      ],
                    )
                  ),

                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}


void navigateToAlbumView(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AlbumView(id: 1),
    ),
  );
}

//Chamada de boas vindas
String classHours (int hour) {
  if (hour > 6 && hour < 12) {
    return 'Bom dia';
  } else if (hour >= 12 && hour < 18) {
    return 'Boa tarde';
  } else {
    return 'Boa noite';
  }
}
