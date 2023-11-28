import 'package:get/get.dart';
import 'package:task_management/presentation/pages/chatting/chatting_screen.dart';
import 'package:task_management/presentation/pages/create_profile/binding/signup_binding.dart';
import 'package:task_management/presentation/pages/create_profile/create_profile_screen.dart';
import 'package:task_management/presentation/pages/submit_proposal/binding/submit_proposal_binding.dart';
import 'package:task_management/presentation/pages/submit_proposal/submit_proposal_screen.dart';
import 'package:task_management/presentation/pages/task_detail/binding/task_detail_binding.dart';
import 'package:task_management/presentation/pages/task_detail/task_detail_screen.dart';
import 'package:task_management/presentation/pages/teacher_home/binding/home_binding.dart';
import 'package:task_management/presentation/pages/teacher_profile/binding/teacher_profile_binding.dart';
import 'package:task_management/presentation/pages/teacher_profile/teacher_profile_screen.dart';
import 'package:task_management/presentation/pages/welcome_page/binding/welcome_binding.dart';
import 'package:task_management/presentation/pages/welcome_page/welcome_screen.dart';

import '../presentation/pages/bottom_nav_bar/binding/bottom_nav_bar_binding.dart';
import '../presentation/pages/bottom_nav_bar/bottom_nav_bar_page.dart';
import '../presentation/pages/change_password/binding/change_pass_binding.dart';
import '../presentation/pages/change_password/change_pass_screen.dart';
import '../presentation/pages/chat/binding/chat_binding.dart';
import '../presentation/pages/chat/chat_screen.dart';
import '../presentation/pages/chatting/binding/chatting_binding.dart';
import '../presentation/pages/edit_profile/binding/edit_profile_binding.dart';
import '../presentation/pages/edit_profile/edit_profile_screen.dart';
import '../presentation/pages/forgot_password/binding/forgot_password_binding.dart';
import '../presentation/pages/forgot_password/forgot_password_screen.dart';
import '../presentation/pages/home/binding/home_binding.dart';
import '../presentation/pages/home/home_screen.dart';
import '../presentation/pages/notifications/binding/notifications_binding.dart';
import '../presentation/pages/notifications/notifications_screen.dart';
import '../presentation/pages/privacy_policy/privacy_policy.dart';
import '../presentation/pages/privacy_policy/terms.dart';
import '../presentation/pages/reset_password/binding/reset_password_binding.dart';
import '../presentation/pages/reset_password/reset_password_screen.dart';
import '../presentation/pages/settings/binding/settings_binding.dart';
import '../presentation/pages/settings/settings_screen.dart';
import '../presentation/pages/signin/binding/signin_binding.dart';
import '../presentation/pages/signin/signin_screen.dart';
import '../presentation/pages/signup/binding/signup_binding.dart';
import '../presentation/pages/signup/signup_screen.dart';
import '../presentation/pages/teacher_home/teacher_home_screen.dart';
import 'app_routes.dart';

class RoutingModule {
  List<GetPage> routingList = [
    // GetPage(
    //   name: Routes.splash,
    //   page: () => const SplashScreen(),
    //   binding: SplashBinding(),
    // ),

    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.teacherHome,
      page: () => const TeacherHomeScreen(),
      binding: TeacherHomeBinding(),
    ),
    GetPage(
      name: Routes.taskDetail,
      page: () => const TaskDetailScreen(),
      binding: TaskDetailBinding(),
    ),
    GetPage(
      name: Routes.createProfile,
      page: () => const CreateProfileScreen(),
      binding: CreateProfileBinding(),
    ),
    GetPage(
      name: Routes.teacherProfile,
      page: () => const TeacherProfileScreen(),
      binding: TeacherProfileBinding(),
    ),
    GetPage(
      name: Routes.submitProposal,
      page: () => const SubmitProposalScreen(),
      binding: SubmitProposalBinding(),
    ),
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.signin,
      page: () => const SignInScreen(),
      binding: SiginBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignUpScreen(),
      binding: SigupBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotBinding(),
    ),

    GetPage(
      name: Routes.resetPassword,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.bottomNavBar,
      page: () => const BottomNavBarScreen(),
      binding: BottomNavBarBinding(),
    ),

    GetPage(
      name: Routes.privacyPolicy,
      page: () => const PrivacyPolicy(),
    ),
    GetPage(
      name: Routes.terms,
      page: () => const TermsScreen(),
    ),
    GetPage(
      name: Routes.changePass,
      page: () => const ChangePasswordScreen(),
      binding: ChangePasswordBinding(),
    ),

    GetPage(
      name: Routes.editProfile,
      page: () => const EditProfileScreen(),
      binding: EditProfileBinding(),
    ),

    GetPage(
      name: Routes.chats,
      page: () => const ChatScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.chatting,
      page: () => const ChattingScreen(),
      binding: ChattingBinding(),
    ),
    GetPage(
      name: Routes.notifications,
      page: () => const NotificationScreen(),
      binding: NotificationsBinding(),
    ),
  ];
}
