import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/chat/cubit/chat_cubit.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/chat/cubit/chat_state.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/chat/widget/header_chat.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/chat/widget/reciver_widget.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/chat/widget/sender_widget.dart';

import '../../cubit/home_cubit.dart';

class ChatPageArguments {
  final int entrepreneurId;
  final int userId;

  ChatPageArguments({
    required this.entrepreneurId,
    required this.userId,
  });
}

class ChatPage extends StatefulWidget {
  final int entrepreneurId;
  final int userId;
  const ChatPage(
      {super.key, required this.entrepreneurId, required this.userId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(274),
        child: HeaderChat(),
      ),
      bottomSheet: Container(
        height: 55,
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 220,
              child: TextFormField(
                controller: _messageController,
                decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    label: Text('Escreva aqui ...')),
              ),
            ),
            InkWell(
                onTap: () {
                  try {
                    ReadContext(context).read<ChatCubit>().sendMessage(
                        entrepreneurId: widget.entrepreneurId,
                        userId: widget.userId,
                        message: _messageController);
                  } catch (e) {
                    print(e);
                  }
                },
                child: Image.asset('assets/images/send_image.png'))
          ],
        ),
      ),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          state.status.matchAny(
              success: () {
                setState(() {});
              },
              init: () {},
              any: () {});
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(8),
            height: 0.8.sh,
            child: ListView.separated(
                controller: _scrollController,
                itemCount: state.chat?.messages?.length ?? 0,
                itemBuilder: (context, index) {
                  final message = state.chat?.messages?[index];
                  return Column(
                    children: [
                      message?.senderId == widget.userId
                          ? Align(
                              alignment: Alignment.centerRight,
                              child: SenderWidget(message: message),
                            )
                          : Align(
                              alignment: Alignment.centerLeft,
                              child: ReciverWidget(message: message),
                            )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  final message = state.chat?.messages?[index];
                  return message?.senderId == widget.userId
                      ? const SizedBox(
                          height: 5,
                        )
                      : const SizedBox(
                          height: 10,
                        );
                }),
          );
        },
      ),
    );
  }
}
