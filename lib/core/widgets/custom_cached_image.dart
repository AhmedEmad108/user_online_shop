import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage(
      {super.key,
      required this.image,
      this.placeholder,
      required this.width,
      required this.height});
  final String image;
  final Widget? placeholder;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: image,
        height: height,
        width: width,
        fit: BoxFit.fill,
        // imageBuilder: (context, imageProvider) {
        //   return Container(
        //     width: double.infinity,
        //     margin: const EdgeInsets.all(8),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(8),
        //       image: DecorationImage(
        //         image: imageProvider,
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //   );
        // },

        placeholder: (context, url) {
          return placeholder ??
              const Center(child: CircularProgressIndicator());
        },
        errorWidget: (context, url, error) => Image.network(
          imageUrl,
          height: height,
          width: width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

String imageUrl =
    'https://firebasestorage.googleapis.com/v0/b/online-shop-dcbc6.appspot.com/o/Untitled%20design%20(2).png?alt=media&token=eb5b696f-511a-4d93-9611-aed0e5cfdf69';
