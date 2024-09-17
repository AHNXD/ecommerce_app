part of 'contact_us_cubit.dart';

@immutable
sealed class ContactUsState {}

final class ContactUsInitial extends ContactUsState {}

final class ContactUsErrorState extends ContactUsState {
  final String message;
  ContactUsErrorState(this.message);
}

final class ContactUsSuccessfulState extends ContactUsState {}

final class ContactUsLoadingState extends ContactUsState {}
