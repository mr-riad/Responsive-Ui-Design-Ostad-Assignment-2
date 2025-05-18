import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final List<String> Images = [
    'assets/images/1_javascript.jpg',
    'assets/images/2_paython.jpg',
    'assets/images/3_flutter.jpg',
    'assets/images/4_php.jpg',
    'assets/images/5_asp.jpg',
    'assets/images/6_sqa.jpg',
    'assets/images/7_dev.jpg',
    'assets/images/8_coding.jpg',
  ];

  final List<Map<String, String>> middleRow = [
    {'Batch': 'ব্যাচ ১১', 'Sit': '৩ সিট বাকি', 'Remain': '১০ দিন বাকি'},

    {'Batch': 'ব্যাচ ১০', 'Sit': '৩ সিট বাকি', 'Remain': '১০ দিন বাকি'},

    {'Batch': 'ব্যাচ ১১', 'Sit': '১০ সিট বাকি', 'Remain': '১০ দিন বাকি'},

    {'Batch': 'ব্যাচ ৩', 'Sit': '৩ সিট বাকি', 'Remain': '১০ দিন বাকি'},

    {'Batch': 'ব্যাচ ১১', 'Sit': '৩ সিট বাকি', 'Remain': '৩ দিন বাকি'},

    {'Batch': 'ব্যাচ ৩', 'Sit': '৩ সিট বাকি', 'Remain': '১০ দিন বাকি'},

    {'Batch': 'ব্যাচ ৩', 'Sit': '১০ সিট বাকি', 'Remain': '৩ দিন বাকি'},

    {'Batch': 'ব্যাচ ১১', 'Sit': '৩ সিট বাকি', 'Remain': '১০ দিন বাকি'},
  ];

  final List<String> courseTitles = [
    'Full Stack Web Development with JavaScript (MERN)',
    'Full Stack Web Development with Python, Django & React',
    'App Development with Flutter',
    'Full Stack Web Development with PHP, Laravel & Vue Js',
    'Full Stack Web Development with ASP.Net Core',
    'SQA: Manual & Automated Testing',
    'Mastering DevOps: From Fundamentals to Advanced Practices',
    'Coding Interview Preparation (Local+Remote Job)',
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount;
    double childAspectRatio;

    if (screenWidth < 550) {
      crossAxisCount = 2;
      childAspectRatio = 0.65;
    } else if (screenWidth >= 550 && screenWidth < 768) {
      crossAxisCount = 2;
      childAspectRatio = 0.75;
    } else if (screenWidth >= 768 && screenWidth < 1024) {
      crossAxisCount = 3;
      childAspectRatio = 0.85;
    } else {
      crossAxisCount = 4;
      childAspectRatio = 0.9;
    }
    return SafeArea(
      child: Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: Images.length,

          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(Images[index]),
                  ),

                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (MediaQuery.of(context).size.width > 550)
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.black12,
                                ),
                                child: Text(
                                  middleRow[index]['Batch'] ?? '',
                                  style: TextStyle(fontSize: 10),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.black12,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.group, size: 10),
                                  SizedBox(width: 2),
                                  Flexible(
                                    child: Text(
                                      middleRow[index]['Sit'] ?? '',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.black12,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.access_time_rounded, size: 10),
                                  SizedBox(width: 2),
                                  Flexible(
                                    child: Text(
                                      middleRow[index]['Remain'] ?? '',
                                      style: const TextStyle(fontSize: 10),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Divider(),

                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder:
                                (context) => AlertDialog(
                                  title: Text("Course Details"),
                                  content: Text(courseTitles[index]),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("Close"),
                                    ),
                                  ],
                                ),
                          );
                        },
                        child: Text(
                          courseTitles[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white70,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Explore more",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_right_alt_sharp,
                              color: Colors.black,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
