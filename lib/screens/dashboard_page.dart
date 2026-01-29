import 'package:flutter/material.dart';
import 'package:helpdesk_app/screens/ListOption.dart';
import 'package:helpdesk_app/screens/Login/login_page.dart';
import 'package:helpdesk_app/screens/PM/PMPage.dart';
import 'package:helpdesk_app/screens/Complaint/complaints.dart';
import 'qr_scanner_page.dart';
import 'Operation/operation.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final spacing = size.height * 0.02;
    final avatarRadius = size.width * 0.08;
    final shiftRadius = size.width * 0.065;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // ---------------- HEADER ----------------
          Container(
            constraints: BoxConstraints(minHeight: size.height * 0.25),
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              size.width * 0.05,
              0, // Biarkan SafeArea urus padding atas
              size.width * 0.05,
              size.width * 0.04,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00AEEF), Color(0xFF0089BB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: (size.width * 0.07).clamp(24.0, 32.0),
                      ),
                      onPressed: () => _logout(context),
                    ),
                  ),
                  Text(
                    'HelpDesk',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: spacing),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: avatarRadius,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          size: avatarRadius,
                        ),
                      ),
                      SizedBox(width: size.width * 0.03),
                      Text(
                        'Hi Syana, today you check in at \n11:49:25 AM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.035,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: spacing),
                  Text(
                    'Thursday, 15 Jan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.05,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ---------------- MAIN CONTENT ----------------
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: spacing),
              child: Column(
                children: [
                  // FLOATING CARD (warna sama macam OperationPage)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(size.width * 0.04),
                      decoration: BoxDecoration(
                        color: Colors.white, // Sama macam OperationPage
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Text(
                        'You finished 0 job today. \nWork Harder!!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: size.width * 0.055,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: spacing),

                  // TASK SECTION
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(size.width * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.white, // Sama macam OperationPage
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'TASK',
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: spacing * 0.5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: _taskItem(
                                  Icons.report,
                                  'Complaints',
                                  2,
                                  Colors.red,
                                  avatarRadius,
                                  () {
                                    // Mesti ada Navigator.push di sini
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ComplaintsPage(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: _taskItem(
                                  Icons.business_center,
                                  'Operation',
                                  0,
                                  Colors.blue,
                                  avatarRadius,
                                  () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const OperationPage(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: _taskItem(
                                  Icons.settings,
                                  'PM',
                                  6,
                                  Colors.green,
                                  avatarRadius,
                                  () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const PMPage(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: spacing),

                  // SHIFT SCHEDULE
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(size.width * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.white, // Sama macam OperationPage
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.center, // center text
                        children: [
                          Text(
                            'SHIFT SCHEDULE',
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: spacing * 0.5),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _shiftCard(
                                  '14 Jan',
                                  [
                                    {'name': 'Morning', 'color': Colors.red},
                                    {
                                      'name': 'Afternoon',
                                      'color': Colors.green,
                                    },
                                    {'name': 'Night', 'color': Colors.purple},
                                  ],
                                  shiftRadius,
                                  size,
                                ),
                                const SizedBox(width: 12),
                                _shiftCard(
                                  '15 Jan',
                                  [
                                    {'name': 'Morning', 'color': Colors.red},
                                    {
                                      'name': 'Afternoon',
                                      'color': Colors.green,
                                    },
                                    {'name': 'Night', 'color': Colors.purple},
                                  ],
                                  shiftRadius,
                                  size,
                                ),
                                const SizedBox(width: 12),
                                _shiftCard(
                                  '16 Jan',
                                  [
                                    {
                                      'name': 'Afternoon',
                                      'color': Colors.green,
                                    },
                                  ],
                                  shiftRadius,
                                  size,
                                ),
                                const SizedBox(width: 12),
                                _shiftCard(
                                  '17 Jan',
                                  [
                                    {'name': 'Evening', 'color': Colors.orange},
                                  ],
                                  shiftRadius,
                                  size,
                                ),
                                const SizedBox(width: 12),
                                _shiftCard(
                                  '18 Jan',
                                  [
                                    {'name': 'Night', 'color': Colors.purple},
                                  ],
                                  shiftRadius,
                                  size,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: spacing * 2),
                ],
              ),
            ),
          ),
          // ---------------- BOTTOM NAV ----------------
          Container(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.015),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  context,
                  Icons.home_outlined,
                  "Home",
                  //false,
                  //size,
                ),
                _buildQRItem(context),
                _buildNavItem(
                  context,
                  Icons.list_alt_rounded,
                  "Options",
                  //false,
                  //size,
                  destination: const ListOptionsPage(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- REUSABLE WIDGETS ---

  Widget _buildSectionContainer(Size size, String title, Widget content) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(size.width * 0.05),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: size.width * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            content,
          ],
        ),
      ),
    );
  }

  Widget _taskItem(
    IconData icon,
    String title,
    int badge,
    Color color,
    double radius,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: radius,
                  backgroundColor: color,
                  child: Icon(icon, color: Colors.white, size: radius),
                ),
              ),
              if (badge > 0)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: Text(
                      '$badge',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: radius * 0.4,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _shiftCard(
    String date,
    List<Map<String, dynamic>> shifts,
    double radius,
    Size size,
  ) {
    const double fixedHeight = 175.0;

    return Container(
      width: (size.width * 0.4),
      height: fixedHeight, // <--- Kunci tinggi di sini
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            date,
            style: TextStyle(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: shifts.map((shift) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: ShapeDecoration(
                      color: shift['color'],
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      shift['name'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- NAV ITEM RESPONSIVE ----------------
  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String label, {
    Widget? destination,
  }) {
    return InkWell(
      onTap: () {
        if (destination != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28, color: Colors.grey),
          Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildQRItem(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QRScannerPage()),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
      ),
    );
  }
}

// --- FUNGSI LOGOUT ---
void _logout(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // Tutup dialog jika 'No'
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () {
            // 1. Tutup dialog dulu
            Navigator.pop(context);

            // 2. TERUS KE PAGE LOGIN (Ganti 'LoginPage' dengan nama class login anda)
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ), // <--- TUKAR SINI
              (route) =>
                  false, // Ini akan buang semua rekod page lama (clear stack)
            );
          },
          child: const Text('Yes', style: TextStyle(color: Colors.red)),
        ),
      ],
    ),
  );
}
