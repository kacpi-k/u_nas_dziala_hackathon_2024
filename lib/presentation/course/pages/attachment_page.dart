import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/appbar/app_bar.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/assets/app_pdf.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/course/pages/attachment_view.dart';

class AttachmentPage extends StatelessWidget {
  const AttachmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    List attachmentList = ['Załącznik nr.1 ', 'Załącznik nr.2', 'Prezentacja '];
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Center(
                child: Text(
              'Materiały szkoleniowe',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: attachmentList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            String path;
                            if (index == 0) {
                              path = AppPdf.ppptPDF;
                            } else if (index == 1) {
                              path = AppPdf.examplePDF;
                            } else {
                              path = AppPdf.samplePDF;
                            }

                            return AttachmentView(
                                pathExec: path,
                                documentName: attachmentList[index]);
                          }));
                        },
                        child: ListTile(
                          title: Text(attachmentList[index]),
                          trailing: InkWell(
                              onTap: () {
                                String path;
                                if (index == 0) {
                                  path = AppPdf.ppptPDF;
                                } else if (index == 1) {
                                  path = AppPdf.examplePDF;
                                } else {
                                  path = AppPdf.samplePDF;
                                }
                                void savePdfToDevice() async {
                                  print('TEST');
                                  PdfSaver pdfSaver = PdfSaver();
                                  await pdfSaver.savePdfFromAssets(
                                      path, 'saved_file.pdf');
                                }
                                savePdfToDevice();
                              },
                              child: const Icon(Icons.more_vert)),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class PdfSaver {
  // Funkcja, która kopiuje plik PDF z assets i zapisuje go na urządzeniu
  Future<void> savePdfFromAssets(String assetPath, String fileName) async {
    try {
      // Odczytaj plik PDF z zasobów
      final byteData = await rootBundle.load(assetPath);

      // Uzyskaj katalog dokumentów aplikacji
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';

      // Zapisz plik PDF na urządzeniu
      final file = File(filePath);
      await file.writeAsBytes(byteData.buffer.asUint8List());

      print('Plik PDF został zapisany w: $filePath');
    } catch (e) {
      print('Wystąpił błąd podczas zapisywania pliku: $e');
    }
  }
}
