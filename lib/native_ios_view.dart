import 'package:embed_native_to_flutter/native_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void NativeIosViewCreatedCallback(NativeController controller);

class NativeIosView extends StatefulWidget {
  final NativeIosViewCreatedCallback onNativeViewCreated;

  const NativeIosView({Key key, this.onNativeViewCreated}) : super(key: key);
  @override
  _NativeIosViewState createState() => _NativeIosViewState();
}

class _NativeIosViewState extends State<NativeIosView> {
  @override
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    final String viewType = 'NativePlatformView';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return UiKitView(
      viewType: viewType,
      onPlatformViewCreated: _onPlatformViewCreated,
      creationParams: creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }

  void _onPlatformViewCreated(int id) {
    if (widget.onNativeViewCreated == null) {
      return;
    }
    widget.onNativeViewCreated(new NativeController.init(id));
  }
}
