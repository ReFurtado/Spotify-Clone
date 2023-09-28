class Library {
  String title, content, img;

  Library({
    required this.title,
    required this.content,
    required this.img,
  }); 
}

class LibraryRepository {
   static List<Library> table = [
      Library(
        title: 'Musicas mais curtidas', 
        content: 'Playlist', 
        img: 'assets/thisis2.jpg',
      ),
      Library(
        title: 'Musicas gravadas', 
        content: 'Playlist', 
        img: 'assets/thisis1.jpg',
      ),
      Library(
        title: 'Seus episódios', 
        content: 'Podcasts e programas', 
        img: 'assets/megahit.jpg',
      ),
      Library(
        title: 'Inglês', 
        content: 'Podcasts e programas', 
        img: 'assets/top50usa.jpg',
      ),
      Library(
        title: 'Charlie Brown Jr', 
        content: 'Artistas', 
        img: 'assets/charlie.jpg',
      ),
   ];
}