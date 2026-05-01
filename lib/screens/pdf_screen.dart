import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatelessWidget {
  final String assetPath;
  const PdfScreen({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary PDF')),
      body: Stack(
        children: [
          SfPdfViewer.asset(assetPath),
          IgnorePointer(
            child: Center(
              child: Opacity(
                opacity: 0.12,
                child: Transform.rotate(
                  angle: -0.5,
                  child: const Text(
                    'Student Watermark\nName / Phone / Email',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
