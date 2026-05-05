ALTER TABLE USERS MODIFY Phone VARCHAR(15) NOT NULL;

-- Giải pháp A: Sửa trực tiếp (Direct Alter)
-- Dùng lệnh ALTER TABLE USERS MODIFY Phone VARCHAR(15);.
-- Cơ chế: DB Engine sẽ khóa bảng, chuyển đổi từng dòng dữ liệu từ INT sang VARCHAR, 
-- sau đó ghi lại.
-- Giải pháp B: Thêm cột mới (Shadow Column / Online Migration)
-- Tạo một cột mới Phone_v2, đồng bộ dữ liệu từ cột cũ sang, sau đó đổi tên cột.
-- Cơ chế: Tạo cột VARCHAR(15) mới, dùng lệnh UPDATE để copy dữ liệu (có xử lý thêm số '0'
--  ở đầu), sau đó 
-- xóa cột cũ và đổi tên cột mới.