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

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    super.key,
    required this.onPressed,
    this.color = Colors.white,
  });

  final Function onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {onPressed},
      icon: Icon(Icons.notifications_none_rounded, color: color),
      tooltip: 'Notificações',
    );
  }
}

class FloatContainer extends StatelessWidget {
  const FloatContainer({
    super.key,
    required this.onTap,
    required this.children,
    this.offset,
  });

  final Function onTap;
  final List<Widget> children;
  final Offset? offset;

  Offset get _offset => offset ?? Offset(0, -30);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: _offset,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => {onTap},
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8F1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFF0DCCC)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // children: children,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
