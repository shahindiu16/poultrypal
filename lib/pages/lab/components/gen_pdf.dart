import 'package:flutter/services.dart'
    show Uint8List; // For Uint8List if not already imported
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw; // Crucial alias for pdf widgets

Future<Uint8List> buildDiagnosisPdf({
  required String appName,
  required String slogan,
  required String diseaseName,
  required String brandedMed,
  required String genericMedicine,
  required String severityLevel,
  required String deathRate,
  required String prevention,
  required Uint8List qrImageBytes,
  required Uint8List dm,
}) async {
  final pdf = pw.Document();

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
            style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 4),
        pw.Text(slogan,
            style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey)),
        pw.SizedBox(height: 14),
        pw.Text('Diagnosis Report',
            style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 14),
        // put the image HERE
        pw.Image(dmPdfImage, width: 225, height: 225),
        pw.SizedBox(height: 14),
        pw.Divider(),
        _buildKeyValue('Disease Detected', diseaseName),
        _buildKeyValue('Branded Medicine', brandedMed),
        _buildKeyValue('Generic Medicine', genericMedicine),
        _buildKeyValue('Severity Level', severityLevel),
        _buildKeyValue('Death Rate', deathRate),
        _buildKeyValue('Prevention', prevention),
        pw.SizedBox(height: 10),
        pw.Divider(),
        pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
          pw.Text('Install Poultry Pal Now!',
              style:
                  pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
          // pw.SizedBox(height: 8),
          // Use the pw.MemoryImage here
          pw.Image(qrPdfImage, width: 100, height: 100),
        ])
      ],
    ),
  );

  return pdf.save();
}

pw.Widget _buildKeyValue(String label, String value) {
  return pw.Container(
    margin: const pw.EdgeInsets.symmetric(vertical: 6),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          flex: 2,
          child: pw.Text('$label:',
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        ),
        pw.Expanded(flex: 3, child: pw.Text(value)),
      ],
    ),
  );
}
