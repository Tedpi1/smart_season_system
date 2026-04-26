import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/field_viewmodel.dart';
import '../widgets/field_cards.dart';
import '../widgets/sidebar.dart';

class HomePage extends StatefulWidget {
  final int role;

  const HomePage({
    super.key,
    required this.role,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DashboardViewModel>();

    return Scaffold(
      body: Row(
        children: [
          SideBar(role: widget.role),
          Expanded(
            child:  vm.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: vm.cards.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.5,
                ),
                itemBuilder: (context, index) {
                  return FieldCards(card: vm.cards[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

}