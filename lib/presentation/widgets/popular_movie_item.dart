import 'package:flutter/material.dart';
import 'package:movies_flutter/constants/colors.dart';
import 'package:movies_flutter/constants/strings.dart';
import 'package:movies_flutter/data/model/PopularMovies.dart';

class PopularMovieItem extends StatelessWidget {
  final Results result;
  const PopularMovieItem({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/loading.gif',
                        image: baseImageUrl + result.posterPath.toString())),
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsetsDirectional.only(start: 10),

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 15),
                      child: Text(
                        result.title.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: MyColors.myRed),
                      ),
                    ),
                    Text(result.overview.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(Icons.language, size: 15, color: MyColors.myRed,),
                                ),
                                Text(result.originalLanguage.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(start: 10),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(Icons.star, size: 15, color: MyColors.myRed,),
                                ),
                                Text(result.voteAverage!.round().toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(start: 10),
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Icon(Icons.date_range, size: 15,color: MyColors.myRed,),
                                ),
                                Text(result.releaseDate.toString(), style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
