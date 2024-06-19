class NetworkResponse{

  final int StatusCode;
  final bool isSuccess;
  final dynamic responseData;
  final String? errorMessage;

  NetworkResponse({
    required this.StatusCode,
    required this.isSuccess,
    required this.responseData,
    required this.errorMessage});
}