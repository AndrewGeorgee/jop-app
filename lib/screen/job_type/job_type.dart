import 'package:flutter/material.dart';

import '../../core/utils/assets.dart';
import '../../core/utils/size.dart';
import '../../core/utils/styles.dart';
import '../../core/widget/appbar_icon_widget.dart';
import '../../core/widget/bottom_widget.dart';

class JobTypeView extends StatelessWidget {
  final PageController controller = PageController();

  JobTypeView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: AppBarIconWidget(
          onTab: () {},
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockSizeVertical! * 2.5,
            horizontal: SizeConfig.blockSizeVertical! * 2.1,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            logo,
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 4,
            ),
            Text(
              'What type of job you’re looking for?',
              style: Styles.textStyles28.copyWith(fontSize: 30),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 2.5,
            ),
            Expanded(
              child: PageView(
                /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                /// Use [Axis.vertical] to scroll vertically.
                controller: controller,
                children: const <Widget>[
                  Page1(),
                  Page2(),
                ],
              ),
            ),
            SizedBox(
              width: SizeConfig.screenWidth,
              child: BottomWidgetWithBackgraundForForgetPassword(
                text: 'Save',
                onTab: () {},
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Image.asset(
              'assets/iconsSvg/curve 1.png',
              width: 30,
              height: 30,
            ),
            title: Text(
              'Designer',
              style: Styles.textStyles28
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            trailing: Checkbox(
              shape: const CircleBorder(eccentricity: 0.9),
              onChanged: (value) {},
              value: true,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListTile(
            leading: Image.asset(
              'assets/iconsSvg/curve 2.png',
              width: 30,
              height: 30,
            ),
            title: Text(
              'Developer',
              style: Styles.textStyles28
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            trailing: Checkbox(
              shape: const CircleBorder(eccentricity: 0.9),
              onChanged: (value) {},
              value: false,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListTile(
            leading: Image.asset(
              'assets/iconsSvg/curve 3.png',
              width: 30,
              height: 30,
            ),
            title: Text(
              'Administrative  ',
              style: Styles.textStyles28
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            trailing: Checkbox(
              shape: const CircleBorder(eccentricity: 0.9),
              onChanged: (value) {},
              value: false,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListTile(
            leading: Image.asset(
              'assets/iconsSvg/curve 4.png',
              width: 30,
              height: 30,
            ),
            title: Text(
              'Marketing  ',
              style: Styles.textStyles28
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            trailing: Checkbox(
              shape: const CircleBorder(eccentricity: 0.9),
              onChanged: (value) {},
              value: false,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListTile(
            leading: Image.asset(
              'assets/iconsSvg/curve 5.png',
              width: 30,
              height: 30,
            ),
            title: Text(
              'Management  ',
              style: Styles.textStyles28
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            trailing: Checkbox(
              shape: const CircleBorder(eccentricity: 0.9),
              onChanged: (value) {},
              value: true,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListTile(
            leading: Image.asset(
              'assets/iconsSvg/curve 6.png',
              width: 30,
              height: 30,
            ),
            title: Text(
              'Others',
              style: Styles.textStyles28
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            trailing: Checkbox(
              shape: const CircleBorder(eccentricity: 0.9),
              onChanged: (value) {},
              value: false,
            ),
          ),
        ),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Image.asset(
              'assets/iconsSvg/m1.png',
              width: 30,
              height: 30,
            ),
            title: Text(
              'Full-Time',
              style: Styles.textStyles28
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            trailing: Checkbox(
              shape: const CircleBorder(eccentricity: 0.9),
              onChanged: (value) {},
              value: true,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListTile(
            leading: Image.asset(
              'assets/iconsSvg/m2.png',
              width: 30,
              height: 30,
            ),
            title: Text(
              'Part-Time',
              style: Styles.textStyles28
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            trailing: Checkbox(
              shape: const CircleBorder(eccentricity: 0.9),
              onChanged: (value) {},
              value: false,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListTile(
            leading: Image.asset(
              'assets/iconsSvg/m3.png',
              width: 30,
              height: 30,
            ),
            title: Text(
              'Contract  ',
              style: Styles.textStyles28
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            trailing: Checkbox(
              shape: const CircleBorder(eccentricity: 0.9),
              onChanged: (value) {},
              value: true,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListTile(
            leading: Image.asset(
              'assets/iconsSvg/m4.png',
              width: 30,
              height: 30,
            ),
            title: Text(
              'Internship  ',
              style: Styles.textStyles28
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            trailing: Checkbox(
              shape: const CircleBorder(eccentricity: 0.9),
              onChanged: (value) {},
              value: false,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListTile(
            leading: Image.asset(
              'assets/iconsSvg/m5.png',
              width: 30,
              height: 30,
            ),
            title: Text(
              'Freelance  ',
              style: Styles.textStyles28
                  .copyWith(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            trailing: Checkbox(
              shape: const CircleBorder(eccentricity: 0.9),
              onChanged: (value) {},
              value: false,
            ),
          ),
        ),
      ],
    );
  }
}
