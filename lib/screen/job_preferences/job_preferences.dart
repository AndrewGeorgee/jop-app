import 'package:flutter/material.dart';
import 'package:job_application/core/widget/bottom_widget.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/size.dart';
import '../../core/utils/styles.dart';
import '../../core/widget/appbar_icon_widget.dart';

class JobPreferences extends StatefulWidget {
  const JobPreferences({super.key});

  @override
  State<JobPreferences> createState() => _JobPreferencesState();
}

class _JobPreferencesState extends State<JobPreferences> {
  int selectedjobSelecte = 0;
  List<String> jobSelect = [
    'Product Designer',
    'Motion Designer',
    'UX Designer',
    'Graphics Designer',
    'Full-Stack Developer',
    'Developer',
  ];
  List<String> locationSelect = [
    'Worldwide',
    'USA',
    'California',
    'San Jose',
    'New York',
    'Seattle',
  ];
  int locationSelectedIndex = 0;
  int officeIndex = 0;
  List<String> officeSelect = [
    'Any',
    'On-Site',
    'Remote',
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: AppBarIconWidget(
          onTab: () {},
        ),
        title: Text('Job Preferences',
            textAlign: TextAlign.center,
            style: Styles.textStyles28.copyWith(
              fontSize: 25,
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal! * 6),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Select Job Roles',
              style: Styles.textStyles28
                  .copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 5),
            ),
            Text(
              'See all',
              style: Styles.textStyles15
                  .copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 4),
            ),
          ]),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 20,
            child: GridView.builder(
              itemCount: jobSelect.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 100 / 2),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedjobSelecte = index;
                        });
                      },
                      child: Container(
                        height: 50,
                        // margin: const EdgeInsets.symmetric(
                        //     horizontal: 8, vertical: 15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: selectedjobSelecte == index
                              ? ColorManager.bottomColor
                              : Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              jobSelect[index],
                              style: Styles.textStyles15.copyWith(
                                fontSize: 15,
                                color: selectedjobSelecte == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
//!   const
          const SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Job Type',
              style: Styles.textStyles28
                  .copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 5),
            ),
            Text(
              'See all',
              style: Styles.textStyles15
                  .copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 4),
            ),
          ]),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 16,
            child: GridView.builder(
              itemCount: locationSelect.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 100 / 2),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          locationSelectedIndex = index;
                        });
                      },
                      child: Container(
                        height: 50,
                        // margin: const EdgeInsets.symmetric(
                        //     horizontal: 8, vertical: 15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: locationSelectedIndex == index
                              ? ColorManager.bottomColor
                              : Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              locationSelect[index],
                              style: Styles.textStyles15.copyWith(
                                fontSize: 15,
                                color: locationSelectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          //!   const
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Office',
              style: Styles.textStyles28
                  .copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 5),
            ),
            Text(
              'See all',
              style: Styles.textStyles15
                  .copyWith(fontSize: SizeConfig.blockSizeHorizontal! * 4),
            ),
          ]),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 10,
            child: GridView.builder(
              itemCount: officeSelect.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 100 / 2),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          officeIndex = index;
                        });
                      },
                      child: Container(
                        height: 50,
                        // margin: const EdgeInsets.symmetric(
                        //     horizontal: 8, vertical: 15),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: officeIndex == index
                              ? ColorManager.bottomColor
                              : Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              officeSelect[index],
                              style: Styles.textStyles15.copyWith(
                                fontSize: 15,
                                color: officeIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 4,
          ),
          BottomWidgetWithBackgraund(text: 'Save', onTab: () {}, number: 20,)
        ]),
      ),
    );
  }
}
