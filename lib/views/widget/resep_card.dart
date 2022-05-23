import 'package:flutter/material.dart';
import 'package:project/model/resep.dart';

import '../detail_video.dart';

class ResepCard extends StatelessWidget {
  final String title;
  final String rating;
  final String cockTime;
  final String thumbnailUrl;
  final String videoUrl;

  const ResepCard(
      {required this.title,
      required this.rating,
      required this.cockTime,
      required this.thumbnailUrl,
      required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.7),
                offset: Offset(0.0, 10.0),
                blurRadius: 10.0,
                spreadRadius: -6.0),
          ],
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35), BlendMode.multiply),
              image: NetworkImage(thumbnailUrl),
              fit: BoxFit.cover)),
      child: Stack( //fungsi stack untuk menumpuk
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 19,color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: videoUrl != 'noVideo' ? true : false,
                  child: Container( //container untuk rating
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      onTap: () => {

                        Navigator.push(context, MaterialPageRoute(builder:
                        (context) => DetailVideo(videoUrl: videoUrl,)))

                      }, // untuk play video dengan inkWell
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_circle_fill_rounded,
                            color: Colors.yellow,
                            size: 18,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                              'play video',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container( //container untuk durasi masak
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(

                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                          cockTime,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          )
        ],
      ),
    );
  }
}
