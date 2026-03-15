import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherPayScreen extends StatefulWidget {
  const UrlLauncherPayScreen({super.key});

  @override
  State<UrlLauncherPayScreen> createState() => _UrlLauncherPayScreenState();
}

class _UrlLauncherPayScreenState extends State<UrlLauncherPayScreen> {
  // ================= CONFIG =================
  static const String _upiId = 'vipullokhande1@okicici';
  static const String _merchantName = 'Demo Merchant';
  static const String _amount = '1.00';
  static const String _currency = 'INR';

  // ================= ALL SUPPORTED UPI APPS =================
  final Map<String, String> _upiApps = const {
    'Google Pay': 'gpay://upi/pay',
    'PhonePe': 'phonepe://pay',
    'Paytm': 'paytmmp://pay',
    'BHIM': 'bhim://pay',
  };

  // ================= INSTALLED APPS =================
  final Map<String, String> _installedApps = {};

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    // _detectInstalledApps();
  }

  // ================= DETECT INSTALLED APPS =================
  Future<void> _detectInstalledApps() async {
    for (final entry in _upiApps.entries) {
      final uri = Uri.parse(
        '${entry.value}?pa=$_upiId&pn=$_merchantName&am=$_amount&cu=$_currency',
      );

      if (await canLaunchUrl(uri)) {
        _installedApps[entry.key] = entry.value;
      }
    }

    setState(() => _loading = false);
  }

  // ================= GENERIC FALLBACK =================
  Uri _genericUpi(String note) {
    final txnId = DateTime.now().millisecondsSinceEpoch.toString();

    return Uri(
      scheme: 'upi',
      host: 'pay',
      queryParameters: {
        'pa': _upiId,
        'pn': _merchantName,
        'tr': txnId,
        'tn': note,
        'am': _amount,
        'cu': _currency,
      },
    );
  }

  // ================= PAY =================
  Future<void> _pay(
    BuildContext context, {
    required String appName,
    required String scheme,
  }) async {
    final uri = Uri.parse(
      '$scheme'
      '?pa=$_upiId'
      '&pn=$_merchantName'
      '&am=$_amount'
      '&cu=$_currency',
    );

    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      // Fallback (rare)
      await launchUrl(
        _genericUpi('Payment via $appName'),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  // ================= UI =================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select UPI App')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _installedApps.isEmpty
            ? const Center(
                child: Text(
                  'No UPI apps found on this device',
                  style: TextStyle(fontSize: 16),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Amount: ₹$_amount',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),

                  ..._installedApps.entries.map(
                    (e) => _payButton(
                      text: e.key,
                      onTap: () =>
                          _pay(context, appName: e.key, scheme: e.value),
                    ),
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    '✔ Only installed apps are shown\n'
                    '⚠ Some apps may still show chooser\n'
                    'This is enforced by NPCI / UPI rules',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _payButton({required String text, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text('Pay with $text'),
      ),
    );
  }
}
