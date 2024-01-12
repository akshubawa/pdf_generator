import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfService {
  Future<Uint8List> generatePdf(Map<String, dynamic> uploadedData) async {
    final pdf = pw.Document();

    // final iconImage =
    //     (await rootBundle.load('assets/images/icon.png')).buffer.asUint8List();

    final tableHeaders = [
      "RANSPORTATION OF USED HOUSEHOLD GOODS FOR PERSONAL USE",
      "CHARGES (in Rs)"
    ];

    final tableData = [
      ["Freight Charges", uploadedData["Freight Charges"].toString()],
      [
        "Car Transportation Charges",
        uploadedData["Car Transportation Charges"].toString()
      ],
      ["Loading Charges", uploadedData["Loading Charges"].toString()],
      ["Unloading Charges", uploadedData["Unloading Charges"].toString()],
      ["Packing Charges", uploadedData["Packing Charges"].toString()],
      ["Unpacking Charges", uploadedData["Unpacking Charges"].toString()],
      ["Installation Charges", uploadedData["Installation Charges"].toString()],
      ["Stationary Charges", uploadedData["Stationary Charges"].toString()],
      ["Toll Charges", uploadedData["Toll Charges"].toString()],
      ["GST Charges", uploadedData["GST Charges"].toString()],
      ["Insurance Charges", uploadedData["Insurance Charges"].toString()],
      ["Total Amount", uploadedData["Total Amount"].toString()],
    ];

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Row(children: [
              // pw.Image(pw.MemoryImage(iconImage), height: 72, width: 72),
              pw.SizedBox(width: 1 * PdfPageFormat.mm),
              pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      "AGARWAL PACKERS AND MOVERS INDIA",
                      style: pw.TextStyle(
                          fontSize: 20, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      "Record of Largest Movers. An ISO 9001:2015",
                      style: pw.TextStyle(
                          fontSize: 15, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      "18002707001, 8120087001",
                      style: pw.TextStyle(
                          fontSize: 15, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      "www.agarwalpacker.in | info@agarwalpacker.in",
                      style: pw.TextStyle(
                          fontSize: 15, fontWeight: pw.FontWeight.bold),
                    ),
                  ])
            ]),
            pw.Spacer(),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.start,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Column(
                    children: [
                      pw.Text(
                        "QUOTATION",
                        style: pw.TextStyle(
                            fontSize: 20, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                  pw.Column(
                    children: [
                      pw.Text(
                        "Quotation Id: ${uploadedData["Quotation Id"].toString()}",
                        style: pw.TextStyle(
                            fontSize: 15, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        "Date: ${uploadedData["Movement Date"].toString()}",
                        style: pw.TextStyle(
                            fontSize: 15, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        "Vehicle Type: ${uploadedData["Vehicle Type"].toString()}",
                        style: pw.TextStyle(
                            fontSize: 15, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                  pw.Column(
                    children: [
                      pw.Text(
                        "GST No: 23BYNPA8832JAZ9",
                        style: pw.TextStyle(
                            fontSize: 15, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        "Registration No.: C/891162",
                        style: pw.TextStyle(
                            fontSize: 15, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        "Trade Mark No.: 4001096",
                        style: pw.TextStyle(
                            fontSize: 15, fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ]),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Divider(),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Row(children: [
              pw.Column(
                children: [
                  pw.Text(
                    "To,",
                    style: pw.TextStyle(
                        fontSize: 13, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    "Mr./Ms./Mss: ${uploadedData["Name"].toString()}",
                    style: pw.TextStyle(
                        fontSize: 13, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    "Name of Company: ${uploadedData["Company Name"].toString()}",
                    style: pw.TextStyle(
                        fontSize: 13, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    "Client GST No.: ${uploadedData["GST No."].toString()}",
                    style: pw.TextStyle(
                        fontSize: 13, fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
              pw.Column(
                children: [
                  pw.Text(
                    "Address: ${uploadedData["Address"].toString()}",
                    style: pw.TextStyle(
                        fontSize: 13, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    "Email: ${uploadedData["Email"].toString()}",
                    style: pw.TextStyle(
                        fontSize: 13, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    "Mobile No.: ${uploadedData["Mobile"].toString()}",
                    style: pw.TextStyle(
                        fontSize: 13, fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
            ]),
            pw.SizedBox(height: 5 * PdfPageFormat.mm),
            // pw.TableHelper.fromTextArray(
            //   context: context,
            //   data: tableData,
            //   border: null,
            //   headerStyle:
            //       pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold),
            //   headerDecoration: const pw.BoxDecoration(
            //     color: PdfColors.grey,
            //   ),
            //   cellHeight: 30.0,
            //   cellAlignments: {
            //     0: pw.Alignment.centerLeft,
            //     1: pw.Alignment.centerRight,
            //   },
            //   cellStyle: const pw.TextStyle(
            //     fontSize: 15,
            //   ),
            // ),
          ];
        },
      ),
    );
    return pdf.save();
  }

  Future<void> savePdf(String fileName, Uint8List byteList) async {
    final output = await getTemporaryDirectory();
    var filePath = "${output.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
    await OpenFile.open(filePath);
  }
}
