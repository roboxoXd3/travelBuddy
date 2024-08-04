// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// class TripsScreen extends StatefulWidget {
//   const TripsScreen({Key? key}) : super(key: key);

//   @override
//   _TripsScreenState createState() => _TripsScreenState();
// }

// class _TripsScreenState extends State<TripsScreen>
//     with TickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 200.0,
//             floating: false,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: const Text(
//                 'My Trips',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//               background: Image.asset(
//                 'assets/images/travel_background.jpg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SliverPersistentHeader(
//             delegate: _SliverAppBarDelegate(
//               TabBar(
//                 controller: _tabController,
//                 tabs: [
//                   Tab(text: 'Upcoming'),
//                   Tab(text: 'Past'),
//                 ],
//               ),
//             ),
//             pinned: true,
//           ),
//           SliverFillRemaining(
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 UpcomingTripsTab(),
//                 PastTripsTab(),
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // TODO: Implement add new trip functionality
//         },
//         child: Icon(Icons.add),
//         tooltip: 'Add new trip',
//       ),
//     );
//   }
// }

// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate(this._tabBar);

//   final TabBar _tabBar;

//   @override
//   double get minExtent => _tabBar.preferredSize.height;
//   @override
//   double get maxExtent => _tabBar.preferredSize.height;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Theme.of(context).scaffoldBackgroundColor,
//       child: _tabBar,
//     );
//   }

//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return false;
//   }
// }

// class UpcomingTripsTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AnimationLimiter(
//       child: ListView.builder(
//         itemCount: 10, // Replace with actual number of upcoming trips
//         itemBuilder: (BuildContext context, int index) {
//           return AnimationConfiguration.staggeredList(
//             position: index,
//             duration: const Duration(milliseconds: 375),
//             child: SlideAnimation(
//               verticalOffset: 50.0,
//               child: FadeInAnimation(
//                 child: TripCard(
//                   destination: 'Paris, France',
//                   startDate:
//                       DateTime.now().add(Duration(days: 30 + index * 10)),
//                   endDate: DateTime.now().add(Duration(days: 37 + index * 10)),
//                   imageUrl: 'assets/images/paris.jpg',
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class PastTripsTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AnimationLimiter(
//       child: ListView.builder(
//         itemCount: 10, // Replace with actual number of past trips
//         itemBuilder: (BuildContext context, int index) {
//           return AnimationConfiguration.staggeredList(
//             position: index,
//             duration: const Duration(milliseconds: 375),
//             child: SlideAnimation(
//               verticalOffset: 50.0,
//               child: FadeInAnimation(
//                 child: TripCard(
//                   destination: 'Tokyo, Japan',
//                   startDate:
//                       DateTime.now().subtract(Duration(days: 100 - index * 10)),
//                   endDate:
//                       DateTime.now().subtract(Duration(days: 93 - index * 10)),
//                   imageUrl: 'assets/images/tokyo.jpg',
//                   isPast: true,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class TripCard extends StatelessWidget {
//   final String destination;
//   final DateTime startDate;
//   final DateTime endDate;
//   final String imageUrl;
//   final bool isPast;

//   const TripCard({
//     Key? key,
//     required this.destination,
//     required this.startDate,
//     required this.endDate,
//     required this.imageUrl,
//     this.isPast = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//             child: Image.asset(
//               imageUrl,
//               height: 150,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   destination,
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   '${_formatDate(startDate)} - ${_formatDate(endDate)}',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     OutlinedButton(
//                       onPressed: () {
//                         // TODO: Implement view details functionality
//                       },
//                       child: Text('View Details'),
//                     ),
//                     if (!isPast)
//                       ElevatedButton(
//                         onPressed: () {
//                           // TODO: Implement edit trip functionality
//                         },
//                         child: Text('Edit Trip'),
//                       ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String _formatDate(DateTime date) {
//     return '${date.day}/${date.month}/${date.year}';
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: _TripsSliverAppBar(expandedHeight: 200),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Upcoming Trips',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => TripCard(
                destination: 'Paris, France',
                startDate: DateTime.now().add(Duration(days: 30 + index * 10)),
                endDate: DateTime.now().add(Duration(days: 37 + index * 10)),
                imageUrl: 'assets/images/paris.jpg',
              ),
              childCount: 3,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Past Trips',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => TripCard(
                destination: 'Tokyo, Japan',
                startDate:
                    DateTime.now().subtract(Duration(days: 100 - index * 30)),
                endDate:
                    DateTime.now().subtract(Duration(days: 93 - index * 30)),
                imageUrl: 'assets/images/tokyo.jpg',
                isPast: true,
              ),
              childCount: 3,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Implement add new trip functionality
        },
        icon: Icon(Icons.add),
        label: Text('New Trip'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

class _TripsSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  _TripsSliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double opacity = 1 - shrinkOffset / expandedHeight;
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/travel_background.jpg',
          fit: BoxFit.cover,
        ),
        Opacity(
          opacity: opacity,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black54],
              ),
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 16,
          child: Opacity(
            opacity: opacity,
            child: Text(
              'My Trips',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              shrinkOffset > 50 ? 'My Trips' : '',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class TripCard extends StatelessWidget {
  final String destination;
  final DateTime startDate;
  final DateTime endDate;
  final String imageUrl;
  final bool isPast;

  const TripCard({
    Key? key,
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
    this.isPast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.asset(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black87],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${DateFormat('MMM d').format(startDate)} - ${DateFormat('MMM d, yyyy').format(endDate)}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      _buildIconButton(context, Icons.map, 'Itinerary'),
                      SizedBox(width: 16),
                      _buildIconButton(context, Icons.photo_library, 'Gallery'),
                      Spacer(),
                      if (!isPast)
                        ElevatedButton(
                          onPressed: () {
                            // TODO: Implement edit trip functionality
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () {
        // TODO: Implement functionality
      },
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 18),
          SizedBox(width: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.white70,
                ),
          ),
        ],
      ),
    );
  }
}
