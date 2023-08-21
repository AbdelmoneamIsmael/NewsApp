import 'package:flutter/material.dart';
import 'package:news_app/data/model/NewsDataModel.dart';

import '../reusable_component/text/header_text.dart';
import '../reusable_component/text/sub_header.dart';

class NewsItem extends StatefulWidget {
  Articles data;
  NewsItem({required this.data});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: widget.data.urlToImage == null
                  ? DecorationImage(
                      image: AssetImage('assets/images/photo.jpg'),
                      fit: BoxFit.cover)
                  : DecorationImage(image: NetworkImage(widget.data.urlToImage!),fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderText(
                    text:widget.data.author==null
                    ?'No author'
                    : widget.data.author!,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  SubHeader(
                    text: widget.data.title!,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
