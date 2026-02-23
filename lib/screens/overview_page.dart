import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.1)),
          ),
          child: const Icon(Icons.grid_view_rounded, color: Colors.black, size: 20),
        ),
        title: Text(
          'Overview',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Income & Expense Cards
            Row(
              children: [
                Expanded(
                  child: _buildSummaryCard(
                    title: 'Total Income',
                    amount: '\$8,500',
                    icon: Icons.arrow_downward,
                    color: const Color(0xFF7F3DFF),
                    bgColor: const Color(0xFFF1EDFF),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildSummaryCard(
                    title: 'Total Expenses',
                    amount: '\$3,800',
                    icon: Icons.arrow_upward,
                    color: const Color(0xFFFD3C4A),
                    bgColor: const Color(0xFFFFEBED),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Statistics Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Statistics',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Apr 01 - Apr 30',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Text('Monthly', style: GoogleFonts.poppins(fontSize: 14)),
                      const Icon(Icons.keyboard_arrow_down, size: 20),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Custom Bar Chart
            const StatisticsChart(),
            const SizedBox(height: 32),
            // Toggle Switch
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF9F9FB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildToggleItem('Income', false),
                  ),
                  Expanded(
                    child: _buildToggleItem('Expenses', true),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Transaction List
            _buildHistoryItem(
              title: 'Shopping',
              subtitle: '30 Apr 2022',
              amount: '-\$1550',
              icon: Icons.shopping_bag_outlined,
              iconColor: const Color(0xFFFD3C4A),
              bgColor: const Color(0xFFFFEBED),
            ),
            _buildHistoryItem(
              title: 'Laptop',
              subtitle: '24 Apr 2022',
              amount: '-\$1200',
              icon: Icons.laptop_mac_rounded,
              iconColor: Colors.blue,
              bgColor: const Color(0xFFEDF7FF),
            ),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required String amount,
    required IconData icon,
    required Color color,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(color: Colors.grey[700], fontSize: 13),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                child: Icon(icon, color: Colors.white, size: 12),
              ),
              const SizedBox(width: 8),
              Text(
                amount,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToggleItem(String title, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFD3C4A) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            color: isActive ? Colors.white : Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryItem({
    required String title,
    required String subtitle,
    required String amount,
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFFD3C4A),
            ),
          ),
        ],
      ),
    );
  }
}

class StatisticsChart extends StatelessWidget {
  const StatisticsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          // Y-axis labels and dashed lines
          Expanded(
            child: Stack(
              children: [
                _buildYLine('\$4k'),
                _buildYLine('\$3k'),
                _buildYLine('\$2k'),
                _buildYLine('\$1k'),
                _buildYLine('\$0'),
                // Bars
                Positioned.fill(
                  left: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildBarGroup('Week 1', 140, 80),
                      _buildBarGroup('Week 2', 70, 50),
                      _buildBarGroup('Week 3', 100, 75),
                      _buildBarGroup('Week 4', 115, 60),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYLine(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Row(
        children: [
          SizedBox(
            width: 30,
            child: Text(
              label,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xFFF1F1F1),
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarGroup(String label, double height1, double height2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 14,
              height: height1,
              decoration: BoxDecoration(
                color: const Color(0xFF7F3DFF),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 6),
            Container(
              width: 14,
              height: height2,
              decoration: BoxDecoration(
                color: const Color(0xFFFD3C4A),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }
}
