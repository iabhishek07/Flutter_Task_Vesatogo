import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_task/model/buyer_model.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List decodedJson = [];
  var buyerBody;
  List<dynamic> filteredDecodedJson = [];
  Buyer buyer;
  TextEditingController searchController = TextEditingController();
  var url =
      "https://firebasestorage.googleapis.com/v0/b/vesatogofleet.appspot.com/o/androidTaskApp%2FcommodityList.json?alt=media&token=9b9e5427-8769-4dec-83c4-52afe727dbf9";
  var buyerUrl =
      "https://firebasestorage.googleapis.com/v0/b/vesatogofleet.appspot.com/o/androidTaskApp%2FbuyerList.json?alt=media&token=3dcc96c2-9309-4873-868d-bf0023f6266c";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    fetchCommodity();
    fetchBuyer();
  }

  fetchCommodity() async {
    var res = await http.get(url);
    decodedJson = jsonDecode(res.body);
    return decodedJson;
  }

  fetchBuyer() async {
    var buyerRes = await http.get(buyerUrl);
    buyerBody = jsonDecode(buyerRes.body);
  }

  handleSearch(String searchElement) {
    filteredDecodedJson.clear();
    for (int index = 0; index < decodedJson.length; index++) {
      var cropData = decodedJson[index];
      if (cropData['commodityName']
          .toLowerCase()
          .contains(searchElement.toLowerCase())) {
        filteredDecodedJson.add(cropData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What is your crop?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 25.0),
                TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      handleSearch(value);
                    });
                  },
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(40.0),
                      ),
                    ),
                    hintText: "Search specific crop",
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: 20.0),
                FutureBuilder(
                  future: fetchCommodity(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    return Container(
                      height: 200.0,
                      child: searchController.text.isEmpty ||
                              filteredDecodedJson.length == 0
                          ? GridView.builder(
                              padding: EdgeInsets.all(5.0),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 2,
                              ),
                              itemCount: decodedJson.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(left: 10.0),
                                            height: 30,
                                            width: 30,
                                            child: Image.network(
                                                decodedJson[index]['photo'])),
                                        SizedBox(width: 10.0),
                                        Flexible(
                                          child: Text(
                                            decodedJson[index]['commodityName'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : GridView.builder(
                              padding: EdgeInsets.all(5.0),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 2,
                              ),
                              itemCount: filteredDecodedJson.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(left: 10.0),
                                            height: 30,
                                            width: 30,
                                            child: Image.network(
                                                filteredDecodedJson[index]
                                                    ['photo'])),
                                        SizedBox(width: 10.0),
                                        Flexible(
                                          child: Text(
                                            filteredDecodedJson[index]
                                                ['commodityName'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                    );
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Buyer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                FutureBuilder(
                  future: fetchBuyer(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    return BuyerContainer(buyerBody: buyerBody);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuyerContainer extends StatelessWidget {
  const BuyerContainer({
    Key key,
    @required this.buyerBody,
  }) : super(key: key);

  final buyerBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      padding: const EdgeInsets.only(left: 5.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: buyerBody.length,
          itemBuilder: (context, index) {
            return Container(
              width: 300,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      child: Image.network(
                        buyerBody[index]['photo'],
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              child: Image.network(
                                buyerBody[index]['cropInfo']['photo'],
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              buyerBody[index]['cropInfo']['crop'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Text(
                          buyerBody[index]['buyerName'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 60,
                              color: Colors.grey[300],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    buyerBody[index]['price'][0]['date'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Text(
                                        '₹${buyerBody[index]['price'][0]['price']}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        buyerBody[index]['price'][1]['sku'],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Container(
                              height: 40,
                              width: 60,
                              color: Colors.grey[300],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    buyerBody[index]['price'][1]['date'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Text(
                                        '₹${buyerBody[index]['price'][1]['price']}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        buyerBody[index]['price'][1]['sku'],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Container(
                              height: 40,
                              width: 60,
                              color: Colors.grey[300],
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    buyerBody[index]['price'][2]['date'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    children: [
                                      Text(
                                        '₹${buyerBody[index]['price'][2]['price']}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        buyerBody[index]['price'][1]['sku'],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
