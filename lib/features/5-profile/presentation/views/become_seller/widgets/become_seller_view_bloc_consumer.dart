
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:user_online_shop/core/utils/app_color.dart';
// import 'package:user_online_shop/core/utils/app_images.dart';
// import 'package:user_online_shop/core/widgets/custom_dialog.dart';
// import 'package:user_online_shop/core/widgets/loading_dialog.dart';
// import 'package:user_online_shop/core/widgets/show_snackbar.dart';
// import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/cubit/becom_seller_cubit.dart';
// import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/widgets/become_seller_view_body.dart';

// class BecomeSellerViewBlocConsumer extends StatelessWidget {
//   const BecomeSellerViewBlocConsumer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<BecomSellerCubit, BecomSellerState>(
//       listener: (context, state) {
//         if (state is BecomSellerLoading) {
//           loadingDialog(context);
//         }
//         if (state is BecomSellerSuccess) {
//           Navigator.pop(context);
//           Navigator.pop(context);
//           showSnackBar(
//             context,
//             'تم تقديم طلبك بنجاح',
//             AppColor.green,
//           );
//           // Navigator.of(context).pushNamedAndRemoveUntil(
//           //   MainView.routeName,
//           //   (route) => false,
//           // );
//         }
//         if (state is BecomSellerFailed) {
//           Navigator.pop(context);
//           customDialog(
//             context,
//             title: state.errMessage,
//             image: Assets.imagesErrors,
//           );
//         }
//       },
//       child: BecomeSellerViewBody(),
//     );
//   }
// }
