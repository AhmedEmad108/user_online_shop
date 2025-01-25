// import 'package:flutter/material.dart';
// import 'package:dashboard_online_shop/core/utils/app_color.dart';
// import 'package:dashboard_online_shop/core/utils/app_style.dart';
// import 'package:dashboard_online_shop/core/widgets/custom_button.dart';
// import 'package:dashboard_online_shop/generated/l10n.dart';

// class EmptyStateWidget extends StatelessWidget {
//   final String message;
//   final IconData icon;
//   final VoidCallback? onRefresh;

//   const EmptyStateWidget({
//     super.key,
//     required this.message,
//     this.icon = Icons.hourglass_empty,
//     this.onRefresh,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 64, color: Theme.of(context).primaryColor),
//           const SizedBox(height: 16),
//           Text(
//             message,
//             style: AppStyle.styleRegular16(),
//             textAlign: TextAlign.center,
//           ),
//           if (onRefresh != null) ...[
//             const SizedBox(height: 16),
//             CustomButton(
//               onTap: onRefresh,
//               title: S.of(context).refresh,
//               buttonColor: AppColor.primaryColor,
//               textStyle: AppStyle.styleRegular16(),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }

// class ErrorHandlingWidget extends StatelessWidget {
//   final String error;
//   final VoidCallback onRetry;

//   const ErrorHandlingWidget({
//     super.key,
//     required this.error,
//     required this.onRetry,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(Icons.error_outline, size: 64, color: AppColor.red),
//           const SizedBox(height: 16),
//           Text(
//             error,
//             style:
//                 Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 16),
//           CustomButton(
//             onTap: onRetry,
//             title: S.of(context).retry,
//             buttonColor: AppColor.primaryColor,
//             textStyle: Theme.of(context).textTheme.bodyMedium!,
//             width: 100,
//           ),
//         ],
//       ),
//     );
//   }
// }

// void showSuccessMessage(BuildContext context, String message) {
//   showDialog(
//     context: context,
//     builder: (context) => Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(
//               Icons.check_circle,
//               color: AppColor.green,
//               size: 64,
//             ),
//             const SizedBox(height: 16),
//             Text(
//               message,
//               style: AppStyle.styleRegular16(),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 20),
//             CustomButton(
//               onTap: () => Navigator.pop(context),
//               title: S.of(context).ok,
//               buttonColor: AppColor.primaryColor,
//               textStyle: AppStyle.styleRegular16(),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// class CategoryListView extends StatelessWidget {
//   final List<CategoryEntity> categories;
//   final bool isLoading;
//   final String? error;
//   final VoidCallback onRefresh;

//   const CategoryListView({
//     super.key,
//     required this.categories,
//     this.isLoading = false,
//     this.error,
//     required this.onRefresh,
//   });

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (error != null) {
//       return ErrorHandlingWidget(
//         error: error!,
//         onRetry: onRefresh,
//       );
//     }

//     if (categories.isEmpty) {
//       return EmptyStateWidget(
//         message: S.of(context).no_categories_found,
//         icon: Icons.category_outlined,
//         onRefresh: onRefresh,
//       );
//     }

//     return RefreshIndicator(
//       onRefresh: () async => onRefresh(),
//       child: ListView.builder(
//         itemCount: categories.length,
//         itemBuilder: (context, index) => CategoryItem(
//           categories: categories[index],
//           view: true,
//         ),
//       ),
//     );
//   }
// }

// Future<bool> showConfirmationDialog(
//   BuildContext context, {
//   required String title,
//   required String message,
//   String? confirmText,
//   String? cancelText,
// }) async {
//   final result = await showDialog<bool>(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text(title),
//       content: Text(message),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context, false),
//           child: Text(cancelText ?? S.of(context).cancel),
//         ),
//         TextButton(
//           onPressed: () => Navigator.pop(context, true),
//           child: Text(
//             confirmText ?? S.of(context).confirm,
//             style: TextStyle(color: AppColor.red),
//           ),
//         ),
//       ],
//     ),
//   );
//   return result ?? false;
// }

