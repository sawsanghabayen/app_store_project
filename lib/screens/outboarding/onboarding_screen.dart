import 'package:database_app/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/on_boarding_content.dart';
import '../widgets/page_view_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _currentPage < 2,
                replacement: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  },
                  child:  Text(context.localizations.start ,style: TextStyle(color:Color(0xFFFF7750)),),
                ),
                child: TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      2,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOutBack,
                    );
                  },
                  style: TextButton.styleFrom(
                    // alignment: AlignmentDirectional.topEnd
                    primary: const Color(0xFFFF7750),
                  ),
                  child:  Text(context.localizations.skip),
                ),
              ),
            ),

            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                // physics: ClampingScrollPhysics(),
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int currentPage) {
                  print('CurrentPage: $currentPage');
                  print('CurrentPage: ${_pageController.page}');
                  setState(() => _currentPage = currentPage);
                },
                children:  [
                  OnBoardingContent(
                    image: 'image_1',
                    title: context.localizations.boarding1_title,
                    subTitle:context.localizations.boarding1_content ,
                  ),
                  OnBoardingContent(
                    image: 'image_2',
                    title: context.localizations.boarding2_title,
                    subTitle: context.localizations.boarding2_content,
                  ),
                  OnBoardingContent(
                    image: 'image_3',
                    title: context.localizations.boarding3_title,
                    subTitle: context.localizations.boarding3_content,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageViewIndicator(
                  isCurrentPage: _currentPage == 0,
                  marginEnd: 15,
                ),
                PageViewIndicator(
                  isCurrentPage: _currentPage == 1,
                  marginEnd: 15,
                ),
                PageViewIndicator(
                  isCurrentPage: _currentPage == 2,
                ),
              ],
            ),
            const SizedBox(height: 50),

            ElevatedButton(

              onPressed: () {

                _currentPage == 2 ?
                Navigator.pushReplacementNamed(context, '/login_screen') :
                _pageController.nextPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOutBack,);
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFFFF7750),
                shadowColor: Colors.transparent,
                minimumSize:  Size(325.w, 63.83.h),
                padding:  const EdgeInsets.symmetric(horizontal: 25),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              child:  _currentPage == 2 ?  Text( context.localizations.start) :  Text( context.localizations.next),
            ),
            const SizedBox(height: 58.2),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     IconButton(
            //       onPressed: () {
            //         if (_currentPage > 0) {
            //           _pageController.previousPage(
            //             duration: const Duration(seconds: 1),
            //             curve: Curves.easeInOutBack,
            //           );
            //         }
            //       },
            //       icon: const Icon(Icons.arrow_back_ios),
            //     ),
            //     IconButton(
            //       onPressed: () {
            //         if (_currentPage < 2) {
            //           _pageController.nextPage(
            //             duration: const Duration(seconds: 1),
            //             curve: Curves.easeInOutBack,
            //           );
            //         }
            //       },
            //       icon: const Icon(Icons.arrow_forward_ios),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 25),
            // Visibility(
            //   visible: _currentPage == 2,
            //   maintainState: true,
            //   maintainSize: true,
            //   maintainAnimation: true,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 30),
            //     child: DecoratedBox(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         boxShadow: const [
            //           BoxShadow(
            //               color: Colors.black38,
            //               offset: Offset(0, 3),
            //               blurRadius: 6)
            //         ],
            //         gradient: const LinearGradient(
            //           colors: [
            //             Color(0xFFA6D1E6),
            //             Color(0xFFFEFBF6),
            //           ],
            //         ),
            //       ),
            //       child: ElevatedButton(
            //         onPressed: () {
            //           Navigator.pushReplacementNamed(context, '/login_screen');
            //         },
            //         style: ElevatedButton.styleFrom(
            //           primary: Colors.transparent,
            //           shadowColor: Colors.transparent,
            //           minimumSize: const Size(double.infinity, 50),
            //           // shape: RoundedRectangleBorder(
            //           //   borderRadius: BorderRadius.circular(10),
            //           // ),
            //         ),
            //         child: const Text('START'),
            //       ),
            //     ),
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TabPageSelectorIndicator(
            //       backgroundColor: _currentPage == 0 ? Colors.blue : Colors.grey,
            //       borderColor:
            //           _currentPage == 0 ? Colors.orange : Colors.transparent,
            //       size: 10,
            //     ),
            //     TabPageSelectorIndicator(
            //       backgroundColor: _currentPage == 1 ? Colors.blue : Colors.grey,
            //       borderColor:
            //           _currentPage == 1 ? Colors.orange : Colors.transparent,
            //       size: 10,
            //     ),
            //     TabPageSelectorIndicator(
            //       backgroundColor: _currentPage == 2 ? Colors.blue : Colors.grey,
            //       borderColor: _currentPage == 2 ? Colors.orange : Colors.transparent,
            //       size: 10,
            //     ),
            //   ],
            // ),

          ],
        ),
      ),
    );
  }
}
