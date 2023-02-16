import 'package:get/get.dart';

import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/ViewData/bindings/view_data_binding.dart';
import '../modules/ViewData/views/view_data_view.dart';
import '../modules/api/bindings/api_binding.dart';
import '../modules/api/views/api_view.dart';
import '../modules/crud/bindings/crud_binding.dart';
import '../modules/crud/views/crud_view.dart';
import '../modules/edit/bindings/edit_binding.dart';
import '../modules/edit/views/edit_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/widget1/bindings/widget1_binding.dart';
import '../modules/widget1/views/widget1_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CRUD,
      page: () => CrudView(),
      binding: CrudBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_DATA,
      page: () => ViewDataView(),
      binding: ViewDataBinding(),
    ),
    GetPage(
      name: _Paths.EDIT,
      page: () => EditView(),
      binding: EditBinding(),
    ),
    GetPage(
      name: _Paths.WIDGET1,
      page: () => const Widget1View(),
      binding: Widget1Binding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.API,
      page: () => ApiView(),
      binding: ApiBinding(),
    ),
  ];
}
