import 'package:flutter/material.dart';
import 'package:gestao/services/exceptions.dart';
import 'package:motion_toast/motion_toast.dart';

class FavIcon extends StatelessWidget {
  const FavIcon({super.key, this.white = false});

  final bool white;
  final double width = 42.0;
  final double heigth = 42.0;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: !white
          ? AssetImage('assets/images/favicon.png')
          : AssetImage('assets/images/favicon-white.png'),
      width: width,
      height: heigth,
    );
  }
}

class LogoImage extends StatelessWidget {
  const new({
    super.key,
    required this.width,
    required this.height,
    this.white = false,
  });

  final double width;
  final double height;
  final bool white;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: !white
          ? AssetImage('assets/images/logo.png')
          : AssetImage('assets/images/logo-white.png'),
      width: width,
      height: height,
    );
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

enum ToastieKind { error, info, success, warning }

class Toastie {
  Toastie({required this.context, this.exception}) {
    switch (_kind) {
      case ToastieKind.error:
        MotionToast.error(
          description: Text(_message),
          title: Text(_title),
          height: 120,
        ).show(context);
      case ToastieKind.info:
        MotionToast.info(
          description: Text(_message),
          title: Text(_title),
          height: 120,
        ).show(context);
      case ToastieKind.success:
        MotionToast.success(
          description: Text(_message),
          title: Text(_title),
          height: 120,
        ).show(context);
      case ToastieKind.warning:
        MotionToast.warning(
          description: Text(_message),
          title: Text(_title),
          height: 120,
        ).show(context);
    }
  }

  final BuildContext context;
  final ApplicationException? exception;

  ToastieKind getKind() {
    if (exception is StatusCodeException ||
        (exception?.code != null && exception!.code < 0)) {
      return ToastieKind.error;
    } else {
      return ToastieKind.warning;
    }
  }

  String getTitle() {
    switch (_kind) {
      case ToastieKind.error:
        return 'Erro';
      case ToastieKind.info:
        return 'Informativo';
      case ToastieKind.success:
        return 'Sucesso';
      case ToastieKind.warning:
        return 'Aviso';
    }
  }

  String get _message => exception?.message ?? 'Erro de aplicação';
  ToastieKind get _kind => getKind();
  String get _title => getTitle();
}
