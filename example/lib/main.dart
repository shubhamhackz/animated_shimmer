import 'package:animated_shimmer/animated_shimmer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimatedShimmerWidget(),
    );
  }
}

class AnimatedShimmerWidget extends StatefulWidget {
  const AnimatedShimmerWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedShimmerWidget> createState() => _AnimatedShimmerWidgetState();
}

class _AnimatedShimmerWidgetState extends State<AnimatedShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                AnimatedShimmer.round(
                  size: 60,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedShimmer(
                      height: 10,
                      width: 120,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      delayInMilliSeconds: Duration(milliseconds: index * 500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AnimatedShimmer(
                      height: 10,
                      width: 180,
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      delayInMilliSeconds: Duration(milliseconds: index * 500),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: 12,
        separatorBuilder: (context, index) => const SizedBox(
          height: 12,
        ),
      ),
    );
  }
}
