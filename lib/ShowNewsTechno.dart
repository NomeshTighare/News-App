import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/app_style.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/showNews.dart';
import 'package:newsapp/size_config.dart';

import 'Controller/newsdata.dart';

class ShowNewsTechno extends StatefulWidget {
  const ShowNewsTechno({super.key});

  @override
  State<ShowNewsTechno> createState() => _ShowNewsTechnoState();
}

class _ShowNewsTechnoState extends State<ShowNewsTechno> {
  bool isLoading = true;

  List<ArticleModel> articleTechnology = <ArticleModel>[];

  getNewsTechnology() async {
    setState(() {
      // make changes here
    });
    NewsTechno newsTechno = NewsTechno();
    await newsTechno.getNewsTechnology();
    articleTechnology = newsTechno.datatobesavedinTechno;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    getNewsTechnology();
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
          'All News',
          style: GoogleFonts.poppins(
            color: KDarkBlue,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CupertinoActivityIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  child: ListView.builder(
                    itemCount: articleTechnology.length,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true, // add this otherwise an error
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ShowNews(news: articleTechnology![index]),
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
                                    image: Image.network(articleTechnology[
                                                    index]
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
                                      '${articleTechnology[index].title}',
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
                                          '${articleTechnology[index].source!.name}',
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
                                              '${articleTechnology[index].publishedAt}')),
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
