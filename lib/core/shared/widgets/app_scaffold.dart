import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.title,
    required this.body,
    this.centerTitle = false,
    this.bottomSafeArea = true,
    this.bodyPadding,
  });

  final String? title; // TODO: Make this required
  final Widget body;
  final bool centerTitle;
  final bool bottomSafeArea;
  final EdgeInsets? bodyPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              title: Text(title ?? ''),
              centerTitle: centerTitle,
            ),
            const Divider(height: 1),
          ],
        ),
      ),
      body: SafeArea(
        bottom: bottomSafeArea,
        child: Padding(
          padding: bodyPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: body,
        ),
      ),
    );
  }
}
