import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _popularUsers = [
    {
      'userId': 'beingsalman',
      'username': 'beingsalmankhan',
      'fullName': 'Salman Khan',
      'avatar':
          'https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg',
      'bio': 'Actor, Producer, Humanitarian | Being Human Foundation',
      'isVerified': true,
      'followers': '50M',
      'following': '100',
      'posts': '1000',
    },
    // Add more users here
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              hintStyle: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _popularUsers.length,
        itemBuilder: (context, index) {
          final user = _popularUsers[index];
          return ListTile(
            onTap: () => Get.toNamed('/user-detail', arguments: user),
            leading: GestureDetector(
              onTap: () => Get.toNamed('/user-detail', arguments: user),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.purple,
                      Colors.orange,
                      Colors.pink,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user['avatar']),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            title: Row(
              children: [
                Text(
                  user['username'],
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (user['isVerified'])
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child:
                        Icon(Icons.verified, color: Colors.blue[500], size: 16),
                  ),
              ],
            ),
            subtitle: Text(
              user['fullName'],
              style: GoogleFonts.poppins(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            trailing: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey[300]!),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Follow',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
