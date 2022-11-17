import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/app_style.dart';
import 'package:newsapp/model/categorymodel.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/showNews.dart';
import 'package:newsapp/size_config.dart';

import 'Controller/newsdata.dart';

class CategoryFragment extends StatefulWidget {
  final String category;
  const CategoryFragment({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryFragmentState createState() => _CategoryFragmentState();
}

class _CategoryFragmentState extends State<CategoryFragment> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  getNews() async {
    CategoryNews newsdata = CategoryNews();
    await newsdata.getNews(widget.category);
    articles = newsdata.datatobesavedin;
    setState(() {
      // important method otherwise you would have to perform hot relod always
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => {Navigator.pop(context)},
          child: Icon(
            EvaIcons.arrowCircleLeftOutline,
            color: KDarkBlue,
          ),
        ),
        backgroundColor: KWhite,
        elevation: 0,
        title: Text(
          widget.category,
          style: GoogleFonts.poppins(
            color: KDarkBlue,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),

      // category widgets
      body: _loading
          ? Center(child: CupertinoActivityIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  child: ListView.builder(
                    itemCount: articles.length,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true, // add this otherwise an error
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ShowNews(news: articles![index]),
                              )),
                        },
                        child: Container(
                          padding: const EdgeInsets.all(9),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          width: 208,
                          height: 88,
                          decoration: BoxDecoration(
                            color: KWhite,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: KDarkBlue.withOpacity(0.051),
                                offset: const Offset(0.0, 3.0),
                                blurRadius: 24.0,
                                spreadRadius: 0.0,
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 70,
                                padding: const EdgeInsets.all(26),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(articles[index]
                                                .urlToImage ??
                                            'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png')
                                        .image,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${articles[index].title}',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: KPoppinsSemiBold.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.5,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 9,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${articles[index].source!.name}',
                                          style: KPoppinsMedium.copyWith(
                                            color: KGray,
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          DateFormat.yMMMEd().format(DateTime.parse(
                                              '${articles[index].publishedAt}')),
                                          style: KPoppinsMedium.copyWith(
                                            color: KGray,
                                            fontSize: SizeConfig
                                                    .blockSizeHorizontal! *
                                                3,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
