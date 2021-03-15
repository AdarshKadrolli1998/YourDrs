import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';



class MyApp1 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp1> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL('http://conorlastowka.com/book/CitationNeededBook-Sample.pdf');

    setState(() => _isLoading = false);
  }

  // changePDF(value) async {
  //   setState(() => _isLoading = true);
  //   if (value == 1) {
  //     document = await PDFDocument.fromAsset('assets/sample2.pdf');
  //   } else if (value == 2) {
  //     document = await PDFDocument.fromURL(
  //       "http://conorlastowka.com/book/CitationNeededBook-Sample.pdf",
  //       /* cacheManager: CacheManager(
  //         Config(
  //           "customCacheKey",
  //           stalePeriod: const Duration(days: 2),
  //           maxNrOfCacheObjects: 10,
  //         ),
  //       ), */
  //     );
  //   } else {
  //     document = await PDFDocument.fromAsset('assets/sample.pdf');
  //   }
  //   setState(() => _isLoading = false);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: Drawer(
        //   child: Column(
        //     children: <Widget>[
        //       SizedBox(height: 36),
        //       ListTile(
        //         title: Text('Load from URL'),
        //         onTap: () {
        //           changePDF(2);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(
            document: document,
            zoomSteps: 1,
          ),
        ),
    );
  }
}