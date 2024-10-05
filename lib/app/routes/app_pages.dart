import 'package:get/get.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profileView/bindings/profileView_binding.dart';
import '../modules/profileView/views/profileView_view.dart';
import '../modules/bookService/bindings/bookService_bindings.dart';
import '../modules/bookService/views/bookService_views.dart';
import '../modules/bookupcoming/bindings/bookupcoming_binding.dart';
import '../modules/bookupcoming/views/bookupcoming_views.dart';
import '../modules/bookcompleted/bindings/bookcompleted_binding.dart';
import '../modules/bookcompleted/views/bookcompleted_views.dart';
import '../modules/bookcancelled/bindings/bookcancelled_binding.dart';
import '../modules/bookcancelled/views/bookcancelled_views.dart';
import '../modules/add_card/bindings/add_card_binding.dart';
import '../modules/add_card/views/add_card_view.dart';
import '../modules/paymentsmethod/bindings/paymentmethod_bindings.dart';
import '../modules/paymentsmethod/views/paymentmethod_views.dart';
import '../modules/reviewsummary/bindings/reviewsummary_binding.dart';
import '../modules/reviewsummary/views/reviewsummary_views.dart';
import '../modules/successbooking/bindings/successbooking_binding.dart';
import '../modules/successbooking/views/successbooking_views.dart';
import '../modules/e-receipt/bindings/e-receipt_binding.dart';
import '../modules/e-receipt/views/e-receipt_views.dart';
import '../modules/privacypolicy/bindings/privacypolicy_binding.dart';
import '../modules/privacypolicy/views/privacypolicy_views.dart';
import '../modules/confirm_address/bindings/confirm_address_binding.dart';
import '../modules/confirm_address/views/confirm_address_view.dart';
import '../modules/servicePage/bindings/servicePage_binding.dart';
import '../modules/servicePage/views/servicePage_view.dart';
import '../modules/servicePageConfirmation/bindings/servicePageConfirmation_binding.dart';
import '../modules/servicePageConfirmation/views/servicePageConfirmation_view.dart';
import '../modules/navbar/bindings/navbar_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.servicePageConfirmation;
  static const LOGIN = Routes.LOGIN;
  static const PROFILE = Routes.PROFILE;
  static const ProfileView = Routes.profileView;
  static const CATEGORY = Routes.CATEGORY;
  static const BookService = Routes.bookService;
  static const BOOKUPCOMING = Routes.BOOKUPCOMING;
  static const BOOKCOMPLETED = Routes.BOOKCOMPLETED;
  static const BOOKCANCELLED = Routes.BOOKCANCELLED;
  static const PAYMENTMETHOD = Routes.PAYMENTMETHOD;
  static const addCard = Routes.addCard;
  static const REVIEWSUMMARY = Routes.REVIEWSUMMARY;
  static const SUCCESSBOOKING = Routes.SUCCESSBOOKING;
  static const ERECEIPT = Routes.ERECEIPT;
  static const PRIVACYPOLICY = Routes.PRIVACYPOLICY;
  static const CONFIRM_ADDRESS = Routes.CONFIRM_ADDRESS;
  static const servicePage = Routes.servicePage;
  static const ServicePageConfirmation = Routes.servicePageConfirmation;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(name: _Paths.HOME, page: () => const HomeView(), bindings: [
      HomeBinding(),
      NavbarBinding(),
      CategoryBinding(),
    ]),
    GetPage(name: _Paths.PROFILE, page: () => const ProfileViews(), bindings: [
      ProfileBinding(),
      NavbarBinding(),
    ]),
    GetPage(
        name: _Paths.ProfileView,
        page: () => const ProfileViewView(),
        bindings: [
          ProfileViewBinding(),
        ]),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(), // Ensure this points to CategoryView
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.BookService,
      page: () => const BookServiceView(), // Ensure this points to CategoryView
      binding: BookServiceBinding(),
    ),
    GetPage(
      name: _Paths.BOOKUPCOMING,
      page: () => const MyBookingsView(), // Ensure this points to CategoryView
      binding: BookupcomingBinding(),
    ),
    GetPage(
      name: _Paths.BOOKCOMPLETED,
      page: () =>
          const BookcompletedViews(), // Ensure this points to CategoryView
      binding: BookcompletedBinding(),
    ),
    GetPage(
      name: _Paths.BOOKCANCELLED,
      page: () =>
          const BookcancelledViews(), // Ensure this points to CategoryView
      binding: BookcancelledBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENTMETHOD,
      page: () =>
          const PaymentmethodView(), // Ensure this points to CategoryView
      binding: PaymentmethodBinding(),
    ),
    GetPage(
      name: _Paths.addCard,
      page: () => const AddCardView(), // Ensure this points to CategoryView
      binding: AddCardBinding(),
    ),
    GetPage(
      name: _Paths.REVIEWSUMMARY,
      page: () =>
          const ReviewsummaryView(), // Ensure this points to CategoryView
      binding: ReviewSummaryBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESSBOOKING,
      page: () =>
          const SuccessbookingView(), // Ensure this points to CategoryView
      binding: SuccessbookingBinding(),
    ),
    GetPage(
      name: _Paths.ERECEIPT,
      page: () => const EreceiptView(), // Ensure this points to CategoryView
      binding: EreceiptBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACYPOLICY,
      page: () =>
          const PrivacypolicyView(), // Ensure this points to CategoryView
      binding: PrivacypolicyBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRM_ADDRESS,
      page: () =>
          const ConfirmAddressView(), // Ensure this points to CategoryView
      binding: ConfirmAddressBinding(),
    ),
    GetPage(
      name: _Paths.servicePage,
      page: () => const ServicePageView(), // Ensure this points to CategoryView
      binding: ServicePageBinding(),
    ),
    GetPage(
      name: _Paths.servicePageConfirmation,
      page: () => const ServicePageConfirmationView(), // Ensure this points to CategoryView
      binding: ServicePageConfirmationBinding(),
    ),
  ];
}
