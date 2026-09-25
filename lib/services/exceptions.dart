class ApplicationException implements Exception {
  ApplicationException({required this.code});

  int code;
  String? _message;

  String? get message => _message;
  set message(String message) => _message = message;

  @override
  String toString() {
    return code < 0
        ? 'Erro ao realizar processamento [Código $code]: $message'
        : '$message';
  }
}

enum StatusCodeError {
  //statusCode Messages
  unauthorized(code: 401, message: 'Credenciais inválidas ou sessão expirada.'),
  forbidden(
    code: 403,
    message: 'Você não tem permissão para acessar este recurso.',
  ),
  notFound(code: 404, message: 'Requisição não econtrada.'),
  serverError(
    code: 500,
    message: 'Parece que nossos servidores estão fora do ar. Tente novamente mais tarde.',
  ),
  unknown(code: -1, message: 'Ocorreu um erro inesperado.');

  const StatusCodeError({required this.code, required this.message});

  final int code;
  final String message;

  static StatusCodeError fromInt(int code) {
    return StatusCodeError.values.firstWhere(
      (element) => element.code == code,
      orElse: () => StatusCodeError.unknown,
    );
  }
}

class StatusCodeException extends ApplicationException implements Exception {
  StatusCodeException({required super.code})
    : errorType = StatusCodeError.fromInt(code);

  final StatusCodeError errorType;

  @override
  String? get message => errorType.message;

  // @override
  // String toString() {
  //   return 'Erro ao realizar processamento [Código $code]: ${errorType.message}';
  // }
}

enum ApiCodeError {
  search(code: 1001, message: "Erro ao realizar pesquisa!"),
  post(code: 1002, message: "Erro ao inserir dados!"),
  unauthorized(code: 1003, message: "Você não tem permissão de acesso!"),
  systemError(
    code: 1004,
    message:
        "Operação não aceita pelo sistema. Entre em contato com o suporte!",
  ),

  unknown(
    code: -1001,
    message: "Ocorreu um erro inesperado. Por favor tente mais tarde",
  ),
  unreach(
    code: -1002,
    message: "Parece que nossos servidores estão fora de serviço. Tente novamente mais tarde",
  );

  const ApiCodeError({required this.code, this.message});

  final int code;
  final String? message;

  static ApiCodeError fromInt(int code) {
    return ApiCodeError.values.firstWhere(
      (element) => element.code == code,
      orElse: () => ApiCodeError.unknown,
    );
  }
}

class ApiCodeException extends ApplicationException implements Exception {
  final ApiCodeError errorType;

  ApiCodeException({required super.code, this.apiMessage})
    : errorType = ApiCodeError.fromInt(code);

  final String? apiMessage;

  @override
  String? get message => apiMessage ?? errorType.message;

  // @override
  // String toString() {
  //   return 'Erro ao realizar processamento. [Código ${errorType.code}]: $userMessage';
  // }
}
