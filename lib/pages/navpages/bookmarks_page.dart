import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmob_petakgov/misc/colors.dart';
import 'package:provider/provider.dart';
import 'package:pmob_petakgov/misc/provider/bookmark_model.dart';

class BookmarksPage extends StatefulWidget {
  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = Provider.of<BookmarkBloc>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      // Navigasi ke halaman sebelumnya atau aksi lainnya
                      Navigator.of(context).pop();
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.mainColor.withOpacity(0.3),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Icon(CupertinoIcons.chevron_back),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    'List of Favorite User',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "img/animations/star2.gif",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              itemCount: bookmarkBloc.items.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(bookmarkBloc.items[index].title),
                  subtitle: Text(bookmarkBloc.items[index].subTitle),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      bookmarkBloc.removeItem(index);
                    },
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
