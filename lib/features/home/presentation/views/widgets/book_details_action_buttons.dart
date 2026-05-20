import 'package:book_pulse_app/core/constants/app_colors.dart';
import 'package:book_pulse_app/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsActionButtons extends StatelessWidget {
  final double price;
  final String previewUrl;

  const BookDetailsActionButtons({
    super.key,
    required this.price,
    required this.previewUrl,
  });

  @override
  Widget build(BuildContext context) {
    final hasPreview = previewUrl.isNotEmpty;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(32),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                '${price.toStringAsFixed(2)} EUR',
                style: AppTextStyles.sectionTitle.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => _openPreview(context),
              child: Container(
                decoration: BoxDecoration(
                  gradient: hasPreview
                      ? const LinearGradient(
                          colors: [Color(0xffF28C28), Color(0xffE05F00)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: hasPreview ? null : AppColors.textHint,
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(32),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  hasPreview ? 'Free preview' : 'No preview',
                  style: AppTextStyles.sectionTitle.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openPreview(BuildContext context) async {
    if (previewUrl.isEmpty) {
      _showPreviewMessage(context, 'No free preview available for this book.');
      return;
    }

    final previewUri = Uri.tryParse(previewUrl);
    if (previewUri == null) {
      _showPreviewMessage(context, 'Could not open this preview link.');
      return;
    }

    bool launched = false;
    try {
      launched = await launchUrl(
        previewUri,
        mode: LaunchMode.externalApplication,
      );
    } on PlatformException {
      if (context.mounted) {
        _showPreviewMessage(
          context,
          'Preview could not open. Please restart the app and try again.',
        );
      }
      return;
    }

    if (!launched && context.mounted) {
      _showPreviewMessage(context, 'Could not open this preview link.');
    }
  }

  void _showPreviewMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message), backgroundColor: AppColors.cardColor),
      );
  }
}
