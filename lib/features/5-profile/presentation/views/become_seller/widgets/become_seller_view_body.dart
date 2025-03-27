import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
// import 'package:path/path.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:reorderables/reorderables.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:user_online_shop/contants.dart';
import 'package:user_online_shop/core/helper_functions/valid_input.dart';
import 'package:user_online_shop/core/services/supabase_storage.dart';
import 'package:user_online_shop/core/utils/app_images.dart';
import 'package:user_online_shop/core/utils/backend_endpoint.dart';
import 'package:user_online_shop/core/widgets/custom_appbar.dart';
import 'package:user_online_shop/core/widgets/custom_dialog.dart';
import 'package:user_online_shop/core/widgets/custom_text_field.dart';
import 'package:user_online_shop/core/widgets/custome_image_picker_square.dart';
import 'package:user_online_shop/core/widgets/loading_dialog.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/cubit/becom_seller_cubit.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/models/vender_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_online_shop/core/helper_functions/get_user.dart';
import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/utils/app_style.dart';
import 'package:user_online_shop/core/widgets/custom_button.dart';
import 'package:user_online_shop/generated/l10n.dart';

class BecomeSellerViewBody extends StatefulWidget {
  const BecomeSellerViewBody({super.key});
  @override
  State<BecomeSellerViewBody> createState() => _BecomeSellerViewBodyState();
}

class _BecomeSellerViewBodyState extends State<BecomeSellerViewBody> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController nameVendorAr = TextEditingController();
  final TextEditingController nameVendorEn = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController phone = TextEditingController();
  String? image, coverImage;
  List<String> additionalImages = [];

  final user = getUser();

  @override
  void dispose() {
    nameVendorAr.dispose();
    nameVendorEn.dispose();
    address.dispose();
    phone.dispose();
    super.dispose();
  }

  final _user = getUser();

  @override
  void initState() {
    super.initState();
    context.read<SellerRequestCubit>().checkRequestStatus(_user.uId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SellerRequestCubit, SellerRequestState>(
      listener: (context, state) {
        if (state is SellerRequestError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is SellerRequestLoading) {
          return Center(
            child: Lottie.asset(
              Assets.imagesLoading,
              height: 200,
              width: 200,
            ),
          );
          // return const Center(child: CircularProgressIndicator());
        }
        if (state is SellerRequestSuccess) {
          switch (state.status) {
            case 'pending':
              return _buildStatusMessage(
                icon: Icons.pending_actions,
                iconColor: Colors.orange,
                title: 'طلبك قيد المراجعة',
                subtitle: 'سيتم إخطارك بمجرد مراجعة طلبك',
              );

            case 'approved':
              return _buildStatusMessage(
                icon: Icons.check_circle,
                iconColor: Colors.green,
                title: 'تم قبول طلبك!',
                subtitle: 'يمكنك الآن البدء في إضافة منتجاتك',
              );

            case 'rejected':
              return _buildRejectedView();

            case 'not_found':
            default:
              return _buildRegistrationForm();
          }
        }

        return _buildRegistrationForm();
      },
    );
  }

  Widget _buildStatusMessage({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: iconColor),
            const SizedBox(height: 16),
            Text(
              title,
              style: AppStyle.styleBold24(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRejectedView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'تم رفض طلبك',
              style: AppStyle.styleBold24(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'يمكنك تقديم طلب جديد بعد مراجعة المتطلبات',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomButton(
              title: 'تقديم طلب جديد',
              buttonColor: AppColor.primaryColor,
              textStyle: AppStyle.styleBold24().copyWith(
                color: AppColor.white,
              ),
              onTap: () {
                context.read<SellerRequestCubit>().deleteRequest(_user.uId);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegistrationForm() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding),
                  child: Text(
                    S.of(context).vendor_message2,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                CustomImagePickerSquare(
                  onFileChanged: (value) {
                    coverImage = value;
                  },
                  onFileChanged2: (value) {
                    image = value;
                  },
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        labels: S.of(context).name_vendor_en,
                        hintText: S.of(context).enter_name_vendor_en,
                        controller: nameVendorEn,
                        validator: (value) {
                          return validInput(
                            context: context,
                            val: nameVendorEn.text,
                            type: 'name',
                            max: 20,
                            min: 5,
                          );
                        },
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        labels: S.of(context).name_vendor_ar,
                        hintText: S.of(context).enter_name_vendor_ar,
                        controller: nameVendorAr,
                        validator: (value) {
                          return validInput(
                            context: context,
                            val: nameVendorAr.text,
                            type: 'name',
                            max: 20,
                            min: 5,
                          );
                        },
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        labels: S.of(context).phone_vendor,
                        hintText: S.of(context).enter_phone_vendor,
                        controller: phone,
                        validator: (value) {
                          return validInput(
                            context: context,
                            val: phone.text,
                            type: 'phone',
                            max: 20,
                            min: 5,
                          );
                        },
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        labels: S.of(context).vendor_address,
                        hintText: S.of(context).enter_vendor_address,
                        controller: address,
                        validator: (value) {
                          return validInput(
                            context: context,
                            val: address.text,
                            type: 'address',
                            max: 50,
                            min: 5,
                          );
                        },
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 20),
                      MultipleImagePicker(
                        onImagesSelected: (images) {
                          setState(() {
                            additionalImages = images;
                          });
                        },
                        initialImages: additionalImages,
                        onFileChanged: (value) {
                          setState(() {
                            image = value;
                          });
                        },
                        additionalImages: additionalImages,
                      ),
                      const SizedBox(
                          height: 80), // Space for the floating button
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 16,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(
              title: S.of(context).become_seller,
              buttonColor: AppColor.primaryColor,
              textStyle: AppStyle.styleBold24().copyWith(
                color: AppColor.white,
              ),
              onTap: _submitForm,
            ),
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    List<String> missingImages = [];

    if (image == null) {
      missingImages.add('صورة الشعار');
    }
    if (coverImage == null) {
      missingImages.add('صورة الغلاف');
    }
    if (additionalImages.isEmpty) {
      missingImages.add('الصور الإضافية');
    }

    if (missingImages.isNotEmpty) {
      String title;
      if (missingImages.length == 1) {
        title = 'يجب تحديد ' + missingImages[0];
      } else {
        title = 'يجب تحديد ' + missingImages.join(' و ');
      }
      customDialog(context, title: title);
      return;
    }

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final vendor = VendorEntity(
        id: _user.uId,
        nameVendorAr: nameVendorAr.text,
        nameVendorEn: nameVendorEn.text,
        email: _user.email,
        phone: _user.phone,
        address: address.text,
        image: image!,
        coverImage: coverImage!,
        status: 'pending',
        createdAt: DateTime.now().toString(),
        updatedAt: '',
        productIds: [],
        settings: {},
        rating: 0,
        totalOrders: 0,
        balance: 0,
        additionalImages: additionalImages,
      );

      context.read<SellerRequestCubit>().submitRequest(vendor);
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }

// void _submitForm() {
//   List<String> missingImages = [];

//   if (image == null) {
//     missingImages.add('صورة الشعار');
//   }
//   if (coverImage == null) {
//     missingImages.add('صورة الغلاف');
//   }

//   if (missingImages.isNotEmpty) {
//     String title = 'يجب تحديد ' + missingImages.join(' و ');
//     customDialog(context, title: title);
//     return;
//   }

//   if (formKey.currentState!.validate()) {
//     formKey.currentState!.save();
//     final vendor = VendorEntity(
//       id: _user.uId,
//       nameVendorAr: nameVendorAr.text,
//       nameVendorEn: nameVendorEn.text,
//       email: _user.email,
//       phone: _user.phone,
//       address: address.text,
//       image: image!,
//       coverImage: coverImage!,
//       status: 'pending',
//       createdAt: DateTime.now().toString(),
//       updatedAt: '',
//       productIds: [],
//       settings: {},
//       rating: 0,
//       totalOrders: 0,
//       balance: 0,
//       additionalImages: additionalImages,
//     );

//     context.read<SellerRequestCubit>().submitRequest(vendor);
//   } else {
//     setState(() {
//       autoValidateMode = AutovalidateMode.always;
//     });
//   }
// }

  // void _submitForm() {
  //   if (image != null && coverImage != null && additionalImages.isNotEmpty) {
  //     if (formKey.currentState!.validate()) {
  //       formKey.currentState!.save();
  //       final vendor = VendorEntity(
  //         id: _user.uId,
  //         nameVendorAr: nameVendorAr.text,
  //         nameVendorEn: nameVendorEn.text,
  //         email: _user.email,
  //         phone: _user.phone,
  //         address: address.text,
  //         image: image!,
  //         coverImage: coverImage!,
  //         status: 'pending',
  //         createdAt: DateTime.now().toString(),
  //         updatedAt: '',
  //         productIds: [],
  //         settings: {},
  //         rating: 0,
  //         totalOrders: 0,
  //         balance: 0,
  //         additionalImages: additionalImages,
  //       );
  //       context.read<SellerRequestCubit>().submitRequest(vendor);
  //     } else {
  //       setState(() {
  //         autoValidateMode = AutovalidateMode.always;
  //       });
  //     }
  //   } else {
  //     customDialog(
  //       context,
  //       title: image == null
  //           ? 'Image'
  //           : coverImage == null
  //               ? 'Cover Image'
  //               : 'Additional Image',
  //     );
  //   }
  // }
}

class MultipleImagePicker extends StatefulWidget {
  final Function(List<String>) onImagesSelected;
  final List<String> initialImages;
  final List<String> additionalImages;

  final ValueChanged<String?> onFileChanged;
  // final ValueChanged<String?> onFileChanged2;
  // final bool auth;
  final String? urlImage;
  final int? imageQuality;

  const MultipleImagePicker({
    super.key,
    required this.onImagesSelected,
    required this.additionalImages,
    this.initialImages = const [],
    required this.onFileChanged,
    // required this.onFileChanged2,
    // required this.auth,
    this.urlImage,
    this.imageQuality,
  });

  @override
  State<MultipleImagePicker> createState() => _MultipleImagePickerState();
}

class _MultipleImagePickerState extends State<MultipleImagePicker> {
  final List<String> _selectedImages = [];
  // final ImagePicker _picker = ImagePicker();
  bool isLoading = false;
  File? imageFile;
  String? url;

  @override
  void dispose() {
    imageFile = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _selectedImages.addAll(widget.initialImages);
  }

  // Future<void> _pickImage() async {
  //   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     setState(() {
  //       _selectedImages.add(image.path);
  //     });
  //     widget.onImagesSelected(_selectedImages);
  //   }
  // }

  Future<void> _pickImage() async {
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
        widget.onImagesSelected([url!]);
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

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
    widget.onImagesSelected(_selectedImages);
  }

  void _viewImage(String imagePath, int index) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Image.file(
          File(imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  void _viewImageDouble(String imagePath, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ImageViewer(
          imagePaths: _selectedImages,
          initialIndex: index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey2.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Photos',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ReorderableWrap(
            spacing: 8,
            runSpacing: 8,
            // padding: const EdgeInsets.all(8),
            children: _selectedImages
                .asMap()
                .map((index, imagePath) => MapEntry(
                      index,
                      Stack(
                        key: ValueKey(imagePath),
                        children: [
                          GestureDetector(
                            onTap: () => _viewImage(imagePath, index),
                            onDoubleTap: () =>
                                _viewImageDouble(imagePath, index),
                            child: Container(
                              width: 115,
                              height: 115,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColor.grey2),
                                borderRadius: BorderRadius.circular(8),
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
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Icon(
                                              Icons.error_outline,
                                              color: Colors.red,
                                            );
                                          },
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
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
                                      : widget.urlImage != null
                                          ? Image.network(
                                              widget.urlImage!,
                                              fit: BoxFit.fill,
                                              width: double.infinity,
                                              height: 200,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return const Icon(
                                                  Icons.error_outline,
                                                  color: Colors.red,
                                                );
                                              },
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null)
                                                  return child;
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
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
                                          : Container(),
                                  // : widget.auth == true
                                  // ?   Image.network(
                                  //       imageProfile,
                                  //       fit: BoxFit.fill,
                                  //       width: double.infinity,
                                  //       height: 200,
                                  //       errorBuilder: (context, error,
                                  //           stackTrace) {
                                  //         return const Icon(
                                  //           Icons.error_outline,
                                  //           color: Colors.red,
                                  //         );
                                  //       },
                                  //       loadingBuilder: (context,
                                  //           child, loadingProgress) {
                                  //         if (loadingProgress == null)
                                  //           return child;
                                  //         return Center(
                                  //           child:
                                  //               CircularProgressIndicator(
                                  //             value: loadingProgress
                                  //                         .expectedTotalBytes !=
                                  //                     null
                                  //                 ? loadingProgress
                                  //                         .cumulativeBytesLoaded /
                                  //                     loadingProgress
                                  //                         .expectedTotalBytes!
                                  //                 : null,
                                  //           ),
                                  //         );
                                  //       },
                                  //     )
                                  // : _buildPlaceholderIcon(),
                                  // ),
                                ),
                              ),

                              // ClipRRect(
                              //   borderRadius: BorderRadius.circular(8),
                              //   child: Image.file(
                              //     File(imagePath),
                              //     fit: BoxFit.cover,
                              //   ),
                              // ),
                            ),
                          ),
                          Positioned(
                            right: -5,
                            top: -5,
                            child: GestureDetector(
                              onTap: () => _removeImage(index),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
                .values
                .toList()
              ..add(
                Stack(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: widget.additionalImages.isEmpty
                          ? Center(
                              child: Container(
                                width: 115,
                                height: 115,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.grey2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.add_photo_alternate_outlined,
                                  size: 40,
                                  color: AppColor.grey2,
                                ),
                              ),
                            )
                          : Container(
                              width: 115,
                              height: 115,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColor.grey2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 40,
                                color: AppColor.grey2,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }
                final String item = _selectedImages.removeAt(oldIndex);
                _selectedImages.insert(newIndex, item);
              });
              widget.onImagesSelected(_selectedImages);
            },
          ),
        ],
      ),
    );
  }
}

class ImageViewer extends StatelessWidget {
  final List<String> imagePaths;
  final int initialIndex;

  const ImageViewer({
    super.key,
    required this.imagePaths,
    this.initialIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'title', icon: true),
      body: GestureDetector(
        onTap: () {
          // Navigator.of(context).pop();
        },
        child: PhotoViewGallery.builder(
          itemCount: imagePaths.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: FileImage(File(imagePaths[index])),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
            );
          },
          scrollPhysics: const BouncingScrollPhysics(),
          backgroundDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
          ),
          pageController: PageController(initialPage: initialIndex),
        ),
      ),
    );
  }
}
