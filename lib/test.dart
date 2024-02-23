import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Testabc extends StatelessWidget {
  const Testabc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('emerGen-Z'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    _showPopup(context);
                  },
                  child: const Text(
                    'Find Near Me',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildGrid(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 15, // Number of buttons in the grid
      itemBuilder: (BuildContext context, int index) {
        return _buildGridItem(index);
      },
    );
  }

  Widget _buildGridItem(int index) {
    // Replace the icons and phrases as needed
    List<IconData> icons = [
      Icons.security,
      Icons.emergency,
      Icons.fire_extinguisher,
      Icons.female,
      Icons.directions_railway,
      Icons.warning,
      Icons.railway_alert,
      Icons.taxi_alert,
      Icons.healing,
      Icons.warning,
      Icons.directions_walk,
      Icons.child_care,
      Icons.accessibility,
      Icons.shield,
      Icons.phone
    ];
    List<String> phrases = [
      'Police',
      'Ambulance',
      'Firetruck',
      'Women Helpline',
      'Railway Enquiry',
      'National Emergency',
      'Railway Accident Emergency',
      'Road Accident Emergency',
      'Disaster Management',
      'LPG Leak',
      'Tourist Helpline',
      'Child in Distress',
      'Senior Citizen Helpline',
      'Women (Domestic Abuse)',
      'AIDS Helpline'
    ];
    List<Color> buttonColors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.cyan,
      Colors.pink,
      Colors.green,
      Colors.amber,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.pink
    ];
    List<String> phoneNumbers = [
      '100', // Police
      '102', // Ambulance
      '101', // Firetruck
      '1091', // Women Helpline
      '139', // Railway Enquiry
      '112', // National Emergency
      '1072',
      '1073',
      '108',
      '1906',
      '1363',
      '1098',
      '14567',
      '181',
      '1097'
    ];

    return ElevatedButton(
      onPressed: () {
        _callNumber(phoneNumbers[index]);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColors[index], // Set the button color
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icons[index],
            size: 35,
            color: Colors.black,
          ),
          const SizedBox(height: 8),
          Text(
            phrases[index],
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13.0, // Set a specific text size for the button
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose an option'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    launchUrlString(
                        'https://www.google.com/maps/search/?api=1&query=doctor+near+me');
                    Navigator.pop(context); // Close the popup
                    // Add your logic here
                  },
                  icon: const Icon(Icons.medical_services, size: 30),
                  label: const Text(
                    'Doctors',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    launchUrlString(
                        'https://www.google.com/maps/search/?api=1&query=pharmacy+near+me');
                    Navigator.pop(context); // Close the popup
                    // Add your logic here
                  },
                  icon: const Icon(Icons.local_pharmacy, size: 30),
                  label: const Text(
                    'Pharmacies',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    launchUrlString(
                        'https://www.google.com/maps/search/?api=1&query=hospital+near+me');
                    Navigator.pop(context); // Close the popup
                    // Add your logic here
                  },
                  icon: const Icon(Icons.local_hospital, size: 30),
                  label: const Text(
                    'Hospitals',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    launchUrlString(
                        'https://www.google.com/maps/search/?api=1&query=police+station+near+me');
                    Navigator.pop(context); // Close the popup
                    // Add your logic here
                  },
                  icon: const Icon(Icons.local_police, size: 30),
                  label: const Text(
                    'Police Stations',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

//_callNumber('8976247365');
  void _callNumber(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
