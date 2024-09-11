import 'package:egasstation/presentation/splash/splash_cubit.dart';
import 'package:egasstation/presentation/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../gen/assets.gen.dart';
import '../../global/design_system/app_error_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      vsync: this, duration: const Duration(seconds: 2), upperBound: 1, lowerBound: 0.6)
    ..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>.value(
      value: SplashBloc()..init(),
      child: Scaffold(
        body: BlocConsumer<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SplashInit) {
              context.read<SplashBloc>().init();
            } else if (state is GetConfigDataSuccess) {
              context.read<SplashBloc>().checkSaveLogin();
            } else if (state is UpdateVersion) {
              showDialog(
                  context: context,
                  builder: (_) {
                    return const AlertDialog(
                      content: Text('Update'),
                    );
                  });
            }
          },
          builder: (context, state) {
            return (state is ErrorState)
                ? AppErrorWidget(
                    state.error,
                    tryAgain: () {
                      context.read<SplashBloc>().refresh();
                    },
                  )
                : Center(
                    child: ScaleTransition(
                        scale: _animation, child: Assets.icons.icLogoPetrolimex.image(width: 240)),
                  );
          },
        ),
      ),
    );
  }
}
