class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final dynamic responseData;
  final String? errorMessage;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    required this.responseData,
    this.errorMessage = 'Something Went Wrong',
  });
}
