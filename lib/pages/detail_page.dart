import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmob_petakgov/misc/colors.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({Key? key, this.image, this.title}) : super(key: key);

  final String? image;
  final String? title;

  String getDescription() {
    switch (image) {
      case 'road.jpg':
        return 'Pembangunan dan perbaikan jalan raya dan drainase di sepanjang gubeng barat, dilakukan untuk menghadapi musim penghujan dimana terdapat banyak genangan yang dapat menganggu transportasi dan lalu lintas dan dapat menimbulkan kecelakaan. Solusi ini digagas untuk keamanan warga yang melewati jalan tersebut';
      case 'paris.jpeg':
        return 'Pembangunan kota terus berjalan, pada saat ini dibangunnya kota dengan berpatokan kepada kota paris diharapkan untuk mendongkrak visa dan keuntungan untuk pra turis agar lebih banyak turis yang datang ke surabaya';
      case 'kali.jpeg':
        return 'Sungai dekat masjid Al-Iman Surabaya yang kemaren mengalami luapan dikarenakan hujan selama 3 hari 3 malam sudah mulai surut dan kering sehuingga warga sekitar dapat beraktivitas kembali';
      default:
        return 'Deskripsi gambar default';
    }
  }

  String getCategory() {
    switch (image) {
      case 'road.jpg':
        return 'Maintenance';
      case 'paris.jpeg':
        return 'Construction';
      case 'kali.jpeg':
        return 'Environmental';
      default:
        return 'Other';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                leadingWidth: 100,
                leading: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(CupertinoIcons.chevron_back),
                  label: const Text(''),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz),
                      label: const Text('More'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        elevation: MaterialStateProperty.all<double>(0),
                      ),
                    ),
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          // Aksi ketika diklik
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  'img/adel.jpg',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dishub Surabaya",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "est.12 April 2024",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.send_outlined,
                                  color: AppColors.mainColor,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.bookmark_outline,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        child: Image.asset("img/$image"),
                      ),
                      const Divider(),
                      Column(
                        children: [
                          Text(
                            title ?? '',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Category: ${getCategory()}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 10, 30),
                        child: InkWell(
                          onTap: () {
                            // Aksi ketika diklik
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              getDescription(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontSize:
                                        20, // Ubah ukuran teks menjadi sedang
                                  ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 110,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent,
                          ),
                          elevation: MaterialStateProperty.all<double>(0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fav It !!!',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 25,
                                  ),
                            ),
                            const Icon(
                              CupertinoIcons.heart_circle_fill,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
