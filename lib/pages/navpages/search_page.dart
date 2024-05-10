import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmob_petakgov/misc/colors.dart';
import 'package:pmob_petakgov/misc/provider/items_model.dart';
import 'package:pmob_petakgov/misc/provider/bookmark_model.dart';
import 'package:pmob_petakgov/pages/navpages/bookmarks_page.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<SearchPage> {
  List<Map<String, dynamic>> itemsList = [
    {
      'title': 'The Galaxy Residences Building Project (Wiyung Surabaya)',
      'subtitle':
          'Proyek hunian mewah yang terdiri dari tower Elitz dan Luxe, memberikan pengalaman tinggal yang eksklusif di Surabaya.',
      'isFavorite': false,
      'image': 'futur.jpeg',
    },
    {
      'title': 'Pembangunan Bandara DOHO, Kediri',
      'subtitle':
          'Proyek strategis nasional untuk pembangunan Bandara Kediri, menghubungkan Surabaya dengan fasilitas penerbangan yang lebih baik.',
      'isFavorite': false,
      'image': 'pesawat.jpeg',
    },
    {
      'title': 'Pembangunan Rel Kereta Api Jakarta-Surabaya',
      'subtitle':
          'Proyek kereta api ganda yang menghubungkan Jakarta dan Surabaya, meningkatkan konektivitas transportasi antar kota.',
      'isFavorite': false,
      'image': 'rel.jpeg',
    },
    {
      'title': 'Perbaikan Jalan Ir.Soekarno-Merr',
      'subtitle':
          'Perbaikan dan pembangunan drainase jalan di daerah sekitar jalan Ir.Soekarno no 42-Jalan Raya MERR perbatasan Kenjeran',
      'isFavorite': false,
      'image': 'road.jpg',
    },
    {
      'title': 'Klaska Residence Project (Tunjungan Plaza)',
      'subtitle':
          'Pembangunan 5 tower apartemen dengan 40 lantai dan 1 basement di Surabaya, menghadirkan konsep hunian yang eksklusif ',
      'isFavorite': false,
      'image': 'kali.jpeg',
    },
    {
      'title': 'Revitalisasi Pasar Tradisional Wonokromo',
      'subtitle':
          'memperbaiki infrastruktur pasar, meningkatkan kebersihan, memperkenalkan inovasi teknologi dalam transaksi, serta memberdayakan pedagang dan pelaku usaha lokal.',
      'isFavorite': false,
      'image': 'pasar.jpeg',
    },
  ];

  List<Map<String, dynamic>> filteredItemsList =
      []; // New list for filtered items

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItemsList = itemsList; // Initialize filtered list with all items
  }

  void filterItems(String query) {
    setState(() {
      filteredItemsList = itemsList
          .where((item) =>
              item['title'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = Provider.of<BookmarkBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recent Access Project",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColor.withOpacity(0.5),
        actions: [
          Row(
            children: [
              Text(bookmarkBloc.count.toString()),
              IconButton(
                icon: Icon(
                  CupertinoIcons.heart_circle_fill,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookmarksPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              filterItems(searchController
                  .text); // Call filterItems with text from TextField
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  filterItems(value); // Call filterItems when text changes
                },
                decoration: InputDecoration(
                  labelText: "Search Project",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredItemsList
                  .length, // Use filteredItemsList instead of itemsList
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              'img/${filteredItemsList[index]['image']}'), // Use filteredItemsList instead of itemsList
                          radius: 35, // Adjust the size of the avatar
                        ),
                        onTap: () {
                          bookmarkBloc.addCount();

                          ItemModel itemModel = ItemModel(
                            title: filteredItemsList[index][
                                'title'], // Use filteredItemsList instead of itemsList
                            image: filteredItemsList[index][
                                'image'], // Use filteredItemsList instead of itemsList
                            subTitle: filteredItemsList[index][
                                'subtitle'], // Use filteredItemsList instead of itemsList
                            isFavorite: !filteredItemsList[index][
                                'isFavorite'], // Use filteredItemsList instead of itemsList
                          );

                          bookmarkBloc.addItems(itemModel);

                          setState(() {
                            filteredItemsList[index]['status'] =
                                true; // Use filteredItemsList instead of itemsList
                            filteredItemsList[index][
                                'image']; // Use filteredItemsList instead of itemsList
                            filteredItemsList[index]
                                ['isFavorite'] = !filteredItemsList[
                                    index][
                                'isFavorite']; // Use filteredItemsList instead of itemsList
                          });
                        },
                        title: Text(filteredItemsList[index][
                            'title']), // Use filteredItemsList instead of itemsList
                        subtitle: Text(filteredItemsList[index][
                            'subtitle']), // Use filteredItemsList instead of itemsList
                        trailing: filteredItemsList[index]['isFavorite']
                            ? Icon(CupertinoIcons.star, color: Colors.blue)
                            : Icon(CupertinoIcons.star_fill),
                      ),
                      Divider(), // Add a divider between list tiles
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
