import 'package:flutter/widgets.dart';

import 'item_widget.dart';

class ItemsListWidget extends StatelessWidget {
  const ItemsListWidget({
    super.key,
    required this.height,
    required this.items,
    required this.width,
  });

  final double height;
  final double width;
  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => ItemWidget(
        index: index,
        recommended: false,
        item: items[index],
        height: height,
        width: width,
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 15.0,
      ),
    );
  }
}
