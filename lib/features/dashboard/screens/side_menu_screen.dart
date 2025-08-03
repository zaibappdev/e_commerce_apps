import 'package:flutter/material.dart';

void changeStatusColor(Color color) {}
const profile =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHqHmAvOuO4fpdY5EQ3oQJfBqF9kL2wWkqnAQ4NBYPs2QyZeEOj9WjdY7rhP1ySHapSzg&usqp=CAU';
const colorPrimary = Colors.deepPurple;
const colorPrimaryLight = Colors.deepPurpleAccent;
Color textColorSecondary = Colors.grey.shade900;
const viewColor = Colors.black12;
const textSizeLargeMedium = 16.0;
const fontMedium = 'MediumFont';
const fontBold = 'BoldFont';

class AppStore {
  final Color appBarColor = Colors.white;
  final Color iconColor = Colors.black;
  final Color textPrimaryColor = Colors.black;
}

final appStore = AppStore();

extension CustomContext on BuildContext {
  Color get scaffoldBackgroundColor => Colors.white;
}

class SideMenuDrawer extends StatefulWidget {
  const SideMenuDrawer({super.key});

  @override
  State<SideMenuDrawer> createState() => _SideMenuDrawerState();
}

class _SideMenuDrawerState extends State<SideMenuDrawer> {
  int selectedItem = -1;

  final List<Map<String, dynamic>> menuItems = [
    {'label': 'Home', 'pos': 1},
    {'label': 'Profile', 'pos': 2},
    {'label': 'Appointments', 'pos': 3},
    {'label': 'Events', 'pos': 4},
    {'label': 'Terms & Conditions', 'pos': 5},
    {'label': 'Privacy Policy', 'pos': 6},
    {'label': 'Logout', 'pos': 8},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height,
      child: Drawer(
        elevation: 8,
        child: Container(
          color: context.scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 40),
                Center(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(profile),
                        radius: MediaQuery.of(context).size.width * 0.15,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Zaibappdev',
                        style: TextStyle(
                          fontFamily: fontBold,
                          color: colorPrimary,
                        ),
                      ),
                      Text(
                        'zaib.appdev@gmail.com',
                        style: TextStyle(color: colorPrimary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ...menuItems.map((item) {
                  int pos = item['pos'] as int;
                  String label = item['label'] as String;
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() => selectedItem = pos);
                          Navigator.pop(context); // drawer close
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          color: selectedItem == pos
                              ? colorPrimaryLight
                              : context.scaffoldBackgroundColor,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 4,
                                height:
                                    MediaQuery.of(context).size.width * 0.13,
                                color: selectedItem == pos
                                    ? colorPrimary
                                    : context.scaffoldBackgroundColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  20,
                                  10,
                                  20,
                                  10,
                                ),
                                child: Text(
                                  label,
                                  style: TextStyle(
                                    color: selectedItem == pos
                                        ? appStore.textPrimaryColor
                                        : textColorSecondary,
                                    fontSize: textSizeLargeMedium,
                                    fontFamily: fontMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(color: viewColor, height: 1),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
