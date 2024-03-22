import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yournonspotify/presentation/widgets/back_spotify_button.dart';
import 'package:yournonspotify/presentation/widgets/items_list.dart';
import 'package:yournonspotify/utils/contants.dart';
import 'package:yournonspotify/utils/styles.dart';
import '../../domain/models/item.dart';

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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5.0,
                      ),
                      BackSpotifyButton(),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        Contants.recommendationsMessage,
                        style: Styles.tittleAppBarTextStyle,
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
                child: ItemsListWidget(
                    height: height,
                    items: widget.recommendations,
                    width: width),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
