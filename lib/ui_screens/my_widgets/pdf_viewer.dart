import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MyPDFViewer extends StatefulWidget {
  const MyPDFViewer({Key? key, required this.pageTitle, required this.pdfPath}) : super(key: key);

  final String pageTitle,pdfPath;
  @override
  State<MyPDFViewer> createState() => _MyPDFViewerState();
}

class _MyPDFViewerState extends State<MyPDFViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: SfPdfViewer.asset(
        widget.pdfPath,
        canShowScrollHead: true,
        scrollDirection: PdfScrollDirection.vertical,
        canShowPaginationDialog: true,
        enableDoubleTapZooming: true,
        canShowScrollStatus: true,
        interactionMode: PdfInteractionMode.selection,
        pageLayoutMode: PdfPageLayoutMode.continuous,
      ),
    );
  }
}
