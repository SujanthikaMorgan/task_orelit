import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controller/newsprovider.dart';
import '../model/bottombarmodel.dart';


class NewsScreen extends StatefulWidget {
  final int index;
  final String category;

  const NewsScreen({Key? key, required this.index, required this.category}): super(key:key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Consumer<BottomNavBarModel>(
        builder: (context, bottomNavBarModel, _) {
          if (bottomNavBarModel.currentIndex == widget.index) {
            return Consumer<NewsProvider>(
                builder: (context, newsProvider, _) {
                  return Scaffold(
                    body: FutureBuilder(
                        future: newsProvider.fetchNewsData(widget.category),
                        builder: (context,snapshot){
                          if (snapshot.hasData){
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.category.toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text('Here is your ${widget.category} news',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),),
                                  Expanded(
                                    child: ListView.builder(
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Center(
                                              child: ListTile(
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(width: 2,color: AppColors.primaryColor),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                leading: CircleAvatar(
                                                  radius: 30.0,
                                                  backgroundImage:
                                                  NetworkImage("${snapshot.data![index].imageUrl}"),
                                                  backgroundColor: Colors.transparent,
                                                ),
                                                title: Text(snapshot.data![index].title,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                  ),),
                                                subtitle: Row(
                                                  children: [
                                                    Icon(Icons.access_time,size: 15),
                                                    Text(' author - '),
                                                    Text(snapshot.data![index].author),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }else{
                            return Center(child: CircularProgressIndicator());
                          }


                        }
                    ),
                  );
                }
            );
          }
          else {
            return SizedBox.shrink();
          }
        }
    );
  }
}

