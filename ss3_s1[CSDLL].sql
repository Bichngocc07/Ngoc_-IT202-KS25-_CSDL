UPDATE PRODUCTS
SET OriginalPrice = OriginalPrice * 0.9
WHERE Category = 'Electronics';
-- 1. Phân tích Logic
-- Lỗi sai: Thiếu mệnh đề WHERE trong câu lệnh UPDATE.
-- Nguyên nhân: Trong SQL, nếu không có điều kiện WHERE, câu lệnh UPDATE sẽ 
-- áp dụng thay đổi lên tất cả các bản ghi trong bảng.
-- Hậu quả: Khiến 10.000 mặt hàng (bao gồm cả rau, sữa...) đều bị giảm giá 10% thay vì chỉ riêng
--  đồ điện tử, gây thất thoát doanh thu nghiêm trọng.