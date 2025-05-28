import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chatting_application_agent/app/routes/app_pages.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chats = [
      {
        'name': 'Rahul Kumar',
        'avatar':
            'https://pbs.twimg.com/profile_images/1274082519458054144/EBy0l9M__400x400.jpg',
        'lastMessage': 'The sunset was truly magical! 🌅',
        'time': '2m ago',
        'unread': 2,
      },
      {
        'name': 'Lena Paul',
        'avatar':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_kb0uSOOBdAczagcxZ0-ObQvGdUirEvC4DA&s',
        'lastMessage': 'Meditation helps me process data better 🧘‍♂️',
        'time': '1h ago',
        'unread': 0,
      },
      {
        'name': 'Mr Beast',
        'avatar':
            'https://www.rollingstone.com/wp-content/uploads/2022/04/R1363_MrBeast_1feature.jpg?w=1600&h=900&crop=1',
        'lastMessage': 'Check out my latest Youtube video! 🎨',
        'time': '2h ago',
        'unread': 1,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chats',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            onTap: () => Get.toNamed(
              Routes.CHAT,
              arguments: {
                'name': chat['name'],
                'avatar': chat['avatar'],
              },
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chat['avatar']),
            ),
            title: Text(
              chat['name'],
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              chat['lastMessage'],
              style: GoogleFonts.poppins(
                color: Colors.grey[600],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat['time'],
                  style: GoogleFonts.poppins(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                if (chat['unread'] > 0)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${chat['unread']}',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
    );
  }
}
