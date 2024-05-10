import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pmob_petakgov/firebase_auth_implementation/firebase_auth_service.dart';
import 'package:pmob_petakgov/misc/colors.dart';
import 'package:pmob_petakgov/pages/detail_page.dart';
import 'package:pmob_petakgov/widgets/app_large_text.dart';
import 'package:pmob_petakgov/widgets/app_text.dart';
import 'package:pmob_petakgov/widgets/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var logo = {
    "town.png": "Construction",
    "cons.png": "Maintenance",
    "tree.png": "Environmental",
    "Vac.png": "Eventuall",
    "Dot": "Others",
  };

  var projek = [
    {"image": "road.jpg", "title": "Perbaikan Jalan"},
    {"image": "paris.jpeg", "title": "Pembuatan Kota"},
    {"image": "kali.jpeg", "title": "Pembangunan sungai"},
  ];

  FireBaseAuthService _auth = FireBaseAuthService();

  var material = {};
  String _username = ''; // Tambahkan variabel untuk menyimpan nama pengguna

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadUsername(); // Panggil fungsi _loadUsername saat widget diinisialisasi
  }

  Future<void> _loadUsername() async {
    FirebaseAuth user = FirebaseAuth.instance;

    String email = user.currentUser!.email as String;

    String? username = await _auth.getUsername(email);
    if (username != null) {
      setState(() {
        _username = username;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menu Text (Drawer)
              Container(
                padding: const EdgeInsets.only(top: 50, left: 20),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.5),
                        image: const DecorationImage(
                          image: AssetImage("img/icon.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Headline text
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(text: "Halo, $_username ! "),
              ),
              const SizedBox(height: 20),
              // tab bar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 30, right: 30),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: AppColors.buttonBackground,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    indicator: CircleTabIndicator(
                      color: AppColors.mainColor,
                      radius: 4,
                    ),
                    tabs: const [
                      Tab(text: "What's New"),
                      Tab(text: "Near You"),
                      Tab(text: "Recently Access"),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: projek.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        final image = projek[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProjectDetailPage(
                                  image: image['image'],
                                  title: image['title'],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 15, top: 10),
                            width: 200,
                            height: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("img/" + image["image"]!),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    image["title"]!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: const DecorationImage(
                              image: AssetImage("img/gedung.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    const Text("Bye"),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: "Explore More !",
                      size: 22,
                    ),
                    AppText(
                      text: "See all",
                      color: AppColors.textColor2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 120,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                  itemCount: logo.length, // Menggunakan panjang keys dari logo
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    String key = logo.keys.elementAt(
                        index % logo.length); // Mendapatkan key berulang-ulang
                    return Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 4),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("img/" + key),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            width: 80,
                            child: AppText(
                              text: logo[
                                  key]!, // Mendapatkan value berdasarkan key
                              color: AppColors.textColor2,
                              size: 10,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                child: const Image(
                  width: 600,
                  height: 150,
                  alignment: Alignment.center,
                  image: AssetImage("img/motto.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color, radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter(this.color, this.radius);

  @override
  void paint(
    Canvas canvas,
    Offset offset,
    ImageConfiguration imageConfiguration,
  ) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
      imageConfiguration.size!.width / 2,
      imageConfiguration.size!.height - 2,
    );
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
