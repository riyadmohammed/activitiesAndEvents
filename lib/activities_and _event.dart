import 'package:activities_and_events/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivitiesAndEvent extends StatefulWidget {
  const ActivitiesAndEvent({super.key});

  @override
  State<ActivitiesAndEvent> createState() => _ActivitiesAndEventState();
}

class _ActivitiesAndEventState extends State<ActivitiesAndEvent> {
  final List<Map<String, dynamic>> _allUsers = [
    {
      "image":
          "https://assets.nst.com.my/images/articles/agmo_1660701318.jpg",
      "id": 1,
      "name": "In-reach Programe",
      "date": "Tue,21 Feb 2023, 1:00 PM",
      "des": "Si kijang Money Box ",
      "address": "Sasana Lijang, Banke Negara Malaysia ",
      "status": "Unlimited Slots",
    },
    {
      "id": 2,
      "name": "In-reach Programe",
      "date": "Tue,21 Feb 2023, 1:00 PM",
      "des": "Talk: 'Get To Know Your Banknotes ",
      "address": "Sasana Lijang, Banke Negara Malaysia ",
      "status": "Unlimited Slots",
      "image":
          "https://apicms.thestar.com.my/uploads/images/2022/08/01/1680280.jpg",
    },
    {
      "id": 3,
      "name": "In-reach Programe",
      "date": "Tue,21 Feb 2023, 1:00 PM",
      "des": "Talk: How old is the Ringgit?",
      "address": "Sasana Lijang, Banke Negara Malaysia ",
      "status": "Unlimited Slots",
      "image":
          "https://apicms.thestar.com.my/uploads/images/2023/07/03/2158079.jpg",
    },
    {
      "id": 4,
      "name": "In-reach Programe",
      "date": "Tue,21 Feb 2023, 1:00 PM",
      "des": "Talk: Bank Negara Malaysia - what do we do? ",
      "address": "Sasana Lijang, Banke Negara Malaysia ",
      "status": "Unlimited Slots",
      "image":
          "https://apicms.thestar.com.my/uploads/images/2023/03/29/1999079.JPG",
    },
    {
      "id": 5,
      "name": "In-reach Programe",
      "date": "Tue,21 Feb 2023, 1:00 PM",
      "des": "Talk: Bank Negara Malaysia  ",
      "address": "Sasana Lijang, Banke Negara Malaysia ",
      "status": "Unlimited Slots",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LmG47_W3RM0QBVGI23-vodL_oOOJxLIBrg&usqp=CAU",
    },
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["des"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.bgBlue,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 80,
          backgroundColor: AppColors.bgOrange,
          title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Activities & Events',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                ),
              )),
          leading: IconButton(
              onPressed: () {
                // Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ), //
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.bgOrange,
              ),
              height: 120.h,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  onChanged: (value) => _runFilter(value),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),),
                    filled: true,
                    fillColor: Colors.white,
                    // border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10),
                    hintText: "Search activities & Events",
                    hintStyle:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                height: 80.h,
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/element_curve_blue.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 69.h),
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 1,
                          margin: EdgeInsets.symmetric(
                              vertical: 7, horizontal: 14.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        height: 68.h,
                                        width: 70.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadiusDirectional
                                                  .circular(8),
                                          color: AppColors.bgOrange,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "${_foundUsers[index]['image']}"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(5),
                                                color: const Color.fromARGB(255, 212, 88, 234),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 7),
                                                  child: Text(
                                                      _foundUsers[index]
                                                          ['name'],
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12.sp,
                                                          fontWeight: FontWeight.w700)),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 7.h),
                                            Text(
                                              _foundUsers[index]['date'],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10.sp),
                                            ),
                                            SizedBox(height: 7.h),
                                            SizedBox(
                                              width: 213.w,
                                              child: Text(
                                                _foundUsers[index]['des'],
                                                softWrap: true,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                            SizedBox(height: 7.h),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Colors.grey,
                                                  size: 16.h,
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                    _foundUsers[index]
                                                        ['address'],
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                SizedBox(height: 5.h),
                                              ],
                                            ),
                                            SizedBox(height: 7.h),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  color: Colors.grey,
                                                  size: 12.h,
                                                ),
                                                const SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                    _foundUsers[index]
                                                        ['status'],
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10.sp,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ],
                                            ),
                                            SizedBox(height: 7.h),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ])
                            ],
                          )))
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 80.h, horizontal: 13),
                      child: Text(
                        'No results found Please try with diffrent search',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
            ),
          ],
        ));
  }
}
