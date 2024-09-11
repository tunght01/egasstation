import 'package:flutter/material.dart';

import '../design_system/app_loading_widget.dart';

class PageLoadingOverlay extends StatefulWidget {
  final Stream<double>? percent;

  const PageLoadingOverlay({Key? key, this.percent}) : super(key: key);

  @override
  _PageLoadingOverlayState createState() => _PageLoadingOverlayState();
}

class _PageLoadingOverlayState extends State<PageLoadingOverlay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black26,
      child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 80,
            height: 80,
            color: Colors.black45,
            alignment: Alignment.center,
            child: widget.percent == null
                ? const AppLoadingWidget()
                : StreamBuilder<double>(
                    stream: widget.percent,
                    builder: (context, snap) {
                      return SizedBox(
                        width: 56,
                        height: 56,
                        child: LoadingPercentWidget(((snap.data ?? 0) * 100).toInt()),
                      );
                    }),
          )),
    );
  }
}

class LoadingPercentWidget extends StatelessWidget {
  final int percent;

  const LoadingPercentWidget(this.percent, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
              child: CircularProgressIndicator(
            strokeWidth: 2,
            value: percent / 100,
            backgroundColor: Colors.white,
            color: Colors.blue,
          )),
          Text(
            '$percent%',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.blue,
                ),
          )
        ],
      ),
    );
  }
}
