// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors


import 'package:flutter/material.dart';
import '../repository/biblioteca_respository.dart';


class LibraryView extends StatefulWidget {
  const LibraryView({super.key});


  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {

  //Repositório
  final table = LibraryRepository.table;
  int i = -1;

  //Filtro categorias
  List<String> categories = ["Playlist", "Podcasts e programas", "Artistas"];
  int selectedCategoryIndex = -1;

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
                        //Image
                        Row(
                          children: [
                            //image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/user.jpg',
                                fit: BoxFit.cover,
                                width: 30,
                              ),
                            ),
                            SizedBox(width: 10),
                            //Title                 
                            Text( //Titulo                   
                            'Sua Biblioteca',
                              style: TextStyle(
                                fontSize: 18,                        
                                fontWeight: FontWeight.bold,
                              ),
                            ),  
                          ],
                        ),  
                        //Buttons
                        Row( //iCones
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: 14),
                            Icon(Icons.add),
                          ]                
                        )
                      ]                
                    )
                  ),

                  //Filtros
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                      
                            //Back button
                            Row(
                              children:                      
                                List.generate(categories.length, (index) {
                                  return Visibility(
                                    visible: selectedCategoryIndex == index,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          selectedCategoryIndex = -1;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      ),
                                      child: CircleAvatar(
                                        radius: 16,
                                        backgroundColor: Colors.grey.shade800,
                                        child: Icon(
                                          Icons.close,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      )
                                    )
                                  );
                                }
                              )
                            ),
                      
                            //Button categories
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20
                              ),
                              child: Row(
                                children:                      
                                  List.generate(categories.length, (index) {
                                    return Visibility(
                                      visible: selectedCategoryIndex == -1 || selectedCategoryIndex == index,
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 8),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              selectedCategoryIndex = index;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: selectedCategoryIndex == index ? Colors.green : Colors.grey.shade800,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)
                                            )
                                          ),
                                          child:Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 14,
                                              vertical: 10,
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              categories[index],
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),                          
                                          ),
                                        ),
                                      )
                                    );
                                  }
                                )
                              ),
                            ),           
                          ],
                        ),
                      ),
                    ),
                  ),

                  //List
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    child: Column(
                      children: [    
                        //Lista de músicas
                        Column(
                          children: [                              
                            for (int i = 0; i < 5; i++)

                            //função
                            if (selectedCategoryIndex == -1 ||
                                (selectedCategoryIndex == 0 && table[i].content == 'Playlist') ||
                                (selectedCategoryIndex == 1 && table[i].content == 'Podcasts e programas') ||
                                (selectedCategoryIndex == 2 && table[i].content == 'Artistas')
                            )

                            Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Column( //Imagem album
                                    children: [
                                      Image(
                                        image: AssetImage(table[i].img),
                                        width: 70,
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 16),
                                  Column( 
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text( //Nome da músic
                                        table[i].title,
                                        //table[artist].music,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text( //Nome do artista
                                        table[i].content,
                                        //table[artist].title,
                                        style: TextStyle(
                                          fontSize: 12,
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
                    )                  
                  ),
                  
                ],
              )
            )
          )
        ]
      )
    );  
  }
}

