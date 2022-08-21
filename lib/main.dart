import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'Passadd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PassWord486',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PassWord486(),
    );
  }
}

/// 버킷 클래스
class Add {
  String idpassword; // 할 일
  // bool isDone; // 완료 여부

  Add(this.idpassword); // 생성자
}

class PassWord486 extends StatefulWidget {
  const PassWord486({Key? key}) : super(key: key);

  @override
  State<PassWord486> createState() => _PassWord486State();
}

class _PassWord486State extends State<PassWord486>
    with SingleTickerProviderStateMixin {
  List<Add> password486List = []; // 전체 버킷리스트 목록

  final textController = TextEditingController();

  late Animation<double> _animation;
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PassWord486"),
      ),
      body: password486List.isEmpty
          ? Center(child: Text("+ 버튼을 눌러 내용을 추가해 주세요."))
          : ListView.builder(
              itemCount: password486List.length, // bucketList 개수 만큼 보여주기
              itemBuilder: (context, index) {
                Add idpass = password486List[index]; // index에 해당하는 bucket 가져오기
                return ListTile(
                  // 버킷 리스트 할 일
                  title: Text(
                    idpass.idpassword,
                    style: TextStyle(
                      fontSize: 20,
                      //     color: idpass.isDone ? Colors.grey : Colors.black,
                      //     decoration: idpass.isDone
                      //         ? TextDecoration.lineThrough
                      //         : TextDecoration.none,
                    ),
                  ),
                  // 삭제 아이콘 버튼
                  trailing: IconButton(
                    icon: Icon(CupertinoIcons.delete),
                    onPressed: () {
                      // 삭제 버튼 클릭시
                      showDeleteDialog(context, index);
                    },
                  ),
                  // onTap: () {
                  //   // 아이템 클릭시
                  //   setState(() {
                  //     idpass.isDone = !idpass.isDone;
                  //   });
                  // },
                );
              },
            ),
      floatingActionButton: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
            icon: Icons.settings,
            iconColor: Colors.white,
            title: "비밀번호 추가",
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            bubbleColor: Colors.blue,
            onPress: () async {
              String? idpassword = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Passadd()),
              );
              if (idpassword != null) {
                setState(() {
                  Add newAdd = Add(
                    idpassword,
                  );
                  password486List.add(newAdd);
                });
              }

              // Navigator.pushReplacement(
              //     context, MaterialPageRoute(builder: (context) => Passadd()));
            },
          ),
          Bubble(
            icon: Icons.settings,
            iconColor: Colors.white,
            title: "메모 추가",
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            bubbleColor: Colors.blue,
            onPress: () {
              _animationController.reverse();
            },
          ),
          Bubble(
            icon: Icons.settings,
            iconColor: Colors.white,
            title: "사진 추가",
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            bubbleColor: Colors.blue,
            onPress: () {
              _animationController.reverse();
            },
          ),
          Bubble(
            icon: Icons.settings,
            iconColor: Colors.white,
            title: "새폴더 추가",
            titleStyle: TextStyle(fontSize: 16, color: Colors.white),
            bubbleColor: Colors.blue,
            onPress: () {
              _animationController.reverse();
            },
          )
        ],

        //animation controller
        animation: _animation,

        onPress: () => _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward(),

        iconColor: Colors.red,
        iconData: Icons.add,
        backGroundColor: Colors.yellow,

//--------------------------------------------------------------------
        // child: Icon(Icons.add),
        //onPressed:
        //     () async {
        // + 버튼 클릭시 버킷 생성 페이지로 이동

        //   String? password486List = await Navigator.push(
        //     context,

        //     MaterialPageRoute(builder: (_) => Passadd()),
        //   );
        //   if (idpassword != null) {
        //     setState(() {
        //       Add newAdd = Add(idpassword);
        //       password486List.add(newAdd); // 버킷 리스트에 추가
        //     });
        //   }
        // },

//--------------------------------------------------------------------
      ),
    );
  }

//----------------------------------------------------------------------
  void showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("정말로 삭제하시겠습니까?"),
          actions: [
            // 취소 버튼
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("취소"),
            ),
            // 확인 버튼
            TextButton(
              onPressed: () {
                setState(() {
                  // 삭제
                  password486List.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text(
                "확인",
                style: TextStyle(color: Colors.pink),
              ),
            ),
          ],
        );
      },
    );
  }
}
