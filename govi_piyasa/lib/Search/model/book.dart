class Book {
  final int id;
  final String title;
  final String author;
  final String urlImage;

  const Book({
     this.id,
     this.author,
     this.title,
     this.urlImage,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json['id'],
        author: json['author'],
        title: json['title'],
        urlImage: json['urlImage'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'author': author,
        'urlImage': urlImage,
      };
}
