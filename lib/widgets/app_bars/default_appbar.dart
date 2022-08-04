import 'package:cat_app/core/generated/assets.gen.dart';
import 'package:cat_app/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppbar({
    this.title,
    this.subtitle,
    this.needDivider = true,
    this.onBackPressed,
    this.backButtonColor = AppColors.onAccent,
    this.sizeFromHeight = 64,
  });

  final String? title;
  final String? subtitle;
  final bool needDivider;
  final VoidCallback? onBackPressed;
  final Color backButtonColor;
  final double sizeFromHeight;

  @override
  Size get preferredSize => Size.fromHeight(sizeFromHeight);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: sizeFromHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: _buildBackButton(),
                  ),
                  Center(
                    child: _buildTitles(),
                  ),
                ],
              ),
            ),
            if (needDivider) _buildDivider(),
          ],
        ),
      );

  Widget _buildDivider() => Container(
        width: double.maxFinite,
        height: 1,
        color: AppColors.gray7,
      );

  Widget _buildBackButton() => GestureDetector(
        onTap: () {
          onBackPressed?.call();
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SvgPicture.asset(
            Assets.images.backArrow.path,
            height: 32,
            width: 32,
            color: backButtonColor,
          ),
        ),
      );

  Widget _buildTitles() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null) _buildTitle(),
            if (title != null && subtitle != null) const SizedBox(height: 2),
            if (subtitle != null) _buildSubtitle(),
          ],
        ),
      );

  Widget _buildTitle() => Text(
        title!,
        style: const TextStyle(
          color: AppColors.onBackground,
          fontWeight: FontWeight.w800,
          fontSize: 28,
        ),
      );

  Widget _buildSubtitle() => Text(
        subtitle!,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          height: 18 / 13,
          color: AppColors.onBackground,
        ),
      );
}
