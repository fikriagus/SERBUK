import 'dart:convert';
import 'package:blocauth/models/book.dart';
import 'package:blocauth/services/utils.dart';
import 'package:http/http.dart';

class BookSearchUtils {
  static Future<Book> fetchBookById(String id) async {
    final url = 'https://www.googleapis.com/books/v1/volumes/$id';

    Response response = await get(Uri.dataFromString(url));
    var bookMap = await jsonDecode(response.body);
    return Utils.bookFromJson(bookMap);
  }
}
