import 'package:flutter/material.dart';
import 'description_screen.dart';
import 'side_menu_screen.dart';
import '../widgets/dashboard_product_item.dart';
import '../widgets/dashboard_slider_carousel.dart';

class DashboardScreen extends StatefulWidget {
  static String tag = '/T10Dashboard';

  const DashboardScreen({super.key});

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final PageController _pageController;
  int currentIndexPage = 0;

  final List<String> mSliderList = [
    'https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y29zbWV0aWN8ZW58MHx8MHx8fDA%3D',
    'https://domf5oio6qrcr.cloudfront.net/medialibrary/7544/724cf5e2-e067-445d-9665-2eb9a0a12c86.jpg',
    'https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y29zbWV0aWN8ZW58MHx8MHx8fDA%3D',
  ];

  final List<Map<String, String>> mDashboardList = [
    {
      'img':
          'https://eveen.pk/cdn/shop/files/bag_8446b958-442b-4f50-8e69-030fac930a4e.jpg?v=1714152567',
      'name': 'Burger Deluxe',
      'price': '\$8.99',
      'subPrice': '\$10.99',
    },
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEJAnEnAoV_AaRK5tBj4Y_PO81QcDrmKaTmg&s',
      'name': 'Cheese Pizza',
      'price': '\$12.99',
      'subPrice': '\$14.99',
    },
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIa3I5Z7y4V0RmtsqyVD4oz4MLsHfwfDOvng&s',
      'name': 'Pasta Bowl',
      'price': '\$9.99',
      'subPrice': '\$11.99',
    },
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEZN3C3IeNEuYh-RrPvGJHGks1xgABQl1lvQ&s',
      'name': 'Grilled Sandwich',
      'price': '\$6.99',
      'subPrice': '\$8.99',
    },
    {
      'img':
          'https://5.imimg.com/data5/SELLER/Default/2023/6/315084007/EO/EV/EN/84871332/2-500x500.jpg',
      'name': 'Fried Chicken',
      'price': '\$7.49',
      'subPrice': '\$9.49',
    },
    {
      'img':
          'https://www.julke.pk/cdn/shop/files/Aaron-mens-leather-laptop-bag-black-top-handle-shoulder-strap-front-view-JULKE_1400x.jpg?v=1726472634',
      'name': 'Veg Salad',
      'price': '\$5.99',
      'subPrice': '\$7.49',
    },
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBcEFofWO7M2kls8L7gu4D_1o86qPBGWk4Nw&s',
      'name': 'Sushi Roll',
      'price': '\$13.99',
      'subPrice': '\$15.99',
    },
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLrj0-kD0vYiKPMfo-j2uwhabj3NfrzK3PeA&s',
      'name': 'Choco Cake',
      'price': '\$4.99',
      'subPrice': '\$6.99',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9, initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      key: _scaffoldKey,
      drawer: const SideMenuDrawer(),

      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search),
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 16),

                    DashboardSliderCarousel(
                      imageUrls: mSliderList,
                      currentIndexPage: currentIndexPage,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndexPage = index;
                        });
                      },
                    ),

                    const SizedBox(height: 22),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: mDashboardList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.75,
                            ),
                        itemBuilder: (context, index) {
                          final product = mDashboardList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DescriptionScreen(product: product),
                                ),
                              );
                            },
                            child: DashboardProductTile(product: product),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
