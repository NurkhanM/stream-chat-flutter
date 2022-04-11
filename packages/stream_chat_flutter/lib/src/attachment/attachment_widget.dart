import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

/// Enum for identifying type of attachment
enum AttachmentSource {
  /// Attachment is attached
  local,

  /// Attachment is uploaded
  network,
}

/// Extension for identifying type of attachment
extension AttachmentSourceX on AttachmentSource {
  /// The [when] method is the equivalent to pattern matching.
  /// Its prototype depends on the AttachmentSource defined.
  // ignore: missing_return
  T when<T>({
    required T Function() local,
    required T Function() network,
  }) {
    switch (this) {
      case AttachmentSource.local:
        return local();
      case AttachmentSource.network:
        return network();
    }
  }
}

/// {@macro streamAttachmentWidget}
@Deprecated("Use 'StreamAttachmentWidget' instead")
typedef AttachmentWidget = StreamAttachmentWidget;

/// {@template streamAttachmentWidget}
/// Abstract class for deriving attachment types
/// {@endtemplate}
abstract class StreamAttachmentWidget extends StatelessWidget {
  /// {@macro streamAttachmentWidget}
  const StreamAttachmentWidget({
    Key? key,
    required this.message,
    required this.attachment,
    this.size,
    AttachmentSource? source,
  })  : _source = source,
        super(key: key);

  /// Size of attachments
  final Size? size;
  final AttachmentSource? _source;

  /// The message that [attachment] is associated with
  final Message message;

  /// The [Attachment] to display
  final Attachment attachment;

  /// Getter for source of attachment
  AttachmentSource get source =>
      _source ??
      (attachment.file != null
          ? AttachmentSource.local
          : AttachmentSource.network);
}
