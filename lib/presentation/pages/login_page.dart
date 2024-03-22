import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yournonspotify/data/providers/providers_data.dart';
import 'package:yournonspotify/presentation/controllers/login_controller.dart';
import 'package:yournonspotify/presentation/pages/search_page.dart';
import 'package:yournonspotify/utils/contants.dart';
import 'package:yournonspotify/utils/enum.dart';

import '../widgets/login_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    ref.listenManual(loginControllerProvider, (previous, next) {
      if (next.hasValue && next.value != null) {
        ref.read(authProvider.notifier).state = next.value;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchBarPage(),
          ),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var loginController = ref.watch(loginControllerProvider);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
              child: Image.asset(
                fit: BoxFit.cover,
                Contants.loginImageAsset,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  Contants.welcomeMessage,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                loginController.when(
                  data: (data) {
                    if (data != null) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: LoginButton(
                          ref: ref,
                          status: LoginStatus.success,
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: LoginButton(
                          ref: ref,
                          status: LoginStatus.login,
                        ),
                      );
                    }
                  },
                  error: (error, stack) => Text(
                    'Error:${error.toString()}',
                  ),
                  loading: () => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: LoginButton(
                      ref: ref,
                      status: LoginStatus.loading,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
