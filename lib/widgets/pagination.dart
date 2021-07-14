import 'package:flutter/material.dart';

import '../models/page_model.dart';
import './button_pagination.dart';

class Pagination extends StatelessWidget {
  final int index;
  final List<PageModel> pages;

  Pagination({
    required this.index,
    required this.pages,
  });

  List<PageModel> get getPages {
    List<PageModel> list = [];

    for (var i = 0; i < pages.length; i++) {
      list.add(pages[i]);

      if (i < pages.length - 1) {
        list.add(PageModel(title: 'divider'));
      }
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...pages.asMap().entries.map((entry) {
              int key = entry.key;
              int idx = key < 0 ? 0 : key;
              String title = entry.value.title;

              print('===================');
              print(idx);
              print(index);
              print(title);

              return title == 'divider'
                  ? Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  : ButtonPagination(
                      title: title,
                      isActive: idx <= index,
                    );
            }).toList(),
          ],
        ),
      ],
    );
  }
}
