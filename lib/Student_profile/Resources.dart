import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resources extends StatelessWidget {
  final List<Resource> resources = [
    Resource(
      title: 'Math Textbook',
      description: 'Comprehensive textbook for mathematics.',
    ),
    Resource(
      title: 'Physics Notes',
      description: 'Detailed notes on physics topics.',
    ),
    // Add more resources here
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Resources',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Color(0xFF0077B6),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: resources.length,
          itemBuilder: (context, index) {
            return ResourceDetail(
              resource: resources[index],
            );
          },
        ),
      ),
    );
  }
}

class Resource {
  final String title;
  final String description;

  Resource({
    required this.title,
    required this.description,
  });
}

class ResourceDetail extends StatelessWidget {
  final Resource resource;

  const ResourceDetail({
    required this.resource,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        title: Text(
          resource.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF0077B6),
            fontSize: 18,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            resource.description,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ),
        trailing: Icon(Icons.arrow_forward, color: Color(0xFF0077B6)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResourceDetailPage(resource: resource),
            ),
          );
        },
      ),
    );
  }
}

class ResourceDetailPage extends StatelessWidget {
  final Resource resource;

  const ResourceDetailPage({required this.resource});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            resource.title,
            style: TextStyle(color: Colors.white,),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Color(0xFF0077B6),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                resource.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0077B6),
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 16),
              Text(
                resource.description,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18,
                ),
              ),
              // Add more details about the resource here
            ],
          ),
        ),
      ),
    );
  }
}
