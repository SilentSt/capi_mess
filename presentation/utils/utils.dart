import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class Utils {
  static final Map<String, IconData> _dict = {
    'image/gif': PhosphorIcons.file_image,
    'image/jpeg': PhosphorIcons.file_image,
    'image/pjpeg': PhosphorIcons.file_image,
    'image/png': PhosphorIcons.file_image,
    'image/svg+xml': PhosphorIcons.file_image,
    'image/tiff': PhosphorIcons.file_image,
    'image/vnd.microsoft.icon': PhosphorIcons.file_image,
    'image/vnd.wap.wbmp': PhosphorIcons.file_image,
    'image/webp': PhosphorIcons.file_image,
    'video/mp4': PhosphorIcons.file_video,
    'video/mpeg': PhosphorIcons.file_video,
    'video/ogg': PhosphorIcons.file_video,
    'video/quicktime': PhosphorIcons.file_video,
    'video/webm': PhosphorIcons.file_video,
    'video/x-ms-wmv': PhosphorIcons.file_video,
    'video/x-flv': PhosphorIcons.file_video,
    'video/x-msvideo': PhosphorIcons.file_video,
    'video/3gpp': PhosphorIcons.file_video,
    'video/3gpp2': PhosphorIcons.file_video,
    'text/plain': PhosphorIcons.file_text,
    'text/html': PhosphorIcons.file_html,
    'text/css': PhosphorIcons.file_css,
    'text/javascript': PhosphorIcons.file_js,
    'text/php': PhosphorIcons.file_code,
    'text/xml': PhosphorIcons.file_code,
    'text/markdown': PhosphorIcons.file_code,
    'text/cache-manifest': PhosphorIcons.file_text,
    'audio/L24': PhosphorIcons.file_audio,
    'audio/basic': PhosphorIcons.file_audio,
    'audio/mp4': PhosphorIcons.file_audio,
    'audio/aac': PhosphorIcons.file_audio,
    'audio/mpeg': PhosphorIcons.file_audio,
    'audio/ogg': PhosphorIcons.file_audio,
    'audio/vorbis': PhosphorIcons.file_audio,
    'audio/x-ms-wma': PhosphorIcons.file_audio,
    'audio/x-ms-wax': PhosphorIcons.file_audio,
    'audio/vnd.rn-realaudio': PhosphorIcons.file_audio,
    'audio/vnd.wave': PhosphorIcons.file_audio,
    'audio/webm': PhosphorIcons.file_audio,
    'application/json': PhosphorIcons.file_code,
    'application/octet-stream': PhosphorIcons.file,
    'application/x-msdownload': PhosphorIcons.app_window,
    'application/pdf': PhosphorIcons.file_pdf,
    'application/msword': PhosphorIcons.file_doc,
    'application/vnd.ms-word': PhosphorIcons.file_doc,
    'application/vnd.oasis.opendocument.text': PhosphorIcons.file_doc,
    'application/vnd.openxmlformats-officedocument.wordprocessingml': PhosphorIcons.file_doc,
    'application/vnd.ms-excel': PhosphorIcons.file_xls,
    'application/vnd.openxmlformats-officedocument.spreadsheetml': PhosphorIcons.file_xls,
    'application/vnd.oasis.opendocument.spreadsheet': PhosphorIcons.file_xls,
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document':PhosphorIcons.file_doc,
    'application/vnd.ms-powerpoint': PhosphorIcons.file_ppt,
    'application/vnd.openxmlformats-officedocument.presentationml': PhosphorIcons.file_ppt,
    'application/vnd.oasis.opendocument.presentation': PhosphorIcons.file_ppt,
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':PhosphorIcons.file_xls,
    'application/gzip': PhosphorIcons.file_zip,
    'application/zip': PhosphorIcons.file_zip,
  };
  static bool isToday(DateTime date) {
    if (date.year == DateTime.now().year && date.month == DateTime.now().month && date.day == DateTime.now().day) {
      return true;
    }
    return false;
  }

  static String formatDate(DateTime? date, {String format = 'mm:hh dd.MM.yyyy'}) {
    if (date == null) return '-';
    return DateFormat(format).format(date);
  }

  static IconData fromMimeType(String mime) {
    if (_dict.containsKey(mime)) {
      final res = _dict[mime];
      return res ?? PhosphorIcons.file;
    }
    return PhosphorIcons.file;
  }
}
