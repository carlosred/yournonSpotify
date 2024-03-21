import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yournonspotify/data/providers/providers_data.dart';
import 'package:yournonspotify/presentation/controllers/login_controller.dart';
import 'package:yournonspotify/presentation/pages/search_page.dart';

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
                'assets/login_background.jpg',
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome To YourNonSpotify App',
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
                        child: AspectRatio(
                          aspectRatio: 27 / 3,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xff1ED760),
                              ),
                            ),
                            onPressed: () async {
                              ref
                                  .read(loginControllerProvider.notifier)
                                  .authenticate();
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: AspectRatio(
                          aspectRatio: 27 / 3,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xff1ED760),
                              ),
                            ),
                            onPressed: () async {
                              ref
                                  .read(loginControllerProvider.notifier)
                                  .authenticate();
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  error: (error, stack) => const Text('Error'),
                  loading: () => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: AspectRatio(
                      aspectRatio: 27 / 3,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xff1ED760),
                          ),
                        ),
                        onPressed: () async {
                          ref
                              .read(loginControllerProvider.notifier)
                              .authenticate();
                        },
                        child: const Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                              strokeWidth: 3,
                            ),
                          ),
                        ),
                      ),
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
