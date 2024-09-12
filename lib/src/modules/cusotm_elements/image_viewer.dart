
import 'package:fit_journey/src/modules/cusotm_elements/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageViewer extends StatelessWidget {
  final String imageUrl;
  final String title;

  ImageViewer({required this.imageUrl,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  CustomText(text: title,fontSize: 13.sp,maxLines: 1,),
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true, // Enable panning
          minScale: 1.0, // Minimum zoom level
          maxScale: 4.0, // Maximum zoom level
          child: Image.network(
            imageUrl,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return  Center(
                child: CustomText(text: 'Failed to load image'),
              );
            },
          ),
        ),
      ),
    );
  }
}
