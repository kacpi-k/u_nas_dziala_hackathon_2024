import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/appbar/app_bar.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/assets/app_pdf.dart';

class AttachmentView extends StatefulWidget {
  final String pathExec;
  final String documentName;
  const AttachmentView({super.key,required this.pathExec, required this.documentName});

  @override
  State<AttachmentView> createState() => _AttachmentViewState();
}

class _AttachmentViewState extends State<AttachmentView> {
  String localPath = '';
  @override
  void initState() {
    super.initState();
    loadPdf();
  }

  Future<void> loadPdf() async {
    String path = await getFileFromAsset(widget.pathExec);
    setState(() {
      localPath = path;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(title: Text(widget.documentName),),
      body: localPath.isNotEmpty
          ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PDFView(
                filePath: localPath,
              ),
          )
          : const Center(child: CircularProgressIndicator()),
      
    );
  }
}

Future<String> getFileFromAsset(String assetPath) async {
  try {
    // Załaduj plik z assets
    ByteData data = await rootBundle.load(assetPath);
    List<int> bytes = data.buffer.asUint8List();

    // Uzyskaj ścieżkę do tymczasowego katalogu
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    // Utwórz pełną ścieżkę do nowego pliku
    File tempFile = File('$tempPath/temp.pdf');

    // Zapisz dane binarne jako plik PDF
    await tempFile.writeAsBytes(bytes, flush: true);

    // Zwróć ścieżkę do nowego pliku
    return tempFile.path;
  } catch (e) {
    throw Exception('Błąd podczas ładowania pliku PDF: $e');
  }
}