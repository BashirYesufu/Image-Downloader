import 'package:flutter/material.dart';
import 'package:image_downloader_app/saved_images.dart';
import 'networking.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var edc = TextEditingController();
  bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF043A52),
      padding: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextField(
            // controller: edc,
            onChanged: (value) {
              setState(() {
                edc.text = value;
                print(edc.text);
              });
            },
            decoration: InputDecoration(
              hintText: 'Image URL',
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          isEmpty ? Container() : Image.network(edc.text),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SavedImages()),
                    );
                  },
                  child: Text('Save Image'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    primary: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    await Network().fetchImage(edc.text);
                    setState(() {
                      isEmpty = false;
                    });
                  },
                  child: Text('Get Image'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    primary: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
