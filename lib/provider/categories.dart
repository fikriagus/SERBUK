import 'package:blocauth/models/category.dart';
import 'package:flutter/cupertino.dart';

class Categories with ChangeNotifier {
  List<Category> categoriesList = [
    Category(
        categoryTitle: 'Code',
        categoryLink: 'Code',
        iconLink: 'images/code.png'),
    Category(
        categoryTitle: 'Seni ',
        categoryLink: 'Art and Literature',
        iconLink: 'images/literature.png'),
    Category(
        categoryTitle: 'Biography /\n Autobiography',
        categoryLink: 'Biography Autobiography',
        iconLink: 'images/biography.png'),
    Category(
        categoryTitle: 'Masakan',
        categoryLink: 'cooking',
        iconLink: 'images/cooking.png'),
    Category(
        categoryTitle: 'Drama',
        categoryLink: 'drama',
        iconLink: 'images/drama.png'),
    Category(
        categoryTitle: 'Edukasi',
        categoryLink: 'Education',
        iconLink: 'images/education.png'),
    Category(
        categoryTitle: 'Fantasi',
        categoryLink: 'fantasy',
        iconLink: 'images/fantasy.png'),
    Category(
        categoryTitle: 'Fiction',
        categoryLink: 'fiction',
        iconLink: 'images/fiction.png'),
    Category(
        categoryTitle: 'Sejarah',
        categoryLink: 'historical',
        iconLink: 'images/history.png'),
    Category(
        categoryTitle: 'Horror',
        categoryLink: 'horror',
        iconLink: 'images/horror.png'),
    Category(
        categoryTitle: 'Komedi',
        categoryLink: 'humor',
        iconLink: 'images/humor.png'),
    Category(
        categoryTitle: 'Religi',
        categoryLink: 'religious',
        iconLink: 'images/religious.png'),
    Category(
        categoryTitle: 'Olah\n Raga',
        categoryLink: 'sports',
        iconLink: 'images/sports.png'),
    Category(
        categoryTitle: 'Suspense',
        categoryLink: 'suspense',
        iconLink: 'images/suspense.png'),
    Category(
        categoryTitle: 'Thriller',
        categoryLink: 'thriller',
        iconLink: 'images/thriller.png'),
    Category(
        categoryTitle: 'Travel /\n Photography',
        categoryLink: 'Travel and Photography',
        iconLink: 'images/travel.png'),
  ];
}
