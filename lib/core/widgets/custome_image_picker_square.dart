import 'dart:io';
import 'package:user_online_shop/contants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_online_shop/core/services/shared_prefrences_singletone.dart';
import 'package:user_online_shop/core/services/supabase_storage.dart';
import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:user_online_shop/core/utils/backend_endpoint.dart';

class CustomeImagePickerSquare extends StatefulWidget {
  const CustomeImagePickerSquare(
      {super.key,
      required this.onFileChanged,
      this.auth = false,
      this.urlImage,
      this.imageQuality = 50, required this.onFileChanged2});
  final ValueChanged<String?> onFileChanged;
  final ValueChanged<String?> onFileChanged2;
  final bool auth;
  final String? urlImage;
  final int? imageQuality;

  @override
  State<CustomeImagePickerSquare> createState() =>
      _CustomeImagePickerSquareState();
}

class _CustomeImagePickerSquareState extends State<CustomeImagePickerSquare> {
  bool isLoading = false;
  File? imageFile;
  String? url;

  @override
  void dispose() {
    imageFile = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = Prefs.getString('lang');
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          // onTap: pickImage,
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: AppColor.grey3,
              // borderRadius: BorderRadius.circular(8),
              // border: Border.all(color: AppColor.grey),
            ),
            child: Skeletonizer(
              enabled: isLoading,
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(8),
                // child: ClipOval(
                child: url != null
                    ? Image.network(
                        url!,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 200,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                          );
                        },
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
                      )
                    : widget.urlImage != null
                        ? Image.network(
                            widget.urlImage!,
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: 200,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          )
                        : widget.auth == true
                            ? Image.network(
                                imageProfile,
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: 200,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                  );
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                },
                              )
                            : _buildPlaceholderIcon(),
                // ),
              ),
            ),
          ),
        ),
        _buildAddPhotoButton(
          lang: lang,
        ),
        _buildDeleteButton(
          lang: lang,
        ),
        Positioned(
          left: lang == 'en' ? 5 : null,
          right: lang == 'en' ? null : 5,
          bottom: -10,
          child: CustomImagePickerHelp(
            onFileChanged: widget.onFileChanged2,
            radius: 50,
          ),
        ),
      ],
    );
  }

  Future<void> pickImage() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: widget.imageQuality,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (image != null && mounted) {
        imageFile = File(image.path);

        final fileSize = await imageFile!.length();
        if (fileSize > 5 * 1024 * 1024) {
          throw Exception(
              'حجم الصورة كبير جداً. يجب أن يكون أقل من 5 ميجابايت');
        }

        url = await SupabaseStorageService()
            .uploadFile(file: imageFile!, path: BackendEndpoint.images);
        widget.onFileChanged(url);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('حدث خطأ: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
        setState(() {
          isLoading = false;
        });
      }
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget _buildPlaceholderIcon() {
    return Visibility(
      visible: imageFile == null &&
          widget.urlImage == null &&
          url == null &&
          widget.auth == false,

      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: const [
      //     Icon(Icons.add_photo_alternate_outlined, size: 40),
      //     SizedBox(height: 8),
      //     Text('اضغط لإضافة صورة الغلاف'),
      //   ],
      // ),
      child: const Icon(
        Icons.image_outlined,
        color: AppColor.grey,
        size: 100,
      ),
    );
  }

  Widget _buildAddPhotoButton({required String lang}) {
    return Positioned(
      right: lang == 'en' ? 5 : null,
      left: lang == 'en' ? null : 5,
      bottom: 15,
      child: GestureDetector(
        onTap: isLoading ? null : pickImage,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isLoading
                ? AppColor.grey
                : widget.urlImage == null
                    ? AppColor.grey
                    : AppColor.lightPrimaryColor,
          ),
          child: const Icon(
            Icons.add_a_photo_outlined,
            color: AppColor.black,
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton({required String lang}) {
    return Positioned(
      right: lang == 'en' ? 5 : null,
      left: lang == 'en' ? null : 5,
      top: 15,
      child: Visibility(
        visible: url != null,
        child: GestureDetector(
          onTap: () {
            setState(() {
              url = null;
              imageFile = null;
              widget.onFileChanged(null);
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.grey3,
            ),
            child: const Icon(
              Icons.delete,
              color: AppColor.red,
              // size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomImagePickerHelp extends StatefulWidget {
  const CustomImagePickerHelp(
      {super.key,
      required this.onFileChanged,
      this.auth = false,
      this.urlImage,
      required this.radius,
      this.imageQuality = 50});
  final ValueChanged<String?> onFileChanged;
  final bool auth;
  final String? urlImage;
  final double radius;
  final int? imageQuality;

  @override
  State<CustomImagePickerHelp> createState() => _CustomImagePickerHelpState();
}

class _CustomImagePickerHelpState extends State<CustomImagePickerHelp> {
  bool isLoading = false;
  File? imageFile;
  String? url;

  @override
  void dispose() {
    imageFile = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = Prefs.getString('lang');
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Skeletonizer(
            enabled: isLoading,
            child: CircleAvatar(
              radius: widget.radius + 2,
              backgroundColor: widget.urlImage == null || url == null
                  ? AppColor.grey
                  : AppColor.darkPrimaryColor,
              child: CircleAvatar(
                radius: widget.radius,
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                child: ClipOval(
                  child: url != null
                      ? Image.network(
                          url!,
                          fit: BoxFit.cover,
                          width: widget.radius * 2,
                          height: widget.radius * 2,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        )
                      : widget.urlImage != null
                          ? Image.network(
                              widget.urlImage!,
                              fit: BoxFit.cover,
                              width: widget.radius * 2,
                              height: widget.radius * 2,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                );
                              },
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            )
                          : widget.auth == true
                              ? Image.network(
                                  imageProfile,
                                  fit: BoxFit.cover,
                                  width: widget.radius * 2,
                                  height: widget.radius * 2,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.error_outline,
                                      color: Colors.red,
                                    );
                                  },
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                )
                              : _buildPlaceholderIcon(),
                ),
              ),
            ),
          ),
        ),
        _buildAddPhotoButton(),
        _buildDeleteButton(
          lang: lang,
        ),
      ],
    );
  }

  Future<void> pickImage() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: widget.imageQuality,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (image != null && mounted) {
        imageFile = File(image.path);

        final fileSize = await imageFile!.length();
        if (fileSize > 5 * 1024 * 1024) {
          throw Exception(
              'حجم الصورة كبير جداً. يجب أن يكون أقل من 5 ميجابايت');
        }

        url = await SupabaseStorageService()
            .uploadFile(file: imageFile!, path: BackendEndpoint.images);
        widget.onFileChanged(url);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('حدث خطأ: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
        setState(() {
          isLoading = false;
        });
      }
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget _buildPlaceholderIcon() {
    return Visibility(
      visible: imageFile == null &&
          widget.urlImage == null &&
          url == null &&
          widget.auth == false,
      child: const Icon(
        Icons.image_outlined,
        color: AppColor.grey,
        size: 70,
      ),
    );
  }

  Widget _buildAddPhotoButton() {
    return Positioned(
      right: 0,
      left: 0,
      bottom: -15,
      child: GestureDetector(
        onTap: isLoading ? null : pickImage,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isLoading
                ? AppColor.grey
                : widget.urlImage == null
                    ? AppColor.grey3
                    : AppColor.lightPrimaryColor,
          ),
          child: const Icon(
            Icons.add_a_photo_outlined,
            color: AppColor.black,
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton({required String lang}) {
    return Positioned(
      left: lang == 'en' ? 80 : null,
      right: lang == 'en' ? null : 80,
      top: 10,
      child: Visibility(
        visible: url != null,
        child: GestureDetector(
          onTap: isLoading
              ? null
              : () {
                  setState(() {
                    url = null;
                    imageFile = null;
                    widget.onFileChanged(null);
                  });
                },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isLoading
                  ? AppColor.grey
                  : url == null
                      ? AppColor.grey3
                      : AppColor.lightPrimaryColor,
            ),
            child: const Icon(
              Icons.delete_outlined,
              color: AppColor.black,
            ),
          ),
        ),
      ),
    );
  }
}
