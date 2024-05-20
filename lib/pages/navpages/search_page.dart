import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pmob_petakgov/misc/colors.dart';
import 'package:pmob_petakgov/models/search.dart';
import 'package:pmob_petakgov/pages/navpages/bookmarks_page.dart';
import 'package:pmob_petakgov/pages/navpages/detail_form_page.dart';
import 'package:pmob_petakgov/pages/navpages/create_form_page.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late TextEditingController searchController;

  Stream<List<Search>> data = Search.getSearches();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  void updateFavorite(String id, bool isFavorite) {
    FirebaseFirestore.instance.collection('searches').doc(id).update({
      'isFavorite': isFavorite,
    });
  }

  //mmebuat function untuk mencari data
  void search(String query) {
    print('searching...');
    if (query.isNotEmpty) {
      setState(() {
        data = Search.getSearchesbyQuery(query);
      });
    } else {
      setState(() {
        data = Search.getSearches();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateForm(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          "Recent Access Project",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.mainColor.withOpacity(0.5),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookmarksPage(),
                    ),
                  );
                },
                child: const Icon(
                  CupertinoIcons.heart_circle_fill,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
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
                  search(value);
                },
                decoration: const InputDecoration(
                  labelText: "Search Project",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            StreamBuilder<List<Search>>(
              stream: data,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Search>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var item = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: item.image != ""
                                    ? NetworkImage(item.image)
                                    : const AssetImage('img/tree.png')
                                        as ImageProvider<Object>?,
                                radius: 35,
                              ),
                              onTap: () {
                                // Tindakan yang ingin Anda lakukan ketika ListTile ditekan
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailForm(
                                      uid: item.id,
                                    ),
                                  ),
                                );
                              },
                              title: Text(item.title),
                              subtitle: Text(item.subtitle),
                              trailing: GestureDetector(
                                onTap: () {
                                  updateFavorite(item.id, !item.isFavorite);
                                  // Ubah nilai isFavorite saat ListTile di-klik
                                },
                                child: Icon(
                                  item.isFavorite
                                      ? CupertinoIcons.star_fill
                                      : CupertinoIcons.star,
                                  color: item.isFavorite ? Colors.blue : null,
                                ),
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
