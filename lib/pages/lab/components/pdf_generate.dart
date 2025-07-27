import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:poultrypal/gen/assets.gen.dart';
import 'package:printing/printing.dart';

import 'gen_pdf.dart';

class PdfGenerate extends StatefulWidget {
  const PdfGenerate(
      {required this.dieseaseImage,
      required this.diseaseName,
      required this.genericMedicine,
      required this.severityLevel,
      required this.deathRate,
      required this.prevention,
      super.key});
  final Uint8List dieseaseImage;
  final String diseaseName,
      genericMedicine,
      severityLevel,
      deathRate,
      prevention;

  @override
  State<PdfGenerate> createState() => _PdfGenerateState();
}

class _PdfGenerateState extends State<PdfGenerate> {
  late Future<Uint8List> _pdfFuture;

  final String appName = 'Poultry Pal';
  final String slogan = 'Snap a Shot to Secure the Flock';

  @override
  void initState() {
    super.initState();
    _pdfFuture = loadPdf();
  }

  Future<Uint8List> loadPdf() async {
    final qrBytes = await rootBundle.load(Assets.img.qrcode.path);

    return await buildDiagnosisPdf(
      appName: appName,
      slogan: slogan,
      diseaseName: widget.diseaseName,
      genericMedicine: widget.genericMedicine,
      severityLevel: widget.severityLevel,
      deathRate: widget.deathRate,
      prevention: widget.prevention,
      qrImageBytes: qrBytes.buffer.asUint8List(),
      dm: widget.dieseaseImage,
    );
  }

  // MODIFIED savePdfToStorage function for both Android 11+ and downwards compatibility
  Future<void> savePdfToStorage(Uint8List pdfData) async {
    if (kIsWeb) {
      // Web doesn't have a local file system in the same way
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Saving files not supported on web directly.')),
      );
      return;
    }

    String? directoryPath;
    final time = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    final fileName =
        'diagnosis_${widget.diseaseName.replaceAll(' ', '_')}_$time.pdf';

    try {
      // --- Platform-specific saving logic ---
      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        final sdkInt = androidInfo.version.sdkInt;

        if (sdkInt >= 29) {
          // Android 10 (API 29) and above
          // For Android 10+, direct access to arbitrary public directories is restricted.
          // The most reliable way to let the user save to Downloads is via the system file picker (SAF).
          // We'll leverage Printing.sharePdf to achieve this, as it opens the share sheet
          // where the user can choose "Save to Files" or "Save to Downloads"
          // This effectively makes the "Save" button behave like a "Share and Save"
          // as direct programmatic saving to Downloads is very limited without MANAGE_EXTERNAL_STORAGE.
          await Printing.sharePdf(
            bytes: pdfData,
            filename: fileName,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Please select a location to save your PDF.')),
          );
          return; // Exit after launching share dialog
        } else {
          // Android 9 (API 28) and below
          // On older Android, we can request storage permission and save directly to Downloads.
          final status = await Permission.storage.request();
          if (status.isGranted) {
            // This is a common path for Downloads on older Android.
            // Note: getExternalStorageDirectory() is for app-specific external storage.
            // To get a public Downloads directory, direct path construction is often used
            // or packages like external_path.
            // For simplicity, we'll try a common public Downloads path.
            directoryPath =
                '/storage/emulated/0/Download'; // Common path for older Android
            final downloadsDir = Directory(directoryPath);
            if (!await downloadsDir.exists()) {
              await downloadsDir.create(recursive: true);
            }
            final file = File('${downloadsDir.path}/$fileName');
            await file.writeAsBytes(pdfData);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('PDF saved to: ${file.path}')),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content:
                      Text('Storage permission denied. Cannot save file.')),
            );
          }
        }
      } else if (Platform.isIOS) {
        // iOS: Files are generally sandboxed. The best approach is to share the file,
        // allowing the user to save it to their "Files" app or other locations.
        // Direct saving to a user-accessible "Downloads" equivalent is not typical.
        await Printing.sharePdf(
          bytes: pdfData,
          filename: fileName,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Please choose a location to save your PDF in Files.')),
        );
      } else {
        // Other platforms (Linux, macOS, Windows) - save to downloads directory
        final directory =
            await getDownloadsDirectory(); // Requires path_provider 2.1.0+ and platform support
        if (directory != null) {
          directoryPath = directory.path;
          final file = File('${directory.path}/$fileName');
          await file.writeAsBytes(pdfData);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('PDF saved to: ${file.path}')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Could not determine downloads directory.')),
          );
        }
      }
    } catch (e, stacktrace) {
      print('Error saving PDF: $e');
      print('Stacktrace: $stacktrace');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save PDF: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PDF Report')),
      body: FutureBuilder<Uint8List>(
        future: _pdfFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load PDF'));
          }

          final pdfData = snapshot.data!;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PdfPreview(
                  build: (format) => pdfData,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => savePdfToStorage(pdfData),
                icon: const Icon(Icons.download),
                label: const Text('Save'),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
