import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_appbar_component.dart';
import '../../../components/custom_text_component.dart';
import '../../../components/main_scaffold_component.dart';
import '../../../components/svg_icons_components.dart';
import '../../../utils/styles.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      appBar: CustomAppBar(
        leading: true,
        backButtonColor: Styles.black,
        title: '',
        bgColor: Styles.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Styles.screenPadding),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 30 / 812,
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: Get.height * 50 / 812,
                    width: Get.width * 50 / 375,
                    decoration: BoxDecoration(
                      color: Styles.solidOrange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: SvgIconComponent(
                        icon: 'terms.svg',
                        height: Get.height * 22 / 812,
                        width: Get.width * 19.8 / 375),
                  ),
                  SizedBox(width: Get.width * 13 / 375),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextWidget(
                        text: "Terms & Conditions",
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                      SizedBox(height: Get.height * 8 / 812),
                      const CustomTextWidget(
                        text: "Update Apr 21, 2023",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Styles.solidGrey,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: Get.height * 22 / 812),
              const CustomTextWidget(
                text:
                    "Lorem ipsum dolor sit amet consectetur. Urna volutpat gravida sem curabitur. Sed tellus ultrices vitae magnis orci erat lobortis semper.",
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: Get.height * 15 / 812),
              const CustomTextWidget(
                text:
                    "Lorem ipsum dolor sit amet consectetur. Urna volutpat gravida sem curabitur. Sed tellus ultrices vitae magnis orci erat lobortis semper. \n\n In eget nisl penatibus orci. Aliquam massa vestibulum at feugiat risus malesuada. Luctus maecenas pretium sed venenatis nulla ante nunc ultrices integer. Nibh vel fermentum euismod facilisi. Lorem vel praesent convallis purus sed non malesuada. At at dui metus in ornare vitae. Sed auctor sagittis diam dictum vitae aenean. Mi fermentum diam sollicitudin sed donec laoreet. In tortor in interdum lectus velit nisl. Elementum vestibulum augue sed viverra lacus proin orci. Id ornare aliquet ipsum elementum mauris. Cras aliquet mattis sit ut vel nisi turpis.\n\n Proin lectus at viverra euismod. Tortor phasellus cursus fringilla commodo urna id. Mi id vitae ultricies lobortis massa ornare quam. Tellus elit interdum aenean arcu quis ornare condimentum. Dictum est pellentesque vestibulum velit risus suspendisse condimentum sed sed. Elit elementum vitae lorem molestie duis arcu. Fermentum pretium semper nulla orci ut adipiscing nibh orci porttitor. Nibh tortor aliquam justo nisl sed aliquam velit laoreet. Nunc orci eget leo vitae eu sed ac lacus enim. Dignissim adipiscing nisl porta a. Erat scelerisque netus curabitur cursus at enim id. Pretium aliquam euismod pellentesque malesuada ultrices quam. Et massa quis id odio turpis orci laoreet mauris enim. Risus lectus odio sapien pellentesque quis amet amet. Pulvinar sit quis velit lobortis sapien aliquet vitae dis etiam. Tellus elit interdum aenean arcu quis ornare condimentum. Dictum est pellentesque vestibulum velit risus suspendisse condimentum sed sed. Elit elementum vitae lorem molestie duis arcu. Fermentum pretium semper nulla orci ut adipiscing nibh orci porttitor. Nibh tortor aliquam justo nisl sed aliquam velit laoreet. Nunc orci eget leo vitae eu sed ac lacus enim. Dignissim adipiscing nisl porta a. Erat scelerisque netus curabitur cursus at enim id. Pretium aliquam euismod pellentesque malesuada ultrices quam. Et massa quis id odio turpis orci laoreet mauris enim. Risus lectus odio sapien pellentesque quis amet amet. Pulvinar sit quis velit lobortis sapien aliquet vitae dis etiam. Tellus elit interdum aenean arcu quis ornare condimentum. Dictum est pellentesque vestibulum velit risus suspendisse condimentum sed sed. Elit elementum vitae lorem molestie duis arcu. Fermentum pretium semper nulla orci ut adipiscing nibh orci porttitor. Nibh tortor aliquam justo nisl sed aliquam velit laoreet. Nunc orci eget leo vitae eu sed ac lacus enim. Dignissim adipiscing nisl porta a. Erat scelerisque netus curabitur cursus at enim id. Pretium aliquam euismod pellentesque malesuada ultrices quam. Et massa quis id odio turpis orci laoreet mauris enim. Risus lectus odio sapien pellentesque quis amet amet. Pulvinar sit quis velit lobortis sapien aliquet vitae dis etiam.",
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Styles.solidGrey2,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
