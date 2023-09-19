import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:job_application/core/utils/colors.dart';
import 'package:job_application/core/utils/styles.dart';

import '../../../core/theme/theme.dart';
import '../../../core/utils/size2.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig2().init(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(30)),
        child: Column(
          /// crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWidget(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            const TextFormWidget(),
            SizedBox(height: getProportionateScreenHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured Jobs',
                  style: Styles.textStyles28,
                ),
                Text('See all', style: Styles.textStyles15),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            SizedBox(
              height: getProportionateScreenHeight(220),
              width: double.infinity,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(5),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: ColorManager.containerColor),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
                            vertical: getProportionateScreenHeight(30)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: borderRadius,
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              'https://img.freepik.com/free-psd/google-icon-isolated-3d-render-illustration_47987-9777.jpg?size=626&ext=jpg'))),
                                ),
                                SizedBox(
                                    width: getProportionateScreenWidth(10)),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Product Designer',
                                        style: Styles.textStyles28.copyWith(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Google',
                                        style: Styles.textStyles15.copyWith(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      )
                                    ]),
                                SizedBox(
                                    width: getProportionateScreenWidth(10)),
                                Icon(
                                  Icons.bookmark_add,
                                  size: 30,
                                  color: HexColor('#FFFFFF'),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 5,
                      ),
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: ColorManager.grayColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: ColorManager.grayColor,
                    hintText: 'Search a job or position',
                    contentPadding: const EdgeInsets.all(15))),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(15),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: ColorManager.grayColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/iconsSvg/filter1.png',
                  ),
                )),
          ),
        ),
      ],
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: Styles.textStyles15,
            ),
            Text(
              'John Lucas 👋',
              style: Styles.textStyles28,
            ),
          ],
        ),
        const Spacer(),
        const CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(
              'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?size=626&ext=jpg'),
        ),
      ],
    );
  }
}
