import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'custom_dot_circular_progress.dart';

class CustomGridViewWidget extends StatefulWidget {
  final Function? fetchData;
  final List<dynamic> items;
  final bool isLoading;
  final dynamic loadingWidget;

  const CustomGridViewWidget({
    this.fetchData,
    required this.items,
    required this.isLoading,
    this.loadingWidget,
    super.key
  });

  @override
  State<CustomGridViewWidget> createState() => _CustomGridViewWidgetState();
}

class _CustomGridViewWidgetState extends State<CustomGridViewWidget> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !widget.isLoading) {
      if(widget.fetchData != null) widget.fetchData!();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MasonryGridView.builder(
            controller: _scrollController,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.items[index],
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    if (index % 2 == 1)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(5, (i) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "${widget.items[index]} - Extra content $i",
                              style: TextStyle(fontSize: 14),
                            ),
                          );
                        }),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
        if (widget.isLoading)
          Positioned(
              bottom: 10,
              left: MediaQuery.of(context).size.width / 2,
              child: Center(child: widget.loadingWidget)
          ),
      ],
    );
  }
}
