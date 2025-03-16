import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/models/vender_model.dart';

part 'becom_seller_state.dart';

class SellerRequestCubit extends Cubit<SellerRequestState> {
  SellerRequestCubit() : super(SellerRequestInitial());

  final _firestore = FirebaseFirestore.instance;

  Future<void> checkRequestStatus(String userId) async {
    try {
      emit(SellerRequestLoading());
      
      final docSnapshot = await _firestore
          .collection('vendors')
          .doc(userId)
          .get();

      if (docSnapshot.exists) {
        emit(SellerRequestSuccess(
          status: docSnapshot.data()?['status'] ?? 'pending',
          requestData: docSnapshot.data(),
        ));
      } else {
        emit(SellerRequestSuccess(status: 'not_found'));
      }
    } catch (e) {
      emit(SellerRequestError('Failed to check request status: $e'));
    }
  }

  Future<void> submitRequest(VendorEntity vendor) async {
    try {
      emit(SellerRequestLoading());

      // Check for existing request
      final existingRequest = await _firestore
          .collection('vendors')
          .doc(vendor.id)
          .get();

      if (existingRequest.exists) {
        emit(SellerRequestError('You have already submitted a request'));
        return;
      }

      // Submit new request
      await _firestore
          .collection('vendors')
          .doc(vendor.id)
          .set(vendor.toMap());

      emit(SellerRequestSuccess(status: 'pending'));
    } catch (e) {
      emit(SellerRequestError('Failed to submit request: $e'));
    }
  }

  Future<void> deleteRequest(String userId) async {
    try {
      emit(SellerRequestLoading());
      
      await _firestore
          .collection('vendors')
          .doc(userId)
          .delete();

      emit(SellerRequestSuccess(status: 'not_found'));
    } catch (e) {
      emit(SellerRequestError('Failed to delete request: $e'));
    }
  }
}



// class BecomSellerCubit extends Cubit<BecomSellerState> {
//   BecomSellerCubit(this.vendorRepo) : super(BecomSellerInitial());
//   final VendorRepo vendorRepo;
//   Future<void> becomeSeller({required VendorEntity vendor}) async {
//     emit(BecomSellerLoading());
//     final result = await vendorRepo.addVendor(vendor);
//     result.fold((l) => emit(BecomSellerFailed(errMessage: l.message)), (r) {
//       emit(
//         BecomSellerSuccess(vendor),
//       );
//     });
//   }
// }
