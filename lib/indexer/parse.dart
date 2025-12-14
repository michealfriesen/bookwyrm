import 'dart:core'; // For Regex
import 'dart:convert';
import 'dart:io';

class Book {
  String? path;
  List<int>? chapterLengths;
}

Future<Book?> parseTextFile(String path) async {
  final file = File(path);
  Stream<String> lines = file.openRead()
    .transform(utf8.decoder)
    .transform(LineSplitter());
  try {
    int currentChapter = 0;
    List<int> chapterLengths = [];
    chapterLengths.add(0);
    await for (var line in lines) {
      if (line.startsWith(RegExp(r'^chapter', caseSensitive: false))) {
        currentChapter++;
        chapterLengths.add(0);
      }
      chapterLengths[currentChapter] += line.length;
    }
    print('File is now closed');
    print('Book Stats: $chapterLengths');
  } catch (err) {
    print('Error: $err');
  }
  return null;
}

void main() async {
  parseTextFile('lib/indexer/data/book.txt');
}
