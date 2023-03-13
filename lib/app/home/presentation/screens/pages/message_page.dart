import 'package:alex_messenger/config/app_paths.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 16,
      itemBuilder: (context, position) {
        return SizedBox(
          width: double.maxFinite,
          child: Row(
            children: [
              SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset(AppPath.userDefaultFill)
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cao Việt Đức', style: Theme.of(context).textTheme.subtitle1),
                    Row(
                      children: const [
                        Text(('Bạn đã gửi một tin nhắn')),
                        Expanded(child: SizedBox()),
                        Text('18p'),
                        SizedBox(width: 8.0)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}