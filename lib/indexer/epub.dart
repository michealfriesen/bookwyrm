// ignore_for_file: unused_local_variable

import 'dart:core';
import 'dart:io' as io;

import 'package:epub_pro/epub_pro.dart';
import 'package:microlearning/prompts/prompts.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:markdown/markdown.dart' as md;

class Chapter {
  String name;
  List<Section> sections;

  Chapter({required this.name, required this.sections});
}

class Section {
  List<String> paragraphs;

  Section({required this.paragraphs});
}

List<Chapter> chunkChapters(EpubBook book) {
  var chunkedChapters = <Chapter>[];

  final doc = md.Document();

  for (var chapter in book.chapters) {
    final mdContent = html2md.convert(chapter.htmlContent!);
    final nodes = doc.parse(mdContent);
    final title = switch (chapter.title) {
      null => "",
      _ => chapter.title as String,
    };

    var chunk = Chapter(name: title, sections: []);
    var section = Section(paragraphs: []);

    for (var node in nodes) {
      if (node is! md.Element) {
        continue;
      }

      if (node.tag == "h1") {
        chunk.sections.add(section);
        section = Section(paragraphs: []);
      }

      if (node.tag == "p") {
        section.paragraphs.add(node.textContent);
      }
    }

    chunkedChapters.add(chunk);
  }
  return chunkedChapters;
}

void main() async {
  var fileName = "/Users/glassjack/Downloads/Learn_Haskell_by_Example_v14.epub";
  var targetFile = io.File(fileName);

  var content = await targetFile.readAsBytes();

  var book = await EpubReader.readBook(content);
  // either deepseek-r1:14b or gemma3:4b
  final client = Prompter.withModel('gemma3:4b');
  final chapters = await client.findChapterNames(book);
  final chunkedChapters = chunkChapters(book);

  print(book.title);
  print(book.author);
  print(chapters.contentChapters);
  print(chunkedChapters.length);
}
