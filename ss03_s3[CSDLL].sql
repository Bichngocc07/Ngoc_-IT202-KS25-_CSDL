SELECT FullName, Email
FROM CUSTOMERS
WHERE 
    City = 'Hà Nội'
    AND LastPurchaseDate < '2025-10-01'
    AND Email IS NOT NULL             
    AND Status = 'Active';      
-- 1. Phân tích bài toán (I/O)
-- Input: Bảng CUSTOMERS với hàng triệu bản ghi và hàng chục cột thông tin.

-- Output: Danh sách gồm 2 cột: FullName và Email.

-- Tại sao không nên dùng SELECT *? * Nghẽn cổ chai hệ 
-- thống: Việc lấy dư thừa hàng chục cột dữ liệu (Ngày sinh, Điểm thưởng, Địa chỉ...) 
-- từ hàng triệu dòng sẽ làm tăng gánh nặng cho I/O đĩa cứng và băng thông mạng.

-- Lãng phí RAM: Hệ thống gửi thư tự động chỉ cần Tên và Email, việc nạp quá nhiều 
-- dữ liệu không cần thiết vào bộ nhớ đệm (Cache) sẽ làm chậm các truy vấn khác.

-- 2. Thiết kế giải pháp (Logic WHERE)
-- Để lọc ra đúng tệp khách hàng "ngủ đông" và tránh lỗi hệ thống, mệnh đề WHERE 
-- cần hội đủ 4 điều kiện:

-- Địa điểm: Khách hàng ở Hà Nội (City = 'Hà Nội').

-- Thời gian: Không mua hàng hơn 6 tháng (Tính từ 01/04/2026 trở về trước, 
-- tức là LastPurchaseDate < '2025-10-01').

Dữ liệu sạch: Phải có Email để không làm crash hệ thống gửi thư (Email IS NOT NULL).

Trạng thái: Tài khoản phải đang hoạt động (Status != 'Locked').