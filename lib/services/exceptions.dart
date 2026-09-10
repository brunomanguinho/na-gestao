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

class StatusCodeException implements Exception {
  StatusCodeException({required this.statusCode})
    : errorType = StatusCodeError.fromInt(statusCode);

  final int statusCode;
  final StatusCodeError errorType;

  @override
  String toString() {
    return 'Erro ao realizar processamento [Código $statusCode]: ${errorType.message}';
  }
}
