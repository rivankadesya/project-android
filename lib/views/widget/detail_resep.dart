import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/model/resep.dart';
import 'package:project/views/widget/resep_card.dart';

class DetailResep extends StatelessWidget {
  final String name;
  final String images;
  final String totalTime;
  final String description;
  final String videoUrl;
  final List<Instruction> instructions;
  final List<Section> sections;

  DetailResep({
    required this.name,
    required this.images,
    required this.totalTime,
    required this.description,
    required this.videoUrl,
    required this.instructions,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {

    List<Component> components = List.from(sections[0].components);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.restaurant_menu,color: Colors.white,),
            Text('${name}',style: GoogleFonts.aBeeZee(color: Colors.white),)
          ],
        ),backgroundColor: Colors.brown,

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ResepCard(
                  title: name,
                  cockTime: totalTime,
                  thumbnailUrl: images,
                  videoUrl: videoUrl),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Description',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(description,
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          textAlign: TextAlign.justify),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Ingredients',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: components.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  components[index].rawText,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  textAlign: TextAlign.justify,
                                ),
                              );
                            })),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Instructions',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                            itemCount: instructions.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  instructions[index].displayText,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  textAlign: TextAlign.justify,
                                ),
                              );
                            }))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
