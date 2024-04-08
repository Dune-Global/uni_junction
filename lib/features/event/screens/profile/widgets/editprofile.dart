import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(children: [
            SizedBox(
              width: 150,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Image(
                    image: NetworkImage(
                        'https://avatar.iran.liara.run/public/21')),
              ),
            ),
            Positioned(
              child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20,
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
