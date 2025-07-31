import 'package:flutter/services.dart'
    show Uint8List; // For Uint8List if not already imported
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> buildDiagnosisPdf({
  required String appName,
  required String slogan,
  required String diseaseName,
  required String brandedMed,
  required String genericMedicine,
  required String severityLevel,
  required String deathRate,
  required String prevention,
  required String diagnosisR,
  required String desclaimer,
  required String installNow,
  required Uint8List qrImageBytes,
  required Uint8List dm,
}) async {
  final pdf = pw.Document();
  // --- Step 4.1: Load the font bytes ---
  // final fontDataRegular = await rootBundle.load('assets/fonts/kalpurush.ttf');
  // final fontDataBold = await rootBundle.load('assets/fonts/kalpurush.ttf');
  //
  // final ttfRegular = pw.Font.ttf(fontDataRegular.buffer.asByteData());
  // final ttfBold = pw.Font.ttf(fontDataBold.buffer.asByteData());
  // final ttfRegular = await PdfGoogleFonts.notoSansBengaliRegular();
  // final ttfBold = await PdfGoogleFonts.notoSansBengaliBold();
  // ------------------------------------

  // Create a pw.MemoryImage from the Uint8List
  final qrPdfImage = pw.MemoryImage(qrImageBytes);
  final dmPdfImage = pw.MemoryImage(dm);

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      mainAxisAlignment: pw.MainAxisAlignment.center,
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      // margin: const pw.EdgeInsets.all(22),
      build: (context) => [
        pw.Text(appName,
            style: pw.TextStyle(
              fontSize: 20, fontWeight: pw.FontWeight.bold,
              // font: ttfBold
            )),
        pw.SizedBox(height: 4),
        pw.Text(slogan,
            style: pw.TextStyle(
              fontSize: 8, color: PdfColors.grey, // fontBold: ttfRegular,
            )),
        pw.SizedBox(height: 14),
        pw.Text(diagnosisR,
            style: pw.TextStyle(
              fontSize: 16,
              fontWeight: pw.FontWeight.bold,
              //font: ttfBold,
            )),
        pw.SizedBox(height: 14),
        // put the image HERE
        pw.Image(dmPdfImage, width: 200, height: 200),
        pw.SizedBox(height: 14),
        pw.Divider(),
        _buildKeyValue(
          'Disease Detected', diseaseName,
          //     defaultFont: ttfRegular
        ),
        _buildKeyValue(
          'Branded Medicine', brandedMed, // defaultFont: ttfRegular
        ),
        _buildKeyValue(
          'Generic Medicine', genericMedicine,
          //     defaultFont: ttfRegular
        ),
        _buildKeyValue(
          'Severity Level', severityLevel,
          // defaultFont: ttfRegular
        ),
        _buildKeyValue(
          'Death Rate', deathRate, // defaultFont: ttfRegular
        ),
        _buildKeyValue(
          'Prevention', prevention,
          // defaultFont: ttfRegular
        ),
        pw.SizedBox(height: 6),
        pw.Divider(),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text(installNow,
              style:
                  pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
          // pw.SizedBox(height: 8),
          // Use the pw.MemoryImage here
          pw.Column(mainAxisSize: pw.MainAxisSize.min, children: [
            pw.Image(qrPdfImage, width: 100, height: 100),
            pw.UrlLink(
                child: pw.Text(
                  'http://tiny.cc/poultrypal',
                  style: const pw.TextStyle(
                    color: PdfColors.blue, // Make it look like a link
                    decoration: pw.TextDecoration.underline, // Underline it
                  ),
                ),
                destination: 'http://tiny.cc/poultrypal'),
          ]),
        ]),

        pw.Text('\n$desclaimer}',
            style: pw.TextStyle(
              fontSize: 8,
              fontStyle: pw.FontStyle.italic,
            )),
      ],
    ),
  );

  return pdf.save();
}

pw.Widget _buildKeyValue(
  String label,
  String value,
  // {pw.Font defaultFont= PdfGoogleFonts.nunitoRegular()}
) {
  return pw.Container(
    margin: const pw.EdgeInsets.symmetric(vertical: 6),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          flex: 2,
          child: pw.Text('$label:',
              style: pw.TextStyle(
                fontWeight: pw.FontWeight.bold, // font: defaultFont
              )),
        ),
        pw.Expanded(
            flex: 3,
            child: pw.Text(value,
                style: pw.TextStyle(
                    // font: defaultFont
                    ))),
      ],
    ),
  );
}
