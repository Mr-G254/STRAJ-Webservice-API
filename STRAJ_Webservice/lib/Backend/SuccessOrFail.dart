import 'package:straj_webservice/Enums/OperationStatus.dart';

class SuccessOrFail {
  final OperationStatus status;
  final String? successOrErrorText;
  const SuccessOrFail({ required this.status, this.successOrErrorText});
}