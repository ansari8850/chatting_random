import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({Key? key}) : super(key: key);

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isFriend = false;
  bool isPendingRequest = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> user = Get.arguments ?? {};

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      user['coverImage'] ?? 'https://picsum.photos/800/600',
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Transform.translate(
                    offset: const Offset(0, -40),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(user['avatar'] ?? ''),
                    ),
                  ),
                  Text(
                    user['name'] ?? 'User Name',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    user['username'] ?? '@username',
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (!isFriend)
                    ElevatedButton.icon(
                      onPressed: isPendingRequest
                          ? null
                          : () {
                              setState(() {
                                isPendingRequest = true;
                              });
                            },
                      icon: Icon(
                        isPendingRequest
                            ? Icons.hourglass_empty
                            : Icons.person_add,
                      ),
                      label: Text(
                        isPendingRequest ? 'Request Sent' : 'Add Friend',
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStat('Posts', '156'),
                        _buildStat('Friends', '2.3K'),
                        _buildStat('Following', '1.1K'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ),
                  unselectedLabelStyle: GoogleFonts.poppins(),
                  tabs: const [
                    Tab(text: 'Photos'),
                    Tab(text: 'Videos'),
                    Tab(text: 'Interests'),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: isFriend
            ? TabBarView(
                controller: _tabController,
                children: [
                  _buildPhotosGrid(),
                  _buildVideosGrid(),
                  _buildInterestsList(),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'This content is private',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Add friend to see photos, videos and interests',
                      style: GoogleFonts.poppins(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildPhotosGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(
                'https://picsum.photos/200?random=$index',
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget _buildVideosGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 16 / 9,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://picsum.photos/400/225?random=$index',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            const Center(
              child: Icon(
                Icons.play_circle_outline,
                size: 48,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInterestsList() {
    final List<Map<String, dynamic>> interests = [
      {
        'icon': Icons.sports_basketball,
        'name': 'Basketball',
        'color': Colors.orange,
      },
      {
        'icon': Icons.music_note,
        'name': 'Music',
        'color': Colors.purple,
      },
      {
        'icon': Icons.camera_alt,
        'name': 'Photography',
        'color': Colors.blue,
      },
      {
        'icon': Icons.restaurant,
        'name': 'Cooking',
        'color': Colors.red,
      },
      {
        'icon': Icons.flight,
        'name': 'Travel',
        'color': Colors.green,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: interests.length,
      itemBuilder: (context, index) {
        final interest = interests[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: interest['color'].withOpacity(0.2),
              child: Icon(
                interest['icon'],
                color: interest['color'],
              ),
            ),
            title: Text(
              interest['name'],
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: OutlinedButton(
              onPressed: () {},
              child: Text(
                'View More',
                style: GoogleFonts.poppins(),
              ),
            ),
          ),
        );
      },
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
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
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
