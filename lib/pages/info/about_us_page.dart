import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // For opening URLs

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200], // Light background
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 16.0),
              _buildSection(
                title: 'Development Team',
                children: [
                  _buildTeamMember(
                    name: 'Project Owner & Software Architect',
                    role: 'Mohammad Razib Mustafiz',
                    link: 'https://www.linkedin.com/in/razibmustafiz',
                  ),
                  _buildTeamMember(
                    name: 'Finance & Marketing',
                    role: 'Akram Hossain',
                    link: 'https://www.linkedin.com/in/akram-hossain-59925872',
                  ),
                  _buildTeamMember(
                      name: 'ML Engineer',
                      role: 'Redwan Hossain',
                      link:
                          'https://www.linkedin.com/in/redwan-hossain-1334aa17b/'),
                  _buildTeamMember(
                    name: 'Technical Advisor',
                    role: 'Chandan Kumar Roy (PhD)',
                    link: 'https://www.linkedin.com/in/royck',
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              _buildContactSection(),
              const SizedBox(height: 24.0),
              const Center(
                child: Text(
                  '©2023-2025 Nevronus Systems',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Poultry Pal',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Poultry Pal is developed by Nevronus Systems to assist chicken farmers in detecting and preventing diseases affecting their flocks. Using AI, the app analyzes chicken droppings to provide indicative disease detection. However, consulting a registered veterinarian is always advised before taking action.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 12.0),
            Text(
              'With a user-friendly interface and expert-backed insights, Poultry Pal empowers farmers to manage poultry health efficiently, reducing disease risks and ensuring flock well-being.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      {required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Column(children: children),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember(
      {required String name, required String role, String? link}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Text(role,
                    style: const TextStyle(fontSize: 14.0, color: Colors.grey)),
              ],
            ),
          ),
          if (link != null)
            IconButton(
              icon: const Icon(Icons.link, color: Colors.blue),
              onPressed: () => _launchURL(link),
            ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            _buildContactItem(Icons.email, 'info@nevronus.com'),
            _buildContactItem(Icons.language, 'www.nevronus.com'),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 8.0),
        Text(text, style: const TextStyle(fontSize: 16.0)),
      ],
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
