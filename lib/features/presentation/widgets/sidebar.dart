import 'package:flutter/material.dart';

import '../pages/authpage/login.dart';

class SideBar extends StatefulWidget {
  final int role;
  final String userName;

  const SideBar({
    super.key,
    required this.role,
    required this.userName
  });

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isExpanded = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: isExpanded ? 220 : 70,
      color: Colors.grey[100],
      child: Column(
        children: [
          const SizedBox(height: 20),

          IconButton(
            icon: Icon(isExpanded ? Icons.arrow_back : Icons.arrow_forward),
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),

          const SizedBox(height: 20),
          if(widget.role==1)
          Expanded(
            child: ListView(
              children: [
                buildItem(Icons.dashboard, "Dashboard", 0),
                buildItem(Icons.store, "Agents", 1),
                buildItem(Icons.shopping_cart, "Field", 2),

                if (isExpanded)
                  Padding(
                    padding: EdgeInsets.all(12),
                    child:
                    Text("SYSTEM", style: TextStyle(color: Colors.grey)),
                  ),

                buildItem(Icons.settings, "Settings", 6),
              ],
            ),
          ),
          if(widget.role==2)
            Expanded(
              child: ListView(
                children: [
                  buildItem(Icons.dashboard, "Dashboard", 0),
                  buildItem(Icons.shopping_cart, "Field", 1),

                  if (isExpanded)
                    Padding(
                      padding: EdgeInsets.all(12),
                      child:
                      Text("SYSTEM", style: TextStyle(color: Colors.grey)),
                    ),

                  buildItem(Icons.settings, "Settings", 3),
                ],
              ),
            ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: isExpanded
                ? Row(
              children: [
                Expanded(
                  child: Text(
                    "Dark",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Switch(
                  value: false,
                  onChanged: (v) {},
                ),
              ],
            )
                : IconButton(
              icon: const Icon(Icons.dark_mode),
              onPressed: () {},
            ),
          ),

          const SizedBox(height: 10),
          if(widget.role==1)
          ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: isExpanded ? 16 : 8,
            ),
            leading: CircleAvatar(
              radius: isExpanded ? 20 : 14,
              child: Icon(Icons.person, size: isExpanded ? 20 : 14),
            ),
            title: isExpanded ? Text("${widget.userName}") : null,

            subtitle: isExpanded ? Text("Admin") : null,
          ),
          if(widget.role==2)
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: isExpanded ? 16 : 8,
              ),
              leading: CircleAvatar(
                radius: isExpanded ? 20 : 14,
                child: Icon(Icons.person, size: isExpanded ? 20 : 14),
              ),
              title: isExpanded ? Text("${widget.userName}") : null,

              subtitle: isExpanded ? Text("Agent") : null,
            ),

          // 🔹 Logout
          ListTile(
            leading: Icon(Icons.logout),
            title: isExpanded ? Text("Logout") : null,
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginUI()),
                    (route) => false,
              );
            },
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildItem(IconData icon, String label, int index) {
    final isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.withOpacity(0.2) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.green),

            if (isExpanded) SizedBox(width: 10),

            if (isExpanded)
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }
}