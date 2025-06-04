import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cototinder/domain/cubits/network_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;

  const AppNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkCubit, bool>(
      builder: (context, hasConnection) {
        return CachedNetworkImage(
          imageUrl: url,
          width: width,
          height: height,
          fit: BoxFit.cover,
          placeholder: (_, __) => _buildPlaceholder(),
          errorWidget: (_, __, error) =>
              _buildErrorWidget(context, error, hasConnection),
          memCacheWidth:
              (width != null && width! > 100) ? width!.toInt() : null,
          maxWidthDiskCache:
              (width != null && width! > 100) ? width!.toInt() : null,
        );
      },
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[200],
      child: const Center(
        child: Icon(Icons.photo, color: Colors.grey, size: 40),
      ),
    );
  }

  Widget _buildErrorWidget(
      BuildContext context, dynamic error, bool hasConnection) {
    return FutureBuilder<File?>(
      // Corrected: Use the constructor without .instance
      future: DefaultCacheManager().getSingleFile(url),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.existsSync()) {
          return Image.file(
            snapshot.data!,
            width: width,
            height: height,
            fit: BoxFit.cover,
          );
        }

        return Container(
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 40),
              const SizedBox(height: 8),
              if (!hasConnection)
                const Text(
                  'No connection\nUsing cached data',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
            ],
          ),
        );
      },
    );
  }
}
