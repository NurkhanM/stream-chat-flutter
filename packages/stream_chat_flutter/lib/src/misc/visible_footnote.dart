import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/src/utils/extensions.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

/// {@macro streamVisibleFootnote}
@Deprecated("Use 'StreamVisibleFootnote' instead")
typedef VisibleFootnote = StreamVisibleFootnote;

/// {@template streamVisibleFootnote}
/// Informs the user about a [StreamMessageWidget]'s visibility to the current
/// user.
///
/// Used in [StreamGiphyAttachment].
/// {@endtemplate}
class StreamVisibleFootnote extends StatelessWidget {
  /// {@macro streamVisibleFootnote}
  const StreamVisibleFootnote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatThemeData = StreamChatTheme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamSvgIcon.eye(
          color: chatThemeData.colorTheme.textLowEmphasis,
          size: 16,
        ),
        const SizedBox(width: 8),
        Text(
          context.translations.onlyVisibleToYouText,
          style: chatThemeData.textTheme.footnote
              .copyWith(color: chatThemeData.colorTheme.textLowEmphasis),
        ),
      ],
    );
  }
}
