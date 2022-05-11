
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/services.dart'show rootBundle;

import 'mobile.dart' if (dart.library.html) 'web.dart';

class Pdf extends StatefulWidget {
  //const Pdf({Key? key}) : super(key: key);
  String amount;
  Pdf({Key key,this.amount}) : super(key: key);
  @override
  _PdfState createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:ElevatedButton(
          child:Text('Create Pdf'),
          onPressed: _createPDF,
        )
      ),
    );
  }


  Future<void>_createPDF() async {
    PdfDocument document=PdfDocument();
   final page= document.pages.add();
    page.graphics.drawString('order successfully completed',PdfStandardFont(PdfFontFamily.helvetica,30));
    page.graphics.drawImage(
        PdfBitmap(await _readImageData('logo2.png')),
        Rect.fromLTWH(0, 100, 440, 550));
    PdfGrid grid=PdfGrid();
    grid.style=PdfGridStyle(
      font:PdfStandardFont(PdfFontFamily.helvetica,30),
      cellPadding: PdfPaddings(left: 5,right: 2,top: 2,bottom: 2)
    );
    grid.columns.add(count:3);
    grid.headers.add(1);
    PdfGridRow header=grid.headers[0];
    header.cells[0].value='IdNo';
    header.cells[1].value='Name';
    header.cells[2].value='Quantity';
   // header.cells[3].value='Total';

    PdfGridRow row=grid.rows.add();
    row.cells[0].value='1';
    row.cells[0].value='1';
    row.cells[0].value='1';
   // row.cells[0].value='1';
    row=grid.rows.add();
    row.cells[0].value='2';
    row.cells[1].value='2';
    row.cells[2].value='2';
  //  row.cells[3].value='${widget.amount}';
    grid.draw(page: document.pages.add(),bounds:const Rect.fromLTWH(0,0,0,0));
    List<int>bytes=document.save();
    document.dispose();
    saveAndLaunchFile(bytes,'Output.pdf');
  }
  Future<Uint8List> _readImageData(String name)async{
    final data=await rootBundle.load('assets/$name');
    return data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);

  }
}
