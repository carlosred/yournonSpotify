import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yournonspotify/presentation/providers/providers_presentation.dart';
import 'package:yournonspotify/utils/strings_extensions.dart';

class TypeWidget extends ConsumerStatefulWidget {
  const TypeWidget({
    required this.value,
    super.key,
  });

  final String value;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TypeWidgetState();
}

class _TypeWidgetState extends ConsumerState<TypeWidget> {
  var _selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
          if (_selected == true) {
            ref.read(typesProvider).add(widget.value);
          } else {
            ref
                .read(typesProvider)
                .removeWhere((element) => element == widget.value);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
          color: _selected ? Colors.black87 : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${widget.value.capitalize()}s',
            style: TextStyle(
              color: _selected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
