   ĐỂ KHỞI CHẠY DỰ ÁN TEST BẰNG ROBOTFRAMEWORK TA PHẢI LÀM CÁC BƯỚC SAU 

1. Cài đặt Python

	Truy cập trang web "https://www.python.org/downloads/" để cài đặt Python
	Lưu ý : Vì Robotframework chỉ hỗ trợ Python từ phiên bản 3.6 đến 3.10 nên cần xem kỹ phiên bản Python khi cài vào máy
	Chạy file cài đặt và đảm bảo rằng phải chọn "Add Python to PATH" trước khi tiến hành cài đặt.

2. Cài đặt Robot Framework

	Sử dụng pip (công cụ quản lý gói Python) để cài đặt Robot Framework.
	Mở Command Prompt (Windows) hoặc Terminal (macOS/Linux).
	Chạy lệnh sau để cài đặt Robot Framework:

						"pip install robotframework"

3. Cài đặt thư viện Selenium

	Mở Command Prompt (Windows) hoặc Terminal (macOS/Linux).
	Chạy lệnh sau để cài đặt thư viện Selenium:

						"pip install robotframework-seleniumlibrary"
	
4. Xác ninh cài đặt

	Để kiểm tra xem Robot Framework đã được cài đặt thành công, ta chạy lệnh sau trong Command Prompt hoặc Terminal:

						"robot --version"

5. Mở dự án và tiến chạy chạy các testcase

	Mở Command Prompt (Windows) hoặc Terminal (macOS/Linux).
	Chạy lệnh sau để mở Robotframework:
			
						"ride.py"

	Sau khi hiển thị giao diện của Robotframwork ta tiến hành mở dự án test bằng cách : 
		Bước 1 : Chọn "File"
		Bước 2 : Chọn "Open Directory" để mơ thư mục source của testcase
		Bước 3 : Chọn các project muốn test trong thư mục source
		Bước 4 : Chọn "Run" và chờ các testcase được thực hiện








