import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/wallet_page/WalletPageContent.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WalletPageContent(),
    );
  }
}
