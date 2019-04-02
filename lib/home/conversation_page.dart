import 'package:flutter/material.dart';
import '../constants.dart' show AppColors, AppStyles, Constants;
import '../modal/conversation.dart';

class _CoversationItem extends StatelessWidget {
  const _CoversationItem({Key key, this.conversation}) 
    : assert(conversation != null),
    super(key: key);
  final Conversation conversation;
  @override
  Widget build(BuildContext context) {
    // 根据图片来源初始化图像组件；
    Widget avatar;
    if(conversation.isAvatarFromNet()){
      avatar = Image.network(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    }else{
      avatar = Image.asset(
        conversation.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    }

    Widget avatarContainer;
    if(conversation.unreadMsgCount > 0) {
       // 未读消息
      Widget unreadMsgCountText = Container(
        width: Constants.UnreadMsgNotifyDotSize,
        height: Constants.UnreadMsgNotifyDotSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.UnreadMsgNotifyDotSize / 2),
          color: Color(AppColors.NotifyDotBg),
        ),
          child: Text(conversation.unreadMsgCount.toString(), style: AppStyles.UnreadMsgCountDotStyle),
      );

      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
            right: -6.0,
            top: -6.0,
            child: unreadMsgCountText,

          ),
        ],
      );
    } else {
      avatarContainer = avatar;
    }

    // 勿扰模式图标
    var _rightArea = <Widget>[
      Text(conversation.updateAt, style: AppStyles.DesStyle,),
      // Container(height: 10.0,),
      SizedBox(height: 10.0),
    ];
    if(conversation.isMute) {
      _rightArea.add(Icon(
        IconData(
          0xe62b,
          fontFamily:Constants.IconFontFamily,
        ),
        color: Color(AppColors.ConversationMuteIcon),
        size: Constants.ConversationMuteIconSize,
      ));
    } else {
      _rightArea.add(Icon(
        IconData(
          0xe62b,
          fontFamily:Constants.IconFontFamily,
        ),
        color: Colors.transparent,
        size: Constants.ConversationMuteIconSize,
      ));
    }


    return Container(
      decoration: BoxDecoration(
        color: Color(AppColors.ConversationItemBg),
        border: Border(
          bottom: BorderSide(
            color: Color(AppColors.DividerColor),
            width: Constants.DividerWidth,
          )
        )
      ),
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          avatarContainer,
          Container(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[
                Text(conversation.title, style: AppStyles.TitleStyle,),
                Text(conversation.des, style: AppStyles.DesStyle,)
              ],
            ),
          ),
          Container(
            width: 10,
          ),
          Column(
            children: _rightArea,
          )
        ],
      ),
    );
  }
}

class ConversationPage extends StatefulWidget {
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _CoversationItem(conversation: mockConversations[index],);
      },
      itemCount: mockConversations.length,
    );
  }
}