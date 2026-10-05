import 'package:flutter/material.dart';

void main() {
  runApp(const DemoWalletApp());
}

class DemoWalletApp extends StatelessWidget {
  const DemoWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Wallet',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4E9FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7210D8),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: const [
            HomeContent(),
            SimplePage(
              icon: Icons.account_balance_wallet_outlined,
              title: 'Income',
            ),
            SimplePage(
              icon: Icons.task_alt,
              title: 'Tasks',
            ),
            SimplePage(
              icon: Icons.groups_outlined,
              title: 'Team',
            ),
            SimplePage(
              icon: Icons.person_outline,
              title: 'Profile',
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 75,
        selectedIndex: selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFEAD9FF),
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: Icon(Icons.account_balance_wallet),
            label: 'Income',
          ),
          NavigationDestination(
            icon: Icon(Icons.task_alt_outlined),
            selectedIcon: Icon(Icons.task_alt),
            label: 'Task',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            selectedIcon: Icon(Icons.groups),
            label: 'Team',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF8D20E8),
                            Color(0xFF5D00C8),
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Demo Wallet',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF401078),
                          ),
                        ),
                        Text(
                          'Welcome back!',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.notifications_none),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),
              const PromoBanner(),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ActionButton(
                        icon: Icons.add_card,
                        title: 'Recharge',
                        onTap: () => showDemoMessage(
                          context,
                          'Demo recharge screen',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ActionButton(
                        icon: Icons.download,
                        title: 'Withdraw',
                        onTap: () => showDemoMessage(
                          context,
                          'Demo withdrawal screen',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ActionButton(
                        icon: Icons.group_add,
                        title: 'Invite',
                        onTap: () => showDemoMessage(
                          context,
                          'Demo invite screen',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ActionButton(
                        icon: Icons.chat_bubble_outline,
                        title: 'Online',
                        onTap: () => showDemoMessage(
                          context,
                          'Online support demo',
                        ),
                      ),
                    ),
                 class ActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 105,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.75),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: const Color(0xFF7210D8),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF401078),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanSelector extends StatefulWidget {
  const PlanSelector({super.key});

  @override
  State<PlanSelector> createState() => _PlanSelectorState();
}

class _PlanSelectorState extends State<PlanSelector> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 62,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selected = 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  gradient: selected == 0
                      ? const LinearGradient(
                          colors: [
                            Color(0xFF6810D0),
                            Color(0xFF9C3CE8),
                          ],
                        )
                      : null,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Normal Plan',
                  style: TextStyle(
                    color: selected == 0
                        ? Colors.white
                        : Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selected = 1),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'VIP Plan',
                  style: TextStyle(
                    color: selected == 1
                        ? const Color(0xFF7210D8)
                        : Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
         
