import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color _primaryColor = Color(0xFF7F3DFF);
  static const Color _backgroundColor = Color(0xFFF9FAFC);
  static const Color _textPrimaryColor = Color(0xFF1B1D1F);
  static const Color _textSecondaryColor = Color(0xFF8E9297);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF9FAFC),
      child: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 20),
            _buildTopBar(),
            const SizedBox(height: 40),
            _buildBalanceSection(),
            const SizedBox(height: 40),
            _buildTransactionHeader(),
            const SizedBox(height: 20),
            const TransactionList(),
            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  // Placeholder methods for the new build structure
  Widget _buildTopBar() {
    return const HeaderSection();
  }

  Widget _buildBalanceSection() {
    return const BalanceCard();
  }

  Widget _buildTransactionHeader() {
    return const TransactionHeader();
  }
}

/* ------------------------------------------------ */
/* ---------------- HEADER SECTION ---------------- */
/* ------------------------------------------------ */

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        HeaderIcon(icon: Icons.grid_view_rounded),
        Text(
          'Home',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1B1D1F),
          ),
        ),
        HeaderIcon(
          icon: Icons.notifications,
          hasNotification: true,
        ),
      ],
    );
  }
}

class HeaderIcon extends StatelessWidget {
  final IconData icon;
  final bool hasNotification;

  const HeaderIcon({
    super.key,
    required this.icon,
    this.hasNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        children: [
          Icon(icon, size: 24, color: const Color(0xFF1B1D1F)),
          if (hasNotification)
            const Positioned(
              right: 0,
              top: 0,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}

/* ------------------------------------------------ */
/* ---------------- BALANCE CARD ------------------ */
/* ------------------------------------------------ */

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF635BFF),
            Color(0xFFB462E3),
            Color(0xFFFF827D),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          BalanceHeader(),
          SizedBox(height: 10),
          Text(
            '\$3,257.00',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BalanceInfo(
                title: 'Income',
                amount: '\$2,350.00',
                icon: Icons.arrow_downward,
              ),
              BalanceInfo(
                title: 'Expenses',
                amount: '\$950.00',
                icon: Icons.arrow_upward,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BalanceHeader extends StatelessWidget {
  const BalanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Total Balance',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.white70),
          ],
        ),
        Icon(Icons.more_horiz, color: Colors.white),
      ],
    );
  }
}

class BalanceInfo extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;

  const BalanceInfo({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white24,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 16),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/* ------------------------------------------------ */
/* -------------- TRANSACTIONS -------------------- */
/* ------------------------------------------------ */

class TransactionHeader extends StatelessWidget {
  const TransactionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Transactions',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1B1D1F),
          ),
        ),
        Text(
          'See All',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF8E9297),
          ),
        ),
      ],
    );
  }
}

class TransactionModel {
  final String title;
  final String time;
  final String amount;
  final IconData icon;
  final Color iconColor;

  const TransactionModel({
    required this.title,
    required this.time,
    required this.amount,
    required this.icon,
    required this.iconColor,
  });

  bool get isPositive => amount.startsWith('+');
}

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  static const transactions = [
    TransactionModel(
      title: 'Money Transfer',
      time: '12:35 PM',
      amount: '-\$450',
      icon: Icons.person,
      iconColor: Colors.blue,
    ),
    TransactionModel(
      title: 'PayPal',
      time: '10:20 AM',
      amount: '+\$1200',
      icon: Icons.account_balance_wallet,
      iconColor: Colors.blueAccent,
    ),
    TransactionModel(
      title: 'Uber',
      time: '08:40 AM',
      amount: '-\$150',
      icon: Icons.directions_car,
      iconColor: Colors.black,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F3F6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(tx.icon, color: tx.iconColor),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        tx.time,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF8E9297),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  tx.amount,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: tx.isPositive ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
