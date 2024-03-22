import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yournonspotify/presentation/widgets/loader.dart';
import 'package:yournonspotify/utils/styles.dart';

import '../../utils/enum.dart';
import '../controllers/login_controller.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    super.key,
    required this.ref,
    required this.status,
  });

  final WidgetRef ref;
  final LoginStatus status;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  List<Widget> _buildButton() {
    List<Widget> result = [];
    switch (widget.status) {
      case LoginStatus.success:
        result = const [
          Icon(
            Icons.done,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'Login Sucessfully',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ];
        break;

      case LoginStatus.loading:
        result = const [
          SizedBox(
            height: 20,
            width: 20,
            child: Loader(),
          )
        ];
        break;

      case LoginStatus.login:
        result = const [
          Text(
            'Log In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )
        ];
        break;
      default:
        result = const [
          Text(
            'Log In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )
        ];
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 27 / 3,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Styles.greenColor,
          ),
        ),
        onPressed: () async {
          widget.ref.read(loginControllerProvider.notifier).authenticate();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildButton(),
        ),
      ),
    );
  }
}
