import 'dart:io';
import 'package:flutter/material.dart';

import 'package:poultrypal/l10n/app_localizations.dart';

class ImagePreviewCard extends StatelessWidget {
  const ImagePreviewCard({
    required this.imageFile, super.key,
  });

  final File imageFile;

  @override
  Widget build(BuildContext context) {
    final i10 = AppLocalizations.of(context);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              i10?.imagePreview ?? '',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 7 / 9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Image.file(
                    imageFile,
                    fit: BoxFit.cover,
                    // height: 250,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ImagePreviewCard extends StatelessWidget {
//   const ImagePreviewCard({
//     super.key,
//     required this.imageFile,
//     required this.onImageSelected,
//   });
//
//   final File? imageFile;
//   final Function(String imagePath) onImageSelected;
//
//   Future<void> _pickImage(BuildContext context, ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source, imageQuality: 85);
//     if (pickedFile != null) {
//       onImageSelected(pickedFile.path);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text(AppLocalizations.of(context)?.noImageSelected ??
//                 'No image selected')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final i10 = AppLocalizations.of(context);
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             Text(
//               i10?.imagePreview ?? "Image Preview",
//               style: Theme.of(context)
//                   .textTheme
//                   .titleMedium
//                   ?.copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//             AspectRatio(
//               aspectRatio: 7 / 9,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: imageFile != null
//                     ? Image.file(
//                         imageFile!,
//                         fit: BoxFit.cover,
//                       )
//                     : Container(
//                         color: Colors.grey[300],
//                         child: const Center(
//                             child: Icon(Icons.image,
//                                 size: 48, color: Colors.grey)),
//                       ),
//               ),
//             ),
//             const SizedBox(height: 12),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: () => _pickImage(context, ImageSource.camera),
//                   icon: const Icon(Icons.camera_alt),
//                   label: Text(
//                     i10?.takePicture ?? "Take Picture",
//                     style: Theme.of(context).textTheme.labelSmall,
//                   ),
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: () => _pickImage(context, ImageSource.gallery),
//                   icon: const Icon(Icons.photo_library),
//                   label: Text(
//                     i10?.selectFromGallery ?? "Select from Gallery",
//                     style: Theme.of(context).textTheme.labelSmall,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
