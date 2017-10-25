# BT-TMDT-2 - *H20_MESSAGE*

**Name of your app** là một bài tập môn TMDT. Ứng dụng cho phép người dùng gửi tin nhắn (email) cho người dùng khác.

Thành viên:
* [X] **1412145** Nguyễn Đức Hải (1412145)
* [ ] **1412169** Hồ Thảo Hiền (1412169)

URL: **https://h2o-message.herokuapp.com/**

## Yêu cầu

Sinh viên check vào các mục bên dưới và ghi mã sinh viên đã làm vào chức năng theo mẫu. Mục nào ko có MSSV là tính điểm theo nhóm. Cần sắp xếp các chức năng bên dưới theo thứ tự MSSV đã thực hiện.

Yêu cầu **GIT**:
* [X] Sử dụng GIT theo [Feature Branch Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows#feature-branch-workflow).

Yêu cầu **bắt buộc**
* [X] Đăng ký tài khoản bằng email, password, và tên.  (**1412145**)
* [X] Đăng nhập bằng email và password. (**1412145**)
* [X] Sau khi đăng nhập, người dùng sẽ được chuyển đến trang liệt kê danh sách các tin nhắn đã nhận, sắp xếp theo thứ tự thời gian, một nút để tạo tin nhắn mới, nút để xem danh sách bạn bè và nút để xem các tin nhắn đã gửi. (**1412145 + 1412169**)
* [X] Tin nhắn chưa đọc phải được làm nổi bật hơn các tin nhắn khác. (**1412145**)
* [X] Nhấn vào nút "xem danh sách bạn" sẽ chuyển người dùng đến trang liệt kê danh sách người dùng cùng với các chức năng thêm bạn. (**1412145**)
* [X] Nhấn nút "tạo tin nhắn" sẽ chuyển sang giao diện cho phép người dùng gửi tin nhắn cho người dùng trong danh sách bạn bè. Người gửi phải nằm trong danh sách bạn bè và cho phép người dùng chọn qua dropdown. (**1412145**)
* [X] Nhấn "xem tin đã gửi" sẽ chuyển sang giao diện hiển thị danh sách tin nhắn đã gửi. Mỗi tin nhắn cần hiện thời gian người nhận đã đọc. (**1412145**)
* [X] Mỗi người dùng chỉ có thể đọc tin nhắn 1 lần duy nhất. (**1412145**)
* [X] Người dùng chỉ có thể đọc tin nhắn khi họ nằm trong danh sách người nhận. (**1412145**)

Yêu cầu **không bắt buộc**:
* [X] Người dùng có thể block người khác. Sau khi block, người dùng sẽ không nhận được tin nhắn từ người bị block gửi nữa. (**1412145**)
* [X] Người dùng có thể unblock người dùng khác. (**1412145**)
* [X] Người dùng sẽ nhận được email thông báo khi họ nhận được tin nhắn. (**1412169**)

* [ ] Người dùng có thể gửi hình ảnh đính kèm theo thông điệp. 
* [ ] Người dùng có thể gửi tin nhắn đến nhiều người dùng cùng lúc. 
* [ ] Người dùng có thể đăng nhập với Facebook. 
* [X] Người dùng có thể xóa người dùng khác ra khỏi danh sách bạn. (**1412145**)
* [ ] Khi người dùng kéo xuống cuối trang, các tin nhắn tiếp theo sẽ tự động hiển thị hoặc có nút nhấn "Xem thêm tin nhắn" để nạp thêm danh sách tin nhắn. (**MSSV**)
* [ ] Người dùng sẽ nhận được email khi người nhận đã đọc tin nhắn. 
* [ ] Người dùng có thể gửi tin nhắn cho người dùng ngoài hệ thống. Khi đó, người nhận sẽ nhận được 1 email chứa link đăng ký tài khoản. Sau khi đăng ký tài khoản, họ có thể xem tin nhắn đã nhận. 

Liệt kê các **yêu cầu nâng cao** đã thực hiện:
* [X] Phân trang, mỗi trang chỉ load được 5 tin nhắn và có nút nhắn để qua trang tiếp theo. (**1412145**)
* [X] Giới hạn số lượng tin nhắn sẽ được xem, khoảng thời gian tin nhắn được gửi đến. (**141214**)

## Demo

Link video demo ứng dụng:
https://www.youtube.com/watch?v=RYsOPShWvg4



## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
