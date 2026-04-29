import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_season_system/features/presentation/widgets/AgentsTable.dart';
import '../viewmodels/field_viewmodel.dart';
import '../widgets/field_cards.dart';
import '../widgets/piechart.dart';
import '../widgets/sidebar.dart';
import '../widgets/tableWidget.dart';

class HomePage extends StatefulWidget {
  final int role;

  const HomePage({super.key, required this.role});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DashboardViewModel>();

    return Scaffold(
      drawer: SideBar(role: widget.role),
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: vm.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // GRID
                        LayoutBuilder(
                          builder: (context, constraints) {
                            int crossAxisCount = 4;
                            double aspectRatio = 2.5;

                            if (constraints.maxWidth < 600) {
                              crossAxisCount = 1;
                              aspectRatio = 3.0;
                            } else if (constraints.maxWidth < 900) {
                              crossAxisCount = 2;
                              aspectRatio = 2.0;
                            }

                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: vm.cards.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: aspectRatio,
                              ),
                              itemBuilder: (context, index) {
                                return FieldCards(card: vm.cards[index]);
                              },
                            );
                          },
                        ),

                        const SizedBox(height: 20),

                        // PIE CHART
                        SizedBox(
                          height: 320,
                          child: Card(
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Piewidget(vm: vm),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ✅ NEW: ALL FIELDS TABLE
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "All Fields",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 12),
                                if (widget.role==1)
                                vm.fields.isEmpty
                                    ? const Center(child: Text("No data available"))
                                    : AllFieldsTable(fields: vm.fields),
                                if (widget.role==2)
                                  vm.userfield.isEmpty
                                      ? const Center(child: Text("No data available"))
                                      : AgentsTable(fields: vm.userfield),


                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}