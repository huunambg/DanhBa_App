import 'package:flutter/material.dart';
import 'screen1.dart';

class Huongdan extends StatelessWidget {
  const Huongdan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hướng Dẫn'),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Bottombar()));
              },
              icon: Icon(Icons.keyboard_return_outlined)),
        ),
        body: ListView(
          children: [
            Text(
              '''Từ màn hình chính bạn hãy nhấn các phím số để hiển thị số điện thoại muốn thêm vào danh bạ.
 Sau đó bạn hãy nhấn phím mềm bên trái tương ứng với chức năng Tùy chọn  Options
  Trước tiên bạn truy cập vào ứng dụng Danh bạ 
  - Contacts theo hướng dẫn bên trên.

Trong màn hình Danh bạ, bạn hãy dùng các phím di chuyển 
- phím mũi tên để tìm và chọn mục Tìm 
- Search sau đó nhấn phím Ok hoặc mềm bên trái 
- tương ứng với chức năng Chọn - Select

Tiếp theo bạn sẽ được yêu cầu nhập tên của số điện thoại mà bạn đã lưu. Tại đây bạn có 2 lựa chọn:1
 - Nếu bạn nhớ tên của số điện thoại thì hãy nhập vào và nhấn phím Ok hoặc nhấn phím mềm bên trái 
 - tương ứng với chức năng Tìm - Search. Sẽ có 2 trường hợp xảy ra:
1.1 - Nếu tìm được số điện thoại với tên mà bạn đã lưu, bạn hãy nhấn phím Gọi 
- Dial key phím gọi 
- Dial Keyđể thực hiện cuộc gọi.
1.2 - Nếu không tìm được số điện thoại với tên mà bạn đã lưu, bạn hãy nhấn phím mềm bên trái
- tương ứng với chức năng Hiển thị tất cả 
- View all để hiển thị tất cả các số điện thoại đã lưu trong danh bạ. Bạn hãy dùng các phím di chuyển 
- phím mũi tên để tìm và chọn tên của số điện thoại rồi nhấn nhấn phím Gọi 
- Dial key phím gọi - Dial Keyđể thực hiện cuộc gọi.2 
- Nếu bạn không nhớ tên của số điện thoại thì nhấn phím mềm bên trái 
- tương ứng với chức năng Danh sách để hiển thị tất cả các số điện thoại đã lưu trong danh bạ. Bạn hãy dùng các phím di chuyển 
- phím mũi tên để tìm và chọn tên của số điện thoại rồi nhấn nhấn phím Gọi - Dial key phím gọi - Dial Keyđể thực hiện cuộc gọi ''',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
