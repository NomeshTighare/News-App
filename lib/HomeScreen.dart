import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/Controller/categorydata.dart';
import 'package:newsapp/Controller/newsdata.dart';
import 'package:newsapp/ShowAllNews.dart';
import 'package:newsapp/ShowNewsTechno.dart';
import 'package:newsapp/app_style.dart';
import 'package:newsapp/category.dart';
import 'package:newsapp/model/categorymodel.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/showNews.dart';
import 'package:newsapp/size_config.dart';

import 'categorypage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  // ignore: deprecated_member_use
  List<CategoryModel> categories = <CategoryModel>[];

  List<ArticleModel> articles = <ArticleModel>[];
  List<ArticleModel> articleTechnology = <ArticleModel>[];
  bool _loading = true;

  getNews() async {
    setState(() {
      // make changes here
    });
    News newsdata = News();
    await newsdata.getNews();
    articles = newsdata.datatobesavedin;
    setState(() {
      _loading = false;
    });
  }

  getNewsTechnology() async {
    setState(() {
      // make changes here
    });
    NewsTechno newsTechno = NewsTechno();
    await newsTechno.getNewsTechnology();
    articleTechnology = newsTechno.datatobesavedinTechno;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
    getNewsTechnology();
    print('>>>>>>>');
    print(getNews());
    print('<<<<<<<');
  }

  late String categoryName;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back !',
                    style: KPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMMEEEEd().format(DateTime.now()),
                    style: KPoppinsRegular.copyWith(
                      color: KGray,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
              Icon(
                EvaIcons.smilingFaceOutline,
                color: KDarkBlue,
                size: 44,
              )
              // Container(
              //   height: 51,
              //   width: 51,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(50),
              //       // color: KLightBlue,
              //       image: const DecorationImage(
              //           image: NetworkImage(
              //               'https://img.freepik.com/free-photo/portrait-cute-little-boy-standing-with-arms-folded-looking-camera_1150-4769.jpg?w=2000'))),
              // ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(KBorderRadius),
          //     color: KWhite,
          //     boxShadow: [
          //       BoxShadow(
          //         color: KDarkBlue.withOpacity(0.051),
          //         offset: const Offset(0.0, 3.0),
          //         blurRadius: 24.0,
          //         spreadRadius: 0.0,
          //       )
          //     ],
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: TextField(
          //           style: KPoppinsRegular.copyWith(
          //             color: KBlue,
          //             fontSize: SizeConfig.blockSizeHorizontal! * 3,
          //           ),
          //           controller: TextEditingController(),
          //           decoration: InputDecoration(
          //             contentPadding: const EdgeInsets.symmetric(
          //               horizontal: 13,
          //             ),
          //             hintText: 'Search for article...',
          //             border: KBorder,
          //             errorBorder: KBorder,
          //             disabledBorder: KBorder,
          //             focusedBorder: KBorder,
          //             focusedErrorBorder: KBorder,
          //             hintStyle: KPoppinsRegular.copyWith(
          //               color: KLightGray,
          //               fontSize: SizeConfig.blockSizeHorizontal! * 3,
          //             ),
          //           ),
          //         ),
          //       ),
          //       Container(
          //         decoration: BoxDecoration(
          //           color: KBlue,
          //           borderRadius: BorderRadius.circular(KBorderRadius),
          //         ),
          //         child: IconButton(
          //           onPressed: () {},
          //           icon: Icon(
          //             EvaIcons.search,
          //             color: KWhite,
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Category',
                style: KPoppinsBold.copyWith(
                  color: KDarkBlue,
                  fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 19,
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryFragment(
                              category: categories[index]
                                  .categoryName!
                                  .toLowerCase()),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: CachedNetworkImage(
                              imageUrl: '${categories[index].imageUrl}',
                              width: 170,
                              height: 90,
                              fit: BoxFit.cover,
                            )),
                        Container(
                          alignment: Alignment.center,
                          width: 170,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.black26,
                          ),
                          child: Text(
                            '${categories[index].categoryName}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Latest Top News',
                style: KPoppinsBold.copyWith(
                  color: KDarkBlue,
                  fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                ),
              ),
              InkWell(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowAllNews(),
                      ))
                },
                child: Text(
                  'View all',
                  style: KPoppinsMedium.copyWith(
                    color: KDarkBlue,
                    fontSize: SizeConfig.blockSizeHorizontal! * 3,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 19,
          ),
          _loading
              ? Center(child: CupertinoActivityIndicator())
              : SizedBox(
                  height: 304,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: articles.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ShowNews(news: articles![index]),
                              )),
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(
                            right: 20,
                          ),
                          height: 304,
                          width: 255,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(KBorderRadius),
                            color: KWhite,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 164,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(KBorderRadius),
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
                                height: 18,
                              ),
                              Flexible(
                                child: Text(
                                  '${articles[index].title}',
                                  style: KPoppinsBold.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${articles[index].source!.name}',
                                            style: KPoppinsSemiBold.copyWith(
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  3,
                                            ),
                                          ),
                                          Text(
                                            DateFormat.yMMMEd().format(
                                                DateTime.parse(
                                                    '${articles[index].publishedAt}')),
                                            style: KPoppinsRegular.copyWith(
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
                                  Container(
                                      height: 38,
                                      width: 38,
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            KBorderRadius),
                                        color: KLightWhite,
                                      ),
                                      child: Icon(EvaIcons.paperPlaneOutline))
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Technology News',
                style: KPoppinsBold.copyWith(
                  color: KDarkBlue,
                  fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                ),
              ),
              InkWell(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowNewsTechno(),
                      ))
                },
                child: Text(
                  'View all',
                  style: KPoppinsMedium.copyWith(
                    color: KDarkBlue,
                    fontSize: SizeConfig.blockSizeHorizontal! * 3,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 19,
          ),
          _loading
              ? Center(child: CupertinoActivityIndicator())
              : SizedBox(
                  height: 304,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: articleTechnology.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ShowNews(news: articleTechnology![index]),
                              )),
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(
                            right: 20,
                          ),
                          height: 304,
                          width: 255,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(KBorderRadius),
                            color: KWhite,
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 164,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(KBorderRadius),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.network(articleTechnology[
                                                    index]
                                                .urlToImage ??
                                            'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png')
                                        .image,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Flexible(
                                child: Text(
                                  '${articleTechnology[index].title}',
                                  style: KPoppinsBold.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.5,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${articleTechnology[index].source!.name}',
                                            style: KPoppinsSemiBold.copyWith(
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  3,
                                            ),
                                          ),
                                          Text(
                                            DateFormat.yMMMEd().format(
                                                DateTime.parse(
                                                    '${articleTechnology[index].publishedAt}')),
                                            style: KPoppinsRegular.copyWith(
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
                                  Container(
                                      height: 38,
                                      width: 38,
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            KBorderRadius),
                                        color: KLightWhite,
                                      ),
                                      child: Icon(EvaIcons.paperPlaneOutline))
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
          const SizedBox(
            height: 19,
          ),
        ],
      ),
    );
  }
}
