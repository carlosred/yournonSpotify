import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/item.dart';
import '../widgets/item_widget.dart';

class RecomendationsPage extends ConsumerStatefulWidget {
  const RecomendationsPage({
    required this.recommendations,
    super.key,
  });

  final List<Items> recommendations;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecomendationsPageState();
}

class _RecomendationsPageState extends ConsumerState<RecomendationsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            color: Colors.black87,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: width,
                  color: Colors.black87,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 5.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      const Text(
                        'Recommended songs',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 1.0,
              ),
              Expanded(
                  flex: 12,
                  child: ListView.separated(
                    addAutomaticKeepAlives: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.recommendations.length,
                    itemBuilder: (context, index) => ItemWidget(
                      index: index,
                      recommended: true,
                      item: widget.recommendations[index],
                      height: height,
                      width: width,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15.0,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
