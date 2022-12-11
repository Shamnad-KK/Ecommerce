import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/model/carousal_model.dart';
import 'package:ecommerce/model/home_category_model.dart';
import 'package:ecommerce/services/home_services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeServices extends Mock implements HomeServices {}

void main() {
  late HomeController homeController; //System Under Test
  late MockHomeServices mockHomeServices;

  //Most of the things in test should be initialized in a method called setup.This setup method will run before each test runs
  setUp(() {
    mockHomeServices = MockHomeServices();
    homeController = HomeController(mockHomeServices);
  });

  test(
    "Checking initial values are correct",
    () {
      expect(homeController.isLoading, false);
      expect(homeController.carousalList, []);
      expect(homeController.categoryList, []);
      expect(homeController.products, []);
    },
  );

  group(
    "Home testing",
    () {
      group(
        "get carousals",
        () {
          // test(
          //   "Checking carousal initial values",
          //   () {

          //   },
          // );
          final carousalsFromService = [
            Carrousals(
              id: '1',
              title: 'Test title 1',
              image: 'Test image 1',
              description: 'Test description 1',
              offer: 1,
            ),
            Carrousals(
              id: '2',
              title: 'Test title 2',
              image: 'Test image 2',
              description: 'Test description 2',
              offer: 2,
            ),
            Carrousals(
              id: '3',
              title: 'Test title 3',
              image: 'Test image 3',
              description: 'Test description 3',
              offer: 3,
            )
          ];
          void arrangeHomeServiceReturns3Carousals() {
            when(() => mockHomeServices.getCarousal()).thenAnswer(
              (_) async => carousalsFromService,
            );
          }

          test(
            'get carousals using the home service',
            () async {
              //Giving implementation for the getCarousals in services when it is called.Giving return values for the method
              arrangeHomeServiceReturns3Carousals();
              //calling the getCarousals in controller
              await homeController.getCarousals();
              //verifying that when getCarousals from homecontroller called then getCarousals from services is called once
              verify(() => mockHomeServices.getCarousal()).called(1);
            },
          );

          test(
            """Sets loading of data to true,
        Sets carousals in the controller to the ones from the service,
        Sets that the data is not being loaded anymore
        """,
            () async {
              //Giving implementation for the getCarousals in services when it is called.Returning a list of articles from service
              arrangeHomeServiceReturns3Carousals();
              //calling the getCarousals in controller
              final future = homeController.getCarousals();
              //expecting the data loading is true
              expect(homeController.isLoading, true);
              await future;
              //servicenn return cheytha same data controllerile listilekk corrct aaytt vannittndo nn check chyynn
              expect(homeController.carousalList, carousalsFromService);
              expect(homeController.isLoading, false);
            },
          );
        },
      );

      group(
        "get categories",
        () {
          final categoriesFromServices = [
            HomeCategoryModel(
              id: "1",
              name: "test category 1",
              image: "test image 1",
            ),
            HomeCategoryModel(
              id: "2",
              name: "test category 2",
              image: "test image 2",
            ),
            HomeCategoryModel(
              id: "3",
              name: "test category 3",
              image: "test image 3",
            ),
          ];

          void arrangeHomeCategoriesReturn3Categories() {
            when(() => mockHomeServices.getAllCategories())
                .thenAnswer((invocation) async => categoriesFromServices);
          }

          test(
            "get categories using the home service",
            () async {
              //Giving implementation for the getAllCategories in services when it is called.Giving return values for the method
              arrangeHomeCategoriesReturn3Categories();
              //calling the getAllCategories in controller
              await homeController.getAllCategories();
              //verifying that when getAllCategories from homecontroller called then getAllCategories from services is called once
              verify(() => mockHomeServices.getAllCategories()).called(1);
            },
          );

          test(
            """Sets loading of data to true,
        Sets categories in the controller to the ones from the service,
        Sets that the data is not being loaded anymore
        """,
            () async {
              arrangeHomeCategoriesReturn3Categories();
              final future = homeController.getAllCategories();
              expect(homeController.isLoading, true);
              await future;
              expect(homeController.categoryList, categoriesFromServices);
              expect(homeController.isLoading, false);
            },
          );
        },
      );
    },
  );
}
