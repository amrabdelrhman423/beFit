import 'package:flutter/material.dart';

class IntroItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color bg;
  final String imageUrl;

  const IntroItem(
      {Key key, @required this.title, this.subtitle, this.bg, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg ?? Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.white),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 20.0),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 40.0),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Material(
                      elevation: 4.0,
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
