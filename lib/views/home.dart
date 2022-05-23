import 'package:flutter/material.dart';
import 'package:project/model/resep.api.dart';
import 'package:project/views/widget/resep_card.dart';
import 'package:project/model/resep.dart';
import 'package:project/views/widget/detail_resep.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Resep> _resep;
  bool _isLoading = true;
  late SharedPreferences logindata;
  late String username;

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  void initState() {
    super.initState();
    getResep();
    initial();
  }

  Future<void> getResep() async {
    _resep = await ResepApi.getResep();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(
                width: 10,
              ),
              Text('Resep Makanan')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _resep.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: ResepCard(
                        title: _resep[index].name,
                        rating: _resep[index].rating.toString(),
                        cockTime: _resep[index].totalTime,
                        thumbnailUrl: _resep[index].images,
                        videoUrl: _resep[index].videoUrl),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailResep(
                            name: _resep[index].name,
                            totalTime: _resep[index].totalTime.toString(),
                            images: _resep[index].images,
                            rating: _resep[index].rating,
                            description: _resep[index].description,
                            videoUrl: _resep[index].videoUrl,
                            instructions: _resep[index].instructions,
                            sections: _resep[index].sections,
                          ),
                        ),
                      )
                    },
                  );
                }));
  }
}
