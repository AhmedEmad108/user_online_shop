part of 'becom_seller_cubit.dart';

sealed class SellerRequestState extends Equatable {
  const SellerRequestState();

  @override
  List<Object> get props => [];
}
class SellerRequestInitial extends SellerRequestState {}

class SellerRequestLoading extends SellerRequestState {}

class SellerRequestSuccess extends SellerRequestState {
  final String status;
  final Map<String, dynamic>? requestData;

  const SellerRequestSuccess({required this.status, this.requestData});
}

class SellerRequestError extends SellerRequestState {
  final String message;

  const SellerRequestError(this.message);
}


// final class BecomSellerInitial extends BecomSellerState {}

// final class BecomSellerLoading extends BecomSellerState {}

// final class BecomSellerSuccess extends BecomSellerState {
//   final VendorEntity vendorEntity;
//   const BecomSellerSuccess(this.vendorEntity);
// }

// final class BecomSellerFailed extends BecomSellerState {
//   final String errMessage;
//   const BecomSellerFailed({required this.errMessage});
// }
