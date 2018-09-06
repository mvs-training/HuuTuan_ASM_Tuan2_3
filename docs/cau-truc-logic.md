# Cấu Trúc Logic
## 2.1 Boot Sector
- Gồm một số sector đầu tiên của phân vùng (partition), trong đó:
### Sector đầu tiên (Boot Sector):
- Chứa các thông số quan trọng của phân vùng
- Chứa một đoạn chương trình nhỏ để nạp HĐH khi khởi động máy
### Các sector còn lại (nếu có):
- Chứa các thông tin hỗ trợ cho việc xác định tổng số cluster trống & tìm kiếm cluster trống được hiệu quả
- Chứa một sector bản sao của Boot sector.
![BOOT SECTOR](https://i.imgur.com/tStCYAG.png)
## 2.2 FAT – Root directory
- Mỗi đĩa trên máy tương ứng với một thư mục và được gọi là thư mục gốc (Root Directory). Trên thư mục gốc có thể chứa các tập tin hay các thư mục con (Sub Directory). Trong mỗi thư mục con có thể chứa các tập tin hay thư mục con khác.
- Được tổ chức thành các entry 32 byte .
- Mỗi entry lưu trữ thông tin đăng ký các file, các thư mục con hoặc các nhãn đĩa.
## 2.3 Cấu trúc Partition table
- Partition table là bảng thông số được duy trì bởi hệ điều hành với mục đích miêu tả các phân vùng trên disk.
- Nếu disk partition table bị mất, user không thể đọc, ghi data lên ổ đĩa.
![DISK PARTITION](https://i.imgur.com/AGJBmeH.png)
