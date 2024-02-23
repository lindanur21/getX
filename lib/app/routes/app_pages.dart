import 'package:get/get.dart';

import '../middlewares/auth_middleware.dart';
import '../modules/biodata/bindings/biodata_binding.dart';
import '../modules/biodata/views/biodata_view.dart';
import '../modules/bottom_menu/bindings/bottom_menu_binding.dart';
import '../modules/bottom_menu/views/bottom_menu_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/employe/bindings/employe_binding.dart';
import '../modules/employe/views/employe_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kategori/bindings/kategori_binding.dart';
import '../modules/kategori/views/create_view.dart';
import '../modules/kategori/views/edit_view.dart';
import '../modules/kategori/views/kategori_view.dart';
import '../modules/kategori/views/show_view.dart';
import '../modules/latihan1/bindings/latihan1_binding.dart';
import '../modules/latihan1/views/latihan1_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()]
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: _Paths.BIODATA,
      page: () => BiodataView(),
      binding: BiodataBinding(),
    ),
    GetPage(
      name: _Paths.LATIHAN1,
      page: () => Latihan1(),
      binding: Latihan1Binding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYE,
      page: () => EmployeView(),
      binding: EmployeBinding(),
    ),
    GetPage(
      name: _Paths.KATEGORI,
      page: () => const KategoriView(),
      binding: KategoriBinding(),
      children: [
        GetPage(
          name: _Paths.CreateKategori,
          page: () => CreateKategoriView(),
        ),
        GetPage(
          name: _Paths.EditKategori,
          page: () => EditKategoriView(kategori: Get.arguments),
        ),
        GetPage(
          name: _Paths.DetailKategori,
          page: () => DetailKategoriView(kategori: Get.arguments),
        ),
      ],
    ),
    GetPage(
      name: _Paths.BOTTOM_MENU,
      page: () => BottomMenuView(),
      binding: BottomMenuBinding(),
    ),
  ];
}
