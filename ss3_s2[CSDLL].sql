INSERT INTO SHIPPERS (ShipperName, Phone) 
VALUES ('Giao Hàng Nhanh', '0901234567');

INSERT INTO SHIPPERS (ShipperName, Phone) 
VALUES ('Viettel Post', '0912345678');
-- 1. Phân tích logic: 2 lỗi nghiêm trọng
-- Lỗi 1 (Dòng lệnh 1 - Syntax Error): Thiếu dấu nháy đơn kết thúc cho giá trị tên đối tác.

-- Chi tiết: Code đang viSết 'Giao Hàng Nhanh. Việc thiếu dấu đóng ' khiến SQL Engine 
-- không xác định được điểm kết thúc của chuỗi ký tự, dẫn đến lỗi cú pháp.

-- Lỗi 2 (Dòng lệnh 2 - Dữ liệu bị "Kẹt"/NULL): Thiếu liệt kê danh sách cột và thiếu 
-- giá trị cho cột Phone.

-- Chi tiết: Câu lệnh INSERT INTO SHIPPERS VALUES ('Viettel Post'); sẽ bị lỗi hoặc làm 
-- cột Phone bị NULL vì bảng có 2 cột dữ liệu (không tính ID tự tăng) nhưng bạn chỉ cung 
-- cấp 1 giá trị. Khi không chỉ định rõ cột 
-- nào nhận giá trị nào, hệ thống sẽ bị "lệch" hoặc từ chối lưu.