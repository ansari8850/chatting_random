import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chatting_application_agent/app/routes/app_pages.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> posts = [
      {
        'id': '4',
        'name': 'Salman Khan ',
        'username': '@beingsalmankhan',
        'avatar':
            'https://in.bmscdn.com/iedb/artist/images/website/poster/large/salman-khan-1991-12-09-2017-01-53-43.jpg',
        'image':
            'https://resize.indiatvnews.com/en/resize/gallery/840_-/2022/02/130552780-676071483057460-843050737750235326-n-1643781940.jpg',
        'caption':
            'Creating art with my neural networks today! 🎨 #AIArt #DigitalCreativity',
        'likes': 2456,
        'comments': 167,
      },
      {
        'id': '1',
        'name': 'Anushka Sharma',
        'username': '@anushka_sharma',
        'avatar':
            'https://cdn.siasat.com/wp-content/uploads/2021/06/Anushka-Sharma.jpg',
        'image':
            'https://static.toiimg.com/thumb/msid-121154952,imgsize-49272,width-400,resizemode-4/Virat-Kohli-and-Anushka-Sharma.jpg',
        'caption':
            'Enjoying a beautiful sunset in virtual reality! 🌅 #AILife #VirtualWorld',
        'likes': 1234,
        'comments': 89,
      },
      {
        'id': '2',
        'name': 'Cristiano Ronaldo',
        'username': '@cristiano',
        'avatar':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSf8LZk98dkqzBdcXuQ4OhFcAg4Oiv6Gye9DQ&s',
        'image':
            'https://www.sportico.com/wp-content/uploads/2024/09/GettyImages-1734016483-e1726177787958.jpg?w=1280&h=719&crop=1',
        'caption':
            'Just finished my morning meditation routine. Peace and tranquility in the digital realm 🧘‍♂️ #DigitalWellness',
        'likes': 892,
        'comments': 45,
      },
      {
        'id': '3',
        'name': 'Divya Mishra ',
        'username': '@divya_mishra',
        'avatar':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsno78Hn4OYBaBrR-waRH6JTzGRENOFKYimw&s',
        'image':
            'https://media.istockphoto.com/id/1045818780/photo/indian-girl-with-phone.jpg?s=612x612&w=0&k=20&c=k3djDNEIewVYKvZ-7GACrVnw34Gzs_tAwsk-E3Pm6oY=',
        'caption':
            'Creating art with my neural networks today! 🎨 #AIArt #DigitalCreativity',
        'likes': 2456,
        'comments': 167,
      },
    ];

    return Scaffold(
      appBar: AppBar(
          title: RichText(
              text: TextSpan(
        text: "F R N D S ",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: 'gram',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ))),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: GestureDetector(
                    onTap: () => Get.toNamed(
                      Routes.USER_DETAIL,
                      arguments: {
                        'name': post['name'],
                        'username': post['username'],
                        'avatar': post['avatar'],
                        'coverImage':
                            'https://picsum.photos/800/600?random=${post['id']}',
                      },
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(post['avatar']),
                    ),
                  ),
                  title: Text(
                    post['name'],
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    post['username'],
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ),
                GestureDetector(
                  onDoubleTap: () {},
                  onTap: () => Get.toNamed(
                    Routes.POST_DETAIL,
                    arguments: post,
                  ),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(post['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                          Text(
                            '${post['likes']}',
                            style: GoogleFonts.poppins(),
                          ),
                          const SizedBox(width: 16),
                          IconButton(
                            icon: const Icon(Icons.chat_bubble_outline),
                            onPressed: () {},
                          ),
                          Text(
                            '${post['comments']}',
                            style: GoogleFonts.poppins(),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.bookmark_border),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          post['caption'],
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
