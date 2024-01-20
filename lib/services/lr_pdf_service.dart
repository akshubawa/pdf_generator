import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfService {
  Future<Uint8List> generatePdf(Map<String, dynamic> uploadedData) async {
    final pdf = pw.Document();

    final iconImage =
        (await rootBundle.load('assets/images/icon.png')).buffer.asUint8List();

    final tableHeaders = [
      "TRANSPORTATION OF USED HOUSEHOLD GOODS FOR PERSONAL USE",
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
          const double fontSizeFactor = 0.8;
          return [
            pw.Row(children: [
              pw.Row(children: [
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "AGARWAL PACKERS AND MOVERS INDIA",
                        style: pw.TextStyle(
                            fontSize: 18 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold,
                            fontStyle: pw.FontStyle.italic),
                      ),
                      pw.Text(
                        "Record of Largest Movers. An ISO 9001:2015",
                        style: pw.TextStyle(
                            fontSize: 14 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold,
                            fontStyle: pw.FontStyle.italic),
                      ),
                      pw.Text(
                        "18002707001, 8120087001",
                        style: pw.TextStyle(
                            fontSize: 13 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold,
                            fontStyle: pw.FontStyle.italic),
                      ),
                      pw.Text(
                        "www.agarwalpacker.in | info@agarwalpacker.in",
                        style: pw.TextStyle(
                            color: PdfColors.red,
                            fontSize: 12 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold,
                            fontStyle: pw.FontStyle.italic),
                      ),
                    ]),
                pw.SizedBox(width: 12 * PdfPageFormat.mm),
                pw.Container(
                  decoration: const pw.BoxDecoration(color: PdfColors.red),
                  child: pw.Text("Tension Free\nShifting",
                      style: pw.TextStyle(
                          color: PdfColors.white,
                          fontWeight: pw.FontWeight.bold,
                          fontStyle: pw.FontStyle.italic)),
                ),
                pw.SizedBox(width: 5 * PdfPageFormat.mm),
                pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Image(pw.MemoryImage(iconImage),
                          height: 72, width: 72),
                      pw.SizedBox(width: 1 * PdfPageFormat.mm),
                    ]),
              ]),
            ]),
            pw.Divider(),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        padding: const pw.EdgeInsets.all(8),
                        decoration:
                            const pw.BoxDecoration(color: PdfColors.red),
                        child: pw.Text(
                          "QUOTATION",
                          style: pw.TextStyle(
                              fontSize: 15 * fontSizeFactor,
                              fontWeight: pw.FontWeight.bold,
                              fontStyle: pw.FontStyle.italic,
                              color: PdfColors.white),
                        ),
                      ),
                    ],
                  ),
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Quotation Id: ${uploadedData["Quotation Id"].toString()}",
                        style: pw.TextStyle(
                            fontSize: 12 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(
                        height: 1 * PdfPageFormat.mm,
                      ),
                      pw.Text(
                        "Date: ${uploadedData["Movement Date"].toString()}",
                        style: pw.TextStyle(
                            fontSize: 12 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(
                        height: 1 * PdfPageFormat.mm,
                      ),
                      pw.Text(
                        "Vehicle Type: ${uploadedData["Vehicle Type"].toString()}",
                        style: pw.TextStyle(
                            fontSize: 12 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                  pw.Container(
                    padding: const pw.EdgeInsets.all(8),
                    decoration: const pw.BoxDecoration(color: PdfColors.red),
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "GST No: 23BYNPA8832JAZ9",
                          style: pw.TextStyle(
                              fontSize: 12 * fontSizeFactor,
                              fontWeight: pw.FontWeight.bold,
                              fontStyle: pw.FontStyle.italic,
                              color: PdfColors.white),
                        ),
                        pw.SizedBox(
                          height: 1 * PdfPageFormat.mm,
                        ),
                        pw.Text(
                          "Registration No.: C/891162",
                          style: pw.TextStyle(
                              fontSize: 12 * fontSizeFactor,
                              fontWeight: pw.FontWeight.bold,
                              fontStyle: pw.FontStyle.italic,
                              color: PdfColors.white),
                        ),
                        pw.SizedBox(
                          height: 1 * PdfPageFormat.mm,
                        ),
                        pw.Text(
                          "Trade Mark No.: 4001096",
                          style: pw.TextStyle(
                              fontSize: 12 * fontSizeFactor,
                              fontWeight: pw.FontWeight.bold,
                              fontStyle: pw.FontStyle.italic,
                              color: PdfColors.white),
                        ),
                      ],
                    ),
                  ),
                ]),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Divider(),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "To,",
                        style: pw.TextStyle(
                            fontSize: 10 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(
                        height: 1 * PdfPageFormat.mm,
                      ),
                      pw.Text(
                        "Mr. /Ms. /Mss: ${uploadedData["Name"].toString()}",
                        style: pw.TextStyle(
                            fontSize: 10 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(
                        height: 1 * PdfPageFormat.mm,
                      ),
                      pw.Text(
                        "Name of Company: ${uploadedData["Company Name"].toString()}",
                        style: pw.TextStyle(
                            fontSize: 10 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(
                        height: 1 * PdfPageFormat.mm,
                      ),
                      pw.Text(
                        "Client GST No.: ${uploadedData["GST No."].toString()}",
                        style: pw.TextStyle(
                            fontSize: 10 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Address: ${uploadedData["Address"].toString()}",
                        style: pw.TextStyle(
                            fontSize: 12 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(
                        height: 1 * PdfPageFormat.mm,
                      ),
                      pw.Text(
                        "Email: ${uploadedData["Email"].toString()}",
                        style: pw.TextStyle(
                            fontSize: 12 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(
                        height: 1 * PdfPageFormat.mm,
                      ),
                      pw.Text(
                        "Mobile No.: ${uploadedData["Mobile"].toString()}",
                        style: pw.TextStyle(
                            fontSize: 12 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ]),
            pw.SizedBox(height: 3 * PdfPageFormat.mm),
            pw.Container(
              width: double.infinity,
              decoration: const pw.BoxDecoration(color: PdfColors.red),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text("TRANSPORTATION OF USE HOUSEHOLD GOODS & CAR",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 12 * fontSizeFactor,
                          fontStyle: pw.FontStyle.italic,
                          color: PdfColors.white)),
                ],
              ),
            ),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.RichText(
                  text: pw.TextSpan(
                    children: <pw.TextSpan>[
                      const pw.TextSpan(
                        text: 'Dear Sir / Madam, \n',
                        style: pw.TextStyle(
                          color: PdfColors.red,
                          fontSize: 11 * fontSizeFactor,
                        ),
                      ),
                      const pw.TextSpan(
                        text:
                            'We thank you for your valuable enquiry of transportation household goods from ',
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 11 * fontSizeFactor,
                        ),
                      ),
                      pw.TextSpan(
                        text: uploadedData["Transport From"].toString(),
                        style: pw.TextStyle(
                          color: PdfColors.red,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 11 * fontSizeFactor,
                        ),
                      ),
                      const pw.TextSpan(
                        text: ' to ',
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 11 * fontSizeFactor,
                        ),
                      ),
                      pw.TextSpan(
                        text: uploadedData["Transport To"].toString(),
                        style: pw.TextStyle(
                          color: PdfColors.red,
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 11 * fontSizeFactor,
                        ),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 1 * PdfPageFormat.mm),
                pw.Text(
                  "We are pleased to quote our rates for the same as under.",
                  style: const pw.TextStyle(fontSize: 11 * fontSizeFactor),
                ),
                pw.SizedBox(height: 3 * PdfPageFormat.mm),
              ],
            ),
            pw.TableHelper.fromTextArray(
              context: context,
              headers: tableHeaders,
              data: tableData,
              border: pw.TableBorder.all(width: 1, style: pw.BorderStyle.solid),
              headerStyle: pw.TextStyle(
                  fontSize: 10 * fontSizeFactor,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColors.white),
              headerDecoration: const pw.BoxDecoration(
                color: PdfColors.red,
              ),
              cellHeight: 15.0,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.center,
              },
              cellStyle: pw.TextStyle(
                fontSize: 10 * fontSizeFactor,
                fontWeight: pw.FontWeight.bold,
              ),
              cellPadding: const pw.EdgeInsets.all(5),
              rowDecoration: const pw.BoxDecoration(
                color: PdfColors.grey100, // Change the color for the last row
              ),
            ),
            pw.SizedBox(height: 2 * PdfPageFormat.mm),
            pw.Row(children: [
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text("TERMS AND CONDITIONS:",
                        style: pw.TextStyle(
                            fontSize: 13 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.red)),
                    pw.SizedBox(height: 2 * PdfPageFormat.mm),
                    pw.Text(
                      'a) Packing will be done using the best packing materials (such as brown paper, Cora cloth, bubble wrap, foam, thermocol, polythene, plastic, high quality corrugated rolls, etc.)',
                      style: const pw.TextStyle(fontSize: 8 * fontSizeFactor),
                    ),
                    pw.SizedBox(height: 1 * PdfPageFormat.mm),
                    pw.Text(
                      'b) We Would request you to pay as @15% of all charges in advance along with your order & balance charges on completion of packing.',
                      style: const pw.TextStyle(fontSize: 8 * fontSizeFactor),
                    ),
                    pw.SizedBox(height: 1 * PdfPageFormat.mm),
                    pw.Text(
                      'c) For Insurance the full amount of the premium to be paid in full before departure of the consignment.',
                      style: const pw.TextStyle(fontSize: 8 * fontSizeFactor),
                    ),
                    pw.SizedBox(height: 1 * PdfPageFormat.mm),
                    pw.Text(
                      'd) All payments should be made in favor of M/s ARGAWAL PACKERS & MOVERS (IND)',
                      style: const pw.TextStyle(fontSize: 8 * fontSizeFactor),
                    ),
                    pw.SizedBox(height: 1 * PdfPageFormat.mm),
                    pw.Text(
                      'e) We request you to give us 3 days advance notice to give you a prompt service.',
                      style: const pw.TextStyle(fontSize: 8 * fontSizeFactor),
                    ),
                    pw.SizedBox(height: 1 * PdfPageFormat.mm),
                    pw.Text(
                      'f) Service charges extra (as per Government rules).',
                      style: const pw.TextStyle(fontSize: 8 * fontSizeFactor),
                    ),
                    pw.SizedBox(height: 1 * PdfPageFormat.mm),
                    pw.Text(
                      'g) Gas cylinders will be accepted only in empty condition.',
                      style: const pw.TextStyle(fontSize: 8 * fontSizeFactor),
                    ),
                    pw.SizedBox(height: 1 * PdfPageFormat.mm),
                    pw.Text(
                      'h) Minimum 10 ltrs. petrol I diesel should be available in your car to run up to the ramp point and from ramp to door at delivery point.',
                      style: const pw.TextStyle(fontSize: 8 * fontSizeFactor),
                    ),
                  ]),
            ]),
            pw.SizedBox(height: 2 * PdfPageFormat.mm),
            pw.Text(
              'Thanking you and assuring you to our best and prompt services at all times.',
              style: pw.TextStyle(
                  fontSize: 12 * fontSizeFactor,
                  fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 8 * PdfPageFormat.mm),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Text(
                        "Authorized Sign.",
                        style: pw.TextStyle(
                            fontSize: 10 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(
                        height: 1 * PdfPageFormat.mm,
                      ),
                      pw.Text(
                        "AGARWAL PACKERS & MOVERS IND",
                        style: pw.TextStyle(
                            fontSize: 10 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(
                        height: 1 * PdfPageFormat.mm,
                      ),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text(
                        "Client Sign.",
                        style: pw.TextStyle(
                            fontSize: 10 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ]),
            pw.Divider(),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Container(
                        color: PdfColors.red,
                        padding: const pw.EdgeInsets.all(5),
                        child: pw.Text(
                          "Regd Off. : ",
                          style: pw.TextStyle(
                              fontSize: 20 * fontSizeFactor,
                              fontWeight: pw.FontWeight.bold,
                              fontStyle: pw.FontStyle.italic,
                              color: PdfColors.white),
                        ),
                      ),
                    ],
                  ),
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Flat No. 176, Rajendra Park, 3rd Floor",
                        style: pw.TextStyle(
                            fontSize: 9 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(
                        height: 1 * PdfPageFormat.mm,
                      ),
                      pw.Text(
                        "Nangloi New Delhi - 110041",
                        style: pw.TextStyle(
                            fontSize: 9 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(
                        height: 1 * PdfPageFormat.mm,
                      ),
                      pw.Text(
                        "Phone No. 9802645555, 18002707001",
                        style: pw.TextStyle(
                            fontSize: 9 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "Please keep your Cash, Jewellery in your custody Lock. Carrying",
                        style: pw.TextStyle(
                            fontSize: 9 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        "of Liquor, Gas Cylinder, Acid or any type of Liquid(like Ghee Tin,",
                        style: pw.TextStyle(
                            fontSize: 9 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text(
                        "Oil etc.) is totally prohibited.",
                        style: pw.TextStyle(
                            fontSize: 9 * fontSizeFactor,
                            fontWeight: pw.FontWeight.bold),
                      ),
                    ],
                  ),
                ]),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
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
