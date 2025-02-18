import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pass_flutter/pass_flutter.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

part 'pass_file_io.dart';
part 'pass_parser.dart';

/// Implementation of Apple Passkit.
class Pass {
  static const String _channelName = 'pass_flutter';
  static const MethodChannel _channel = MethodChannel(_channelName);

  /// Return all saved pass files from internal memory in List of [PassFile]
  Future<List<PassFile>> getAllSaved() async {
    return PassFileIO().getAllSaved();
  }

  /// Save pass file from [url] to internal memory, parse and return [PassFile]
  Future<PassFile> saveFromUrl({required String url, Map<String,dynamic>? headers}) async {
    return PassFileIO().saveFromUrl(url: url, headers: headers);
  }

  /// Fetch preview of pass file from [url], parse and return [PassFile]
  Future<PassFile> fetchPreviewFromUrl({required String url, Map<String,dynamic>? headers}) async {
    return PassFileIO().fetchPreviewFromUrl(url: url, headers: headers);
  }

  /// Delete all files and folders for [passFile] from internal memory and return saved passes
  Future<List<PassFile>> delete(PassFile passFile) async {
    PassFileIO().delete(passFile.directory, passFile.file);
    return PassFileIO().getAllSaved();
  }

  /// Delete all files and folders for passFiles from internal memory and return void
  Future<void> deleteAll() async {
    final parsedPasses = await PassFileIO().getAllSaved();
    for (final pass in parsedPasses) {
      pass.delete();
    }
  }

  /// Platform version
  static Future<String?> get platformVersion async {
    return _channel.invokeMethod<String>('getPlatformVersion');
  }
}
