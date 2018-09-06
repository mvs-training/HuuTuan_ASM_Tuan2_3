# Cấu Trúc Của Ổ Cứng
## 1. Cấu trúc vật lý của ổ đĩa
### 1.1.Track – Side – Cylinder - Sector
#### Track - rãnh từ
- Các vòng tròn đồng tâm trên mặt đĩa dùng để xác định các vùng lưu trũ dữ liệu riêng biệt trên mặt đĩa.
- Mặc định, các track không cố định, chúng sẽ thay đổi vị trí khi được định dạng ở cấp thấp (low format) nhằm tái cấu trúc cho phù hợp khi đĩa bị hư hỏng (bad block) do xuống cấp của phần cơ.
- Tập hợp các track cùng bán kính của mặt đĩa khác nhau để tạo thành các trụ (cylinder), có 1024 cylinder ( từ 0-1023 ). Mỗi ổ cứng sẽ có nhiều cylinder vì có nhiều đĩa từ khác nhau. 
#### Side:
- Số mặt đĩa
- Mỗi đĩa có hai mặt được đánh số là 0 và 1
- 


#### Sector - Cung từ
- Mỗi track được chia thành các đường hướng tâm tạo thành các sector (cung từ), Sector là đơn vị chứa dữ liệu nhỏ nhất, dung lượng 512 byte.
- Số sector trên các track từ phần rìa đĩa đên tâm đĩa là khác nhau, các ổ cứng đều chia ra 10 vùng, mỗi vùng có tỷ số sector/track bằng nhau.
#### Cylinder
- Tập hợp các track cùng bán kính (cùng số hiệu trên) ở các mặt đĩa khác nhau thành các cylinder. 
- Nói một cách chính xác hơn thì: khi đầu đọc/ghi đầu tiên làm việc tại một track nào thì tập hợp toàn bộ các track trên các bề mặt đĩa còn lại mà các đầu đọc còn lại đang làm việc tại đó gọi là cylinder (cách giải thích này chính xác hơn bởi có thể xảy ra thường hợp các đầu đọc khác nhau có khoảng cách đến tâm quay của đĩa khác nhau do quá trình chế tạo).
- Trên một ổ đĩa cứng có nhiều cylinder bởi có nhiều track trên mỗi mặt đĩa từ.
### 1.2 Đánh địa chỉ Sector
- Đánh số Sector bằng phương pháp cứng (Hard sectoring): Những lỗ đều nhau sẽ được bấm xung quanh đĩa và mỗi lỗ như thế có ý nghĩa đánh dấu sự bắt đầu một Sector. 
- Đánh số Sector mềm (Soft sectoring): Phương pháp này mã hóa địa chỉ của Sector thành dữ liệu của Sector đó và được gắn vào trước mỗi Sector. Vì Sector được đánh số tuần tự xung quanh Track nên địa chỉ của nó đơn giản là các số liên tiếp xung quanh Track.
- Phương pháp đánh số sector mềm được sử dụng rộng rãi hơn

### 1.3. Format vật lý
- Ghi toàn bộ địa chỉ sector, các thông tin khác vào phần đầu của sector được gọi là format vật lý hay format mức thấp
- Trong quá trình format phần mềm sẽ bắt bộ điều khiển đĩa tiến hành fomat những thông số về kích thước của một sector
- Format vật lý tục hiện trước khia đĩa được đưa vào sử dụng. Một quá trình độc lập thứ 2 format logic thực  hiện ngay sau đó trước khi lưu trữ dữ liệu

