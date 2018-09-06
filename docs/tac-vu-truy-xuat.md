# Các tác vụ truy xuất đĩa
## 3.1 Mức BIOS
- thực hiện thông qua ngắt 13h và chức năng con trong thanh ghi AH
### Reset đĩa 
Vào: AH = 0
DL = số hiệu đĩa vật lí (0=đĩa A, 1=đĩa B ..... 080=đĩa cứng).
Nếu DL là 80h hay 81h, bộ điều khiển đĩa cứng sẽ reset sau đó đến bộ điều khiển đĩa mềm.
Ra: Không 
### Lấy mã lỗi
Vào: AH = 1
DL = đĩa vật lí. Nếu DL=80h lấy lỗi của đĩa mềm
DL=7Fh lấy lỗi của đĩa cứng.
Ra: AL chứa mã lỗi.
Một số mã lỗi thường gặp được liệt kê sau đây:
- MÃ LỖI
0. 00h Không gặp lỗi
1. 01h Sai lệnh hoặc lệnh không hợp lệ.
2. 03h Ghi vào đĩa có dán nhãn chống ghi.
3. 04h Sector ID sau hay không tìm thấy.
4. 05h Reset gặp lỗi.
5. 10h Bad CRC: CRC không hợp lệ khi dữ liệu trên sector được kiểm tra.
6. 20h Controller gặp lỗi.
7. 40h Seek gặp lỗi, track yêu cầu không tìm thấy.
8. 80h Ðĩa không sẵn sàng.
9. 0BBh Lỗi không xác định. 
### Đọc Sector
Vào: AH=2
DL=số hiệu đĩa (0=đĩa A, ..., 80h=đĩa cứng 0, 81h=
đĩa cứng 1);
DH=số đầu đọc ghi.
CH= số track (Cylinder)
CL=số sector.
AL=số sector cần đọc/ghi 
Ra: CF=1 nếu có lỗi và mỰ lỗi chứa trong AH 
### Ghi Sector
Vào: AH=3
ES:BX trỏ đến buffer chứa dữ liệu
còn lại tương tự như chức năng đọc sector.
Ra: CF=1 nếu có lỗi và mã lỗi chứa trong AH. 
### Verify sector
Chức năng này cho phép kiểm tra CRC của các sector được chọn.
Vào: AH=4
Ra: CF=1 nếu có lỗi và mã lỗi chứa trong AH 
## 3.2 Mức DOS
Chức năng đọc và ghi đĩa dưới DOS được phân biệt bởi hai ngắt 25h và 26h, tham số đưa vào bây giờ chỉ còn là sector logic ,gọi các đĩa theo thứ tự các chữ cái từ A đến Z .
Vào: AL=số đĩa (0=A, 1=B, ...)
- CX=số lượng sector cần đọc/ghi
- DX=số sector logic bắt đầu.
- DS:BX=địa chỉ của buffer chứa dữ liệu cho tác vụ đọc/ghi
Ra: Lỗi nếu CF=1, mã lỗi trong AX. Ngược lại, tác vụ đọc/ghi được thực hiện thành công, các giá trị thanh ghi đều bị phá hủy, trừ các thanh ghi phân đoạn và một word còn sót lại trên stack. 

## 3.3 Các giải thuật chuyển đổi định vị 
### Chuyển đổi
### Định vị
## 3.4 Phân tích boot
### Partition table:
+ Chuyển chính chương trình của mình đi chỗ khác để dọn chỗ cho việc tải Boot record của Active partition vào.
+ Kiểm tra dấu hiệu nhận diện Boot record bằng 1 giá trị word ở off 01BEh (nếu là Boot record, giá trị này là 0AA55h).
+ Cung cấp bảng tham số của entry t-ơng ứng vào 0:7BE.
+ Chuyển quyền điều khiển cho Boot record vừa đọc 
### Boot sector:
+ Khởi tạo ngắt 1Eh (bảng tham số đĩa mềm) bằng bảng tham số trong Boot sector (nếu có điều kiện, các bạn có thể nên quan tâm đến sự thay đổi các tham số đĩa mềm qua version khác nhau của DOS).
+ Ðịnh vị các phần trên đĩa bằng bảng tham số BPB (như chúng ta đỰ khảo sát).
+ Ðọc Root vào và kiểm tra sự tồn tại của hai file hệ thống.
+ Nếu có, tải hai file này vào và trao quyền điều khiển. 

