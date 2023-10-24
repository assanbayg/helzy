import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String editedText;
  final VoidCallback onTap;
  const PlanCard({
    super.key,
    required this.title,
    required this.editedText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 220,
        width: 250,
        child: Stack(children: [
          Positioned(
            top: 50,
            child: Container(
              height: 160,
              width: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.cyan.shade200,
                    Colors.red.shade200,
                  ],
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomEnd,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 55,
                width: 200,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                          size: 15,
                        ),
                        Text(
                          editedText,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              height: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.3),
              ),
              child: title == 'Treatment'
                  ? Image.asset('assets/images/treatment.png')
                  : Image.asset('assets/images/notifications.png'),
            ),
          ),
        ]),
      ),
    );
  }
}
