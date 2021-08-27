import 'package:flutter/material.dart';
import 'package:real_estate/custom/border_box.dart';
import 'package:real_estate/utils/constants.dart';
import 'package:real_estate/utils/widget_functions.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(

        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    addVerticalSpace(padding),
                    BorderBox(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.menu, color: COLOR_BLACK,),
                    ),
                    BorderBox(
                      width: 50,
                      height: 50,
                      child: Icon(Icons.settings, color: COLOR_BLACK,),
                    )
                  ],
                ),
              ),
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Text('City', style: themeData.textTheme.bodyText2,),
              ),
              addVerticalSpace(padding),
              addVerticalSpace(10),
              Padding(
                padding: sidePadding,
                child: Text(
                  "Kisii",
                  style: themeData.textTheme.headline1,
                ),
              ),
              Padding(
                  padding: sidePadding,
                  child: Divider(
                    height: 25,
                    color: COLOR_GREY,
                  )),
              addVerticalSpace(10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: ["<\$220,000","For Sale","3-4 Beds",">1000 sqft"]
                      .map((filter) => ChoiceOption(text: filter, )).toList(),
                ),
              ),
              addVerticalSpace(10),
              Expanded(
                child: Padding(
                  padding: sidePadding,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: RE_DATA.length,
                      itemBuilder: (context, index) {
                        return RealEstateItem(
                          itemData: RE_DATA[index],
                        );
                      }),
                ),
              ),

            ],


          ),

        ),
      ),
    );
  }
}
class RE_DATA {
  final String name, image;

  RE_DATA(this.name, this.image);
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({required this.text}) ;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: COLOR_GREY.withAlpha(25),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

