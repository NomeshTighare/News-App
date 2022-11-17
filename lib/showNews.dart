import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/app_style.dart';
import 'package:newsapp/model/newsmodel.dart';
import 'package:newsapp/size_config.dart';

class ShowNews extends StatefulWidget {
  final ArticleModel news;
  const ShowNews({Key? key, required this.news}) : super(key: key);

  @override
  State<ShowNews> createState() => _ShowNewsState();
}

class _ShowNewsState extends State<ShowNews> {
  bool _loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KLighterWhite,
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
        title: Text(widget.news.title!,
            style: GoogleFonts.poppins(color: KDarkBlue),
            overflow: TextOverflow.ellipsis),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: KLighterWhite,
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(widget.news!.urlToImage ??
                            'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png')
                        .image,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('${widget.news.title}',
                  style: KPoppinsBold.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  )),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${widget.news.author ?? ''}',
                    style: KPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${widget.news.source!.name}',
                    style: KPoppinsMedium.copyWith(
                      color: KGray,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    DateFormat.yMMMEd()
                        .format(DateTime.parse('${widget.news.publishedAt}')),
                    style: KPoppinsMedium.copyWith(
                      color: KGray,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${widget.news.description}',
                style: KPoppinsRegular.copyWith(
                  color: KDarkBlue,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${widget.news.content ?? ''}',
                style: KPoppinsRegular.copyWith(
                  color: KDarkBlue,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
