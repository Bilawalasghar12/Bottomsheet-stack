import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model class.dart';

class Bottomsheet extends StatefulWidget {
  const Bottomsheet({Key? key}) : super(key: key);

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  late Photos photosinfo;

  @override
  void initstate() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <Photos>(
        future: getData(),
        builder: (context, AsyncSnapshot <Photos> snapshot) {
          if(snapshot.hasData){



            return Container(
              height: MediaQuery.of(context).size.height / 1.4,
              child: Stack(children: [
                columnwidget(snapshot),
                imagewidget(),
              ]),
            );  }

          else {

            return const Center(
            child: CircularProgressIndicator(),

            );
          }

        });
  }

  imagewidget() {
    return Positioned(
      top: 60,
      left: 20,
      child: Image.asset(
        'assets/assets.png',
        height: 80,
        width: 80,
      ),
    );
  }

  columnwidget(AsyncSnapshot <Photos> snapshot) {
    return Column(
      // shrinkWrap: true,
      children: [
        Container(height: 100, width: 500, color: Colors.green),
        Expanded(
          child: Container(
            // height: 700,
            width: 500,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data!.data!.name ?? "",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data!.data!.description?? "",

                      style: TextStyle(fontSize: 16),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('How it works',
                                      style: TextStyle(fontSize: 16)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    snapshot.data!.data!.howItWork??"",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.account_box,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'length : 5 days',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.question_mark,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Questions: 15',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.query_builder,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        'Time limit : answer questions within the day',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Notes :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        'you must answer the questions within the time',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'limit to earn this badge',
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star_border_sharp,
                          size: 17,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Employers will be able to see this skills badge on\n your profile once you earn it ',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30)),
                        width: 270,
                        height: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('START CHALLENGE',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future <Photos> getData() async {
    Map<String, String> headers = {
      "Authorization": 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3N0YWdpbmcuZ2V0LWxpY2Vuc2VkLmNvLnVrL2d1YXJkcGFzcy9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTY3MzUxMzI2MCwibmJmIjoxNjczNTEzMjYwLCJqdGkiOiJZMmF6TFpIUUZ1aTZRdnczIiwic3ViIjoiNTkzNTQiLCJwcnYiOiIyZTE2YThmMGRmMzcxNTZkNTkxMzJjZDk5NGEzMjY1OTdhNWMzZDViIiwiaWQiOjU5MzU0LCJ0eXBlIjoiSk9CU0VFS0VSIn0.rW7KB82QrX678M7TgfeuyB9mBvT2PNftBfwS0UQGhn0',
      "Accept": "application/json"
    };
    final response = await http.get(Uri.parse(
        'https://staging.get-licensed.co.uk/guardpass/api/skill/detail/1'), headers: headers);
    var data = jsonDecode(response.body.toString());
    print(response);
    return Photos.fromMap(data);




    }
  }

