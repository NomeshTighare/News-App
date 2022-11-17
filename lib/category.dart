import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/app_style.dart';
import 'package:newsapp/categorypage.dart';
import 'package:newsapp/model/categorymodel.dart';

import 'Controller/categorydata.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isLoading = true;

  // ignore: deprecated_member_use
  List<CategoryModel> categories = <CategoryModel>[];
  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KLighterWhite,
      appBar: AppBar(
        backgroundColor: KWhite,
        elevation: 0,
        title: Text(
          'Category List',
          style: GoogleFonts.poppins(
            color: KDarkBlue,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            scrollDirection: Axis.vertical,
            itemCount: categories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryFragment(
                            category:
                                categories[index].categoryName!.toLowerCase()),
                      ));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          child: CachedNetworkImage(
                            imageUrl: '${categories[index].imageUrl}',
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: 90,
                            fit: BoxFit.cover,
                          )),
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.50,
                        height: 40,
                        decoration: BoxDecoration(
                          color: KWhite,
                        ),
                        child: Text(
                          '${categories[index].categoryName}',
                          style: GoogleFonts.poppins(
                            color: KDarkBlue,
                            fontSize: 15,
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
      ),
    );
  }
}
