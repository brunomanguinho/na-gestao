class ErrorPackage {
  factory ErrorPackage.fromMap(Map<String, dynamic> data) {
    return ErrorPackage(
      code: data['code'] as int,
      message: data['message'] as String?,
    );
  }
  ErrorPackage({required this.code, this.message});

  int code;
  String? message;
}

class HttpPackage<T> {
  factory HttpPackage.fromMap(
    Map<String, dynamic> package,
    T Function(Map<String, dynamic>) fromMap,
  ) {
    final bool success = package['success'] as bool;
    final T data = fromMap(package['data'] as Map<String, dynamic>);
    final Map<String, dynamic> error = package['error'] as Map<String, dynamic>;

    final ErrorPackage? errorPackage = error.isEmpty
        ? null
        : ErrorPackage.fromMap(error);

    return HttpPackage._internal(
      success: success,
      data: data,
      error: errorPackage,
    );
  }

  HttpPackage._internal({required this.success, this.data, this.error});

  bool success;
  Object? data;
  ErrorPackage? error;
}
