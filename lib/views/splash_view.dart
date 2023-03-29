import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ohaino/bloc/app_bloc.dart';

class SplashView extends HookWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Management Firebase App',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    context
                        .read<AppBloc>()
                        .add(const AppEventGoToRegistration());
                  },
                  child: const Text('A product of OTESOFT'),
                ),
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: 1),
                  duration: const Duration(milliseconds: 1500),
                  builder: (context, value, _) => StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        if (value == 2) {
                          context
                              .read<AppBloc>()
                              .add(const AfterSplashManagment());
                        }
                        return CircularProgressIndicator(value: value);
                      }),
                )
              ]),
        ),
      ),
    );
  }
}
