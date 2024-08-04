import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

final isLoadingProvider = StateProvider<bool>((ref) => true);

class ExploreScreen extends ConsumerStatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final ScrollController _scrollController = ScrollController();
  bool _isCollapsed = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _animationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat(reverse: true);
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _tabController = TabController(length: 3, vsync: this);

    // Simulate loading delay
    Future.delayed(const Duration(seconds: 2), () {
      ref.read(isLoadingProvider.notifier).state = false;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _animationController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight)) {
      if (!_isCollapsed) setState(() => _isCollapsed = true);
    } else {
      if (_isCollapsed) setState(() => _isCollapsed = false);
    }
  }

  final List<String> destinationImages = [
    'assets/images/ancient_ruins.jpg',
    'assets/images/iconic_city_skyline.jpg',
    'assets/images/iconic_landmark_closeup.jpg',
    'assets/images/lush_rainforest_waterfall.jpg',
    'assets/images/northern_lights_display.jpg',
    'assets/images/panoramic_landscape.jpg',
    'assets/images/scenic_road_trip.jpg',
    'assets/images/serene_lake_reflection.jpg',
    'assets/images/snowy_mountain_peaks.jpg',
    'assets/images/tropical_beach_paradise.jpg',
    'assets/images/vibrant_market_scene.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(isLoadingProvider);

    return Scaffold(
      body: isLoading
          ? LoadingShimmer()
          : Stack(
              children: [
                // CustomScrollView(
                //   controller: _scrollController,
                //   slivers: <Widget>[
                //     SliverAppBar(
                //       expandedHeight: 300.0,
                //       floating: false,
                //       pinned: true,
                //       flexibleSpace: FlexibleSpaceBar(
                //         title: AnimatedDefaultTextStyle(
                //           child: const Text('Explore Amazing Destinations'),
                //           style: TextStyle(
                //             color: _isCollapsed ? Colors.black : Colors.white,
                //             fontWeight: FontWeight.bold,
                //             fontSize: _isCollapsed ? 20 : 24,
                //           ),
                //           duration: const Duration(milliseconds: 200),
                //         ),
                //         background: Stack(
                //           fit: StackFit.expand,
                //           children: [
                //             FlutterCarousel(
                //               options: CarouselOptions(
                //                 height: 300.0,
                //                 showIndicator: false,
                //                 viewportFraction: 1.0,
                //                 autoPlay: true,
                //                 autoPlayInterval: const Duration(seconds: 5),
                //               ),
                //               items: destinationImages
                //                   .map((item) => Image(
                //                         image: AssetImage(item),
                //                         fit: BoxFit.cover,
                //                         width: double.infinity,
                //                       ))
                //                   .toList(),
                //             ),
                //             BackdropFilter(
                //               filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                //               child: Container(
                //                   color: Colors.black.withOpacity(0.3)),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     SliverToBoxAdapter(
                //       child: Padding(
                //         padding: const EdgeInsets.all(16.0),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'Trending Destinations',
                //               style: Theme.of(context)
                //                   .textTheme
                //                   .headlineSmall
                //                   ?.copyWith(fontWeight: FontWeight.bold),
                //             ),
                //             const SizedBox(height: 16),
                //             TrendingDestinationsCarousel(
                //                 destinations: destinationImages),
                //             const SizedBox(height: 24),
                //             Text(
                //               'Explore',
                //               style: Theme.of(context)
                //                   .textTheme
                //                   .headlineSmall
                //                   ?.copyWith(fontWeight: FontWeight.bold),
                //             ),
                //             const SizedBox(height: 16),
                //             TabBar(
                //               controller: _tabController,
                //               tabs: const [
                //                 Tab(text: 'Popular'),
                //                 Tab(text: 'Recommended'),
                //                 Tab(text: 'New'),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     SliverFillRemaining(
                //       child: TabBarView(
                //         controller: _tabController,
                //         children: [
                //           ExperiencesGrid(experiences: destinationImages),
                //           ExperiencesGrid(
                //               experiences: destinationImages.reversed.toList()),
                //           ExperiencesGrid(
                //               experiences: destinationImages.sublist(2)),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      // SliverAppBar(
                      //   expandedHeight: 300.0,
                      //   floating: false,
                      //   pinned: true,
                      //   flexibleSpace: FlexibleSpaceBar(
                      //     title: AnimatedDefaultTextStyle(
                      //       style: TextStyle(
                      //         color: _isCollapsed ? Colors.black : Colors.white,
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: _isCollapsed ? 20 : 24,
                      //       ),
                      //       duration: const Duration(milliseconds: 200),
                      //       child: Text(
                      //         'Explore Amazing Destinations',
                      //         textAlign: _isCollapsed
                      //             ? TextAlign.center
                      //             : TextAlign.start,
                      //       ),
                      //     ),
                      //     background: Stack(
                      //       fit: StackFit.expand,
                      //       children: [
                      //         FlutterCarousel(
                      //           options: CarouselOptions(
                      //             height: 300.0,
                      //             showIndicator: false,
                      //             viewportFraction: 1.0,
                      //             autoPlay: true,
                      //             autoPlayInterval: const Duration(seconds: 5),
                      //           ),
                      //           items: destinationImages
                      //               .map((item) => Image(
                      //                     image: AssetImage(item),
                      //                     fit: BoxFit.cover,
                      //                     width: double.infinity,
                      //                   ))
                      //               .toList(),
                      //         ),
                      //         BackdropFilter(
                      //           filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      //           child: Container(
                      //               color: Colors.black.withOpacity(0.3)),
                      //         ),
                      //       ],
                      //     ),
                      //   ),

                      // ),
                      SliverAppBar(
                        expandedHeight: 300.0,
                        floating: false,
                        pinned: true,
                        flexibleSpace: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            double percent =
                                ((constraints.maxHeight - kToolbarHeight) /
                                        (300.0 - kToolbarHeight))
                                    .clamp(0.0, 1.0);
                            return FlexibleSpaceBar(
                              title: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: double.infinity,
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 200),
                                  style: TextStyle(
                                    color: percent > 0.5
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20 + (percent * 4),
                                  ),
                                  child: Text(
                                    'Explore Amazing Destinations',
                                    textAlign: percent > 0.5
                                        ? TextAlign.left
                                        : TextAlign.center,
                                  ),
                                ),
                              ),
                              titlePadding: EdgeInsets.lerp(
                                const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 16),
                                const EdgeInsets.only(left: 72.0, bottom: 16),
                                percent,
                              ),
                              background: Stack(
                                fit: StackFit.expand,
                                children: [
                                  FlutterCarousel(
                                    options: CarouselOptions(
                                      height: 300.0,
                                      showIndicator: false,
                                      viewportFraction: 1.0,
                                      autoPlay: true,
                                      autoPlayInterval:
                                          const Duration(seconds: 5),
                                    ),
                                    items: destinationImages
                                        .map((item) => Image(
                                              image: AssetImage(item),
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                            ))
                                        .toList(),
                                  ),
                                  BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: Container(
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Trending Destinations',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 16),
                              TrendingDestinationsCarousel(
                                  destinations: destinationImages),
                              const SizedBox(height: 24),
                              Text(
                                'Explore',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ),
                      SliverPersistentHeader(
                        delegate: _SliverAppBarDelegate(
                          TabBar(
                            controller: _tabController,
                            tabs: const [
                              Tab(text: 'Popular'),
                              Tab(text: 'Recommended'),
                              Tab(text: 'New'),
                            ],
                          ),
                        ),
                        pinned: true,
                      ),
                    ];
                  },
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      ExperiencesGrid(experiences: destinationImages),
                      ExperiencesGrid(
                          experiences: destinationImages.reversed.toList()),
                      ExperiencesGrid(
                          experiences: destinationImages.sublist(2)),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: FloatingActionButton(
                    onPressed: () {
                      // Implement search functionality
                      showSearch(
                          context: context,
                          delegate: DestinationSearchDelegate());
                    },
                    child: const Icon(Icons.search),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class LoadingShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 24,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: 150,
                    height: 24,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.white,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrendingDestinationsCarousel extends StatelessWidget {
  final List<String> destinations;

  const TrendingDestinationsCarousel({Key? key, required this.destinations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
      options: CarouselOptions(
        height: 200.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: destinations
          .map((item) => Builder(
                builder: (BuildContext context) {
                  return Hero(
                    tag: 'destination_$item',
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DestinationDetailScreen(imageUrl: item),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(item),
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
                              image: DecorationImage(
                                image: AssetImage(item),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: const Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Trending Destination',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ))
          .toList(),
    );
  }
}

// class ExperiencesGrid extends StatelessWidget {
//   final List<String> experiences;

//   const ExperiencesGrid({Key? key, required this.experiences})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimationLimiter(
//       child: GridView.builder(
//         padding: const EdgeInsets.all(16),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 0.75,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         itemCount: experiences.length,
//         itemBuilder: (BuildContext context, int index) {
//           return AnimationConfiguration.staggeredGrid(
//             position: index,
//             duration: const Duration(milliseconds: 375),
//             columnCount: 2,
//             child: ScaleAnimation(
//               child: FadeInAnimation(
//                 child: ExperienceCard(
//                   title: 'Experience ${index + 1}',
//                   imageAsset: experiences[index],
//                   rating: (index % 5 + 1).toDouble(),
//                   price: ((index + 1) * 50).toString(),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class ExperiencesGrid extends StatelessWidget {
  final List<String> experiences;

  const ExperiencesGrid({Key? key, required this.experiences})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: (experiences.length / 2).ceil(),
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              Expanded(
                child: _buildExperienceCard(context, index * 2),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: index * 2 + 1 < experiences.length
                    ? _buildExperienceCard(context, index * 2 + 1)
                    : const SizedBox(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, int index) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: ExperienceCard(
            title: 'Experience ${index + 1}',
            imageAsset: experiences[index],
            rating: (index % 5 + 1).toDouble(),
            price: ((index + 1) * 50).toString(),
          ),
        ),
      ),
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final String title;
  final String imageAsset;
  final double rating;
  final String price;

  const ExperienceCard({
    Key? key,
    required this.title,
    required this.imageAsset,
    required this.rating,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image(
              image: AssetImage(imageAsset),
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: <Widget>[
                    const Icon(Icons.star, color: Colors.amber, size: 16.0),
                    const SizedBox(width: 4.0),
                    Text(rating.toString()),
                  ],
                ),
                const SizedBox(height: 4.0),
                Text(
                  '\$$price',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationDetailScreen extends StatelessWidget {
  final String imageUrl;

  const DestinationDetailScreen({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Destination Details'),
              background: Hero(
                tag: 'destination_$imageUrl',
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About this destination',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Popular Experiences',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: ExperienceCard(
                            title: 'Experience ${index + 1}',
                            imageAsset: imageUrl,
                            rating: 4.5,
                            price: '${(index + 1) * 50}',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DestinationSearchDelegate extends SearchDelegate<String> {
  final List<String> destinations = [
    'Paris, France',
    'Tokyo, Japan',
    'New York, USA',
    'Rome, Italy',
    'Sydney, Australia',
    'Bangkok, Thailand',
    'Rio de Janeiro, Brazil',
    'Dubai, UAE',
    'Amsterdam, Netherlands',
    'Barcelona, Spain',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = destinations
        .where((dest) => dest.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = destinations
        .where((dest) => dest.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
