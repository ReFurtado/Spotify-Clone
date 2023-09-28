// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../views/home.dart';
import '../views/library.dart';
import '../views/search.dart';

class Tabbar extends StatefulWidget {
  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {

  //Página selecionada
  int _selectedBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      bottomNavigationBar: BottomNavigationBar(
        //Mostra o item selecionado
        currentIndex: _selectedBar, 
        onTap: (index) {
          setState(() {
            _selectedBar = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: "Library",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: "Profile",
          // ),
        ]
      ),
      body: Stack(
        children: [
          //Indice de cada guia
          renderView(0, HomeView()),
          renderView(1, SearchView()),
          renderView(2, LibraryView()),
          //renderView(3, ProfileView()),
        ],
      )
    );
  }
  //Visualização de cada guia
  Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: _selectedBar != tabIndex,
      child: Opacity(
        opacity: _selectedBar == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
}
