import 'package:flutter/material.dart';

import '../models/pages_model.dart';
import './button_pagination.dart';

class Pagination extends StatelessWidget {
  final int index;
  final List<PageModel> pages;
  final Function onPressPagination;
  final bool disabled;

  Pagination({
    required this.index,
    required this.pages,
    required this.onPressPagination,
    required this.disabled,
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...getPages.asMap().entries.map((entry) {
          int idx = entry.key;
          String title = entry.value.title;

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
                  index: idx,
                  onPressed: onPressPagination,
                  isActive: idx == index,
                  disabled: disabled,
                );
        }).toList(),
      ],
    );
  }
}
