// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:animated_theme_switcher/animated_theme_switcher.dart';
// // import 'package:flutter_svg/flutter_svg.dart';

// // final isDarkModeProvider = StateProvider<bool>((ref) => false);

// // class ProfileScreen extends ConsumerWidget {
// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final isDarkMode = ref.watch(isDarkModeProvider);

// //     return Theme(
// //       data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
// //       child: Scaffold(
// //         body: CustomScrollView(
// //           slivers: [
// //             SliverAppBar(
// //               expandedHeight: 200.0,
// //               floating: false,
// //               pinned: true,
// //               flexibleSpace: FlexibleSpaceBar(
// //                 title: Text('John Doe'),
// //                 background: Stack(
// //                   fit: StackFit.expand,
// //                   children: [
// //                     Image.asset(
// //                       'assets/images/profile_background.jpg',
// //                       fit: BoxFit.cover,
// //                     ),
// //                     Container(
// //                       decoration: BoxDecoration(
// //                         gradient: LinearGradient(
// //                           begin: Alignment.topCenter,
// //                           end: Alignment.bottomCenter,
// //                           colors: [
// //                             Colors.transparent,
// //                             Colors.black.withOpacity(0.7),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               actions: [
// //                 IconButton(
// //                   icon: Icon(
// //                       isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
// //                   onPressed: () {
// //                     ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
// //                   },
// //                 ),
// //               ],
// //             ),
// //             SliverToBoxAdapter(
// //               child: Padding(
// //                 padding: EdgeInsets.all(16.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     ProfileInfoCard(),
// //                     SizedBox(height: 24),
// //                     Text(
// //                       'Travel Stats',
// //                       style: Theme.of(context).textTheme.titleLarge,
// //                     ),
// //                     SizedBox(height: 16),
// //                     TravelStatsGrid(),
// //                     SizedBox(height: 24),
// //                     Text(
// //                       'Recent Activities',
// //                       style: Theme.of(context).textTheme.titleLarge,
// //                     ),
// //                     SizedBox(height: 16),
// //                     RecentActivitiesList(),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class ProfileInfoCard extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 4,
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //       child: Padding(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           children: [
// //             const CircleAvatar(
// //               radius: 50,
// //               backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
// //             ),
// //             const SizedBox(height: 16),
// //             Text(
// //               'John Doe',
// //               style: Theme.of(context).textTheme.headlineSmall,
// //             ),
// //             const SizedBox(height: 8),
// //             Text(
// //               'Adventure Enthusiast | 42 Countries Visited',
// //               style: Theme.of(context).textTheme.titleMedium,
// //               textAlign: TextAlign.center,
// //             ),
// //             const SizedBox(height: 16),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 _buildSocialButton('assets/icons/facebook.svg'),
// //                 _buildSocialButton('assets/icons/twitter.svg'),
// //                 _buildSocialButton('assets/icons/instagram.svg'),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildSocialButton(String assetName) {
// //     return InkWell(
// //       onTap: () {
// //         // TODO: Implement social media link
// //       },
// //       child: SvgPicture.asset(
// //         assetName,
// //         height: 24,
// //         width: 24,
// //       ),
// //     );
// //   }
// // }

// // class TravelStatsGrid extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return GridView.count(
// //       crossAxisCount: 2,
// //       crossAxisSpacing: 16,
// //       mainAxisSpacing: 16,
// //       shrinkWrap: true,
// //       physics: const NeverScrollableScrollPhysics(),
// //       children: [
// //         _buildStatCard(context, '42', 'Countries'),
// //         _buildStatCard(context, '137', 'Cities'),
// //         _buildStatCard(context, '253', 'Places'),
// //         _buildStatCard(context, '12', 'UNESCO Sites'),
// //       ],
// //     );
// //   }

// //   Widget _buildStatCard(BuildContext context, String value, String label) {
// //     return Card(
// //       elevation: 2,
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //       child: Padding(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               value,
// //               style: Theme.of(context).textTheme.headlineMedium?.copyWith(
// //                     color: Theme.of(context).primaryColor,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //             ),
// //             const SizedBox(height: 8),
// //             Text(
// //               label,
// //               style: Theme.of(context).textTheme.titleMedium,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class RecentActivitiesList extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       shrinkWrap: true,
// //       physics: const NeverScrollableScrollPhysics(),
// //       itemCount: 5,
// //       itemBuilder: (context, index) {
// //         return Card(
// //           elevation: 2,
// //           margin: const EdgeInsets.only(bottom: 16),
// //           shape:
// //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //           child: ListTile(
// //             leading: CircleAvatar(
// //               backgroundImage:
// //                   AssetImage('assets/images/activity_${index + 1}.jpg'),
// //             ),
// //             title: Text('Activity ${index + 1}'),
// //             subtitle: const Text('2 days ago'),
// //             trailing: const Icon(Icons.chevron_right),
// //             onTap: () {
// //               // TODO: Navigate to activity details
// //             },
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // class ParallaxFlexibleSpaceBar extends StatelessWidget {
// //   final String title;
// //   final String backgroundImageAsset;

// //   const ParallaxFlexibleSpaceBar({
// //     Key? key,
// //     required this.title,
// //     required this.backgroundImageAsset,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return LayoutBuilder(
// //       builder: (context, constraints) {
// //         final double percentage =
// //             (constraints.maxHeight - kToolbarHeight) / (200.0 - kToolbarHeight);
// //         final double parallax = 30 * (1 - percentage);

// //         return FlexibleSpaceBar(
// //           title: Text(title),
// //           background: Stack(
// //             fit: StackFit.expand,
// //             children: [
// //               Positioned.fill(
// //                 bottom: -parallax,
// //                 child: Image.asset(
// //                   backgroundImageAsset,
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //               Container(
// //                 decoration: BoxDecoration(
// //                   gradient: LinearGradient(
// //                     begin: Alignment.topCenter,
// //                     end: Alignment.bottomCenter,
// //                     colors: [
// //                       Colors.transparent,
// //                       Colors.black.withOpacity(0.7),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// final isDarkModeProvider = StateProvider<bool>((ref) => false);

// class ProfileScreen extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isDarkMode = ref.watch(isDarkModeProvider);

//     return Theme(
//       data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
//       child: Scaffold(
//         body: Stack(
//           children: [
//             _buildGradientBackground(),
//             CustomScrollView(
//               slivers: [
//                 _buildAppBar(isDarkMode, ref),
//                 SliverToBoxAdapter(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 20),
//                         _buildProfileHeader(),
//                         SizedBox(height: 30),
//                         _buildTravelMap(),
//                         SizedBox(height: 30),
//                         _buildTravelStats(),
//                         SizedBox(height: 30),
//                         _buildRecentTrips(),
//                         SizedBox(height: 30),
//                         _buildAchievements(),
//                         SizedBox(height: 50),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         floatingActionButton: _buildFloatingActionButton(context),
//       ),
//     );
//   }

//   Widget _buildGradientBackground() {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Colors.blue.shade100,
//             Colors.blue.shade50,
//             Colors.white,
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildAppBar(bool isDarkMode, WidgetRef ref) {
//     return SliverAppBar(
//       expandedHeight: 200.0,
//       floating: false,
//       pinned: true,
//       backgroundColor: Colors.transparent,
//       flexibleSpace: FlexibleSpaceBar(
//         title: Text('Wanderlust Profile',
//             style: GoogleFonts.poppins(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w600,
//                 shadows: [Shadow(color: Colors.black54, blurRadius: 2)])),
//         background: ShaderMask(
//           shaderCallback: (rect) {
//             return LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
//             ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
//           },
//           blendMode: BlendMode.darken,
//           child: Image.asset(
//             'assets/images/profile_background.jpg',
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
//           onPressed: () =>
//               ref.read(isDarkModeProvider.notifier).state = !isDarkMode,
//         ),
//       ],
//     );
//   }

//   Widget _buildProfileHeader() {
//     return Row(
//       children: [
//         CircleAvatar(
//           radius: 50,
//           backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
//         ),
//         SizedBox(width: 20),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('John Doe',
//                   style: GoogleFonts.poppins(
//                       fontSize: 24, fontWeight: FontWeight.bold)),
//               Text('Adventurer Extraordinaire',
//                   style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey)),
//               SizedBox(height: 10),
//               Row(
//                 children: [
//                   Icon(Icons.location_on, size: 16, color: Colors.red),
//                   SizedBox(width: 5),
//                   Text('42 Countries Explored',
//                       style: GoogleFonts.poppins(fontSize: 14)),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTravelMap() {
//     return Container(
//       height: 200,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         image: DecorationImage(
//           image: AssetImage('assets/images/world_map.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Stack(
//         children: [
//           // Add static markers for visited countries
//           for (var i = 0; i < 10; i++)
//             Positioned(
//               left: 20.0 * i,
//               top: 30.0 * (i % 5),
//               child: Icon(Icons.place, color: Colors.red, size: 20),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTravelStats() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Travel Stats',
//             style:
//                 GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
//         SizedBox(height: 15),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _buildStatItem('Countries', '42', Icons.public),
//             _buildStatItem('Cities', '137', Icons.location_city),
//             _buildStatItem('Photos', '2.5K', Icons.photo_camera),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildStatItem(String label, String value, IconData icon) {
//     return Column(
//       children: [
//         Icon(icon, size: 30, color: Colors.blue),
//         SizedBox(height: 5),
//         Text(value,
//             style:
//                 GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
//         Text(label, style: GoogleFonts.poppins(fontSize: 14)),
//       ],
//     );
//   }

//   Widget _buildRecentTrips() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Recent Adventures',
//             style:
//                 GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
//         SizedBox(height: 15),
//         Container(
//           height: 200,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               return Container(
//                 width: 150,
//                 margin: EdgeInsets.only(right: 15),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/trip_${index + 1}.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Colors.transparent,
//                         Colors.black.withOpacity(0.7)
//                       ],
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.all(10),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Trip ${index + 1}',
//                             style: GoogleFonts.poppins(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold)),
//                         Text('Location',
//                             style: GoogleFonts.poppins(color: Colors.white70)),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildAchievements() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Achievements',
//             style:
//                 GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
//         SizedBox(height: 15),
//         Wrap(
//           spacing: 10,
//           runSpacing: 10,
//           children: [
//             _buildAchievementBadge('Globe Trotter', 'assets/icons/globe.svg'),
//             _buildAchievementBadge(
//                 'Mountain Climber', 'assets/icons/mountain.svg'),
//             _buildAchievementBadge('Beach Bum', 'assets/icons/beach.svg'),
//             _buildAchievementBadge(
//                 'Culture Vulture', 'assets/icons/culture.svg'),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildAchievementBadge(String title, String iconPath) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//         color: Colors.blue.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SvgPicture.asset(iconPath, height: 20, width: 20),
//           SizedBox(width: 5),
//           Text(title, style: GoogleFonts.poppins(fontSize: 12)),
//         ],
//       ),
//     );
//   }

//   Widget _buildFloatingActionButton(BuildContext context) {
//     return FloatingActionButton.extended(
//       onPressed: () {
//         // TODO: Implement new trip functionality
//       },
//       icon: Icon(Icons.add),
//       label: Text('New Adventure'),
//       backgroundColor: Colors.blue,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

class ProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final subTextColor = isDarkMode ? Colors.white70 : Colors.black54;

    return Theme(
      data: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        body: Stack(
          children: [
            _buildGradientBackground(isDarkMode),
            CustomScrollView(
              slivers: [
                _buildAppBar(isDarkMode, ref),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        _buildProfileHeader(textColor, subTextColor),
                        SizedBox(height: 30),
                        _buildTravelMap(),
                        SizedBox(height: 30),
                        _buildTravelStats(textColor, subTextColor),
                        SizedBox(height: 30),
                        _buildRecentTrips(textColor, subTextColor),
                        SizedBox(height: 30),
                        _buildAchievements(textColor, subTextColor),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: _buildFloatingActionButton(context),
      ),
    );
  }

  Widget _buildGradientBackground(bool isDarkMode) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDarkMode
              ? [Colors.grey[900]!, Colors.grey[800]!, Colors.grey[700]!]
              : [Colors.blue.shade100, Colors.blue.shade50, Colors.white],
        ),
      ),
    );
  }

  Widget _buildAppBar(bool isDarkMode, WidgetRef ref) {
    return SliverAppBar(
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Wanderlust Profile',
            style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                shadows: [Shadow(color: Colors.black54, blurRadius: 2)])),
        background: ShaderMask(
          shaderCallback: (rect) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
          },
          blendMode: BlendMode.darken,
          child: Image.asset(
            'assets/images/profile_background.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
              color: Colors.white),
          onPressed: () =>
              ref.read(isDarkModeProvider.notifier).state = !isDarkMode,
        ),
      ],
    );
  }

  Widget _buildProfileHeader(Color textColor, Color subTextColor) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('John Doe',
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor)),
              Text('Adventurer Extraordinaire',
                  style:
                      GoogleFonts.poppins(fontSize: 16, color: subTextColor)),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.red),
                  SizedBox(width: 5),
                  Text('42 Countries Explored',
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: subTextColor)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTravelMap() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage('assets/images/world_map.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          for (var i = 0; i < 10; i++)
            Positioned(
              left: 20.0 * i,
              top: 30.0 * (i % 5),
              child: Icon(Icons.place, color: Colors.red, size: 20),
            ),
        ],
      ),
    );
  }

  Widget _buildTravelStats(Color textColor, Color subTextColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Travel Stats',
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem(
                'Countries', '42', Icons.public, textColor, subTextColor),
            _buildStatItem(
                'Cities', '137', Icons.location_city, textColor, subTextColor),
            _buildStatItem(
                'Photos', '2.5K', Icons.photo_camera, textColor, subTextColor),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon,
      Color textColor, Color subTextColor) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.blue),
        SizedBox(height: 5),
        Text(value,
            style: GoogleFonts.poppins(
                fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
        Text(label,
            style: GoogleFonts.poppins(fontSize: 14, color: subTextColor)),
      ],
    );
  }

  Widget _buildRecentTrips(Color textColor, Color subTextColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Adventures',
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
        SizedBox(height: 15),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/images/trip_${index + 1}.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7)
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Trip ${index + 1}',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('Location',
                            style: GoogleFonts.poppins(color: Colors.white70)),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAchievements(Color textColor, Color subTextColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Achievements',
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
        SizedBox(height: 15),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _buildAchievementBadge(
                'Globe Trotter', 'assets/icons/globe.svg', textColor),
            _buildAchievementBadge(
                'Mountain Climber', 'assets/icons/mountain.svg', textColor),
            _buildAchievementBadge(
                'Beach Bum', 'assets/icons/beach.svg', textColor),
            _buildAchievementBadge(
                'Culture Vulture', 'assets/icons/culture.svg', textColor),
          ],
        ),
      ],
    );
  }

  Widget _buildAchievementBadge(
      String title, String iconPath, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(iconPath, height: 20, width: 20, color: textColor),
          SizedBox(width: 5),
          Text(title,
              style: GoogleFonts.poppins(fontSize: 12, color: textColor)),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        // TODO: Implement new trip functionality
      },
      icon: Icon(Icons.add),
      label: Text('New Adventure'),
      backgroundColor: Colors.blue,
    );
  }
}
