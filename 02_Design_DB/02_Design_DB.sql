-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu làmột trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select * from nhanvien where char_length(HoTen) <= 15 and (HoTen like 'H%' or HoTen like 'T%' or HoTen like 'K%');
					   
-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khachhang where NgaySinh between '1969-01-01' and '2003-01-01'
						and (DiaChi like 'Da Nang' or DiaChi like 'Quang Tri');
							

-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêulần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng củakhách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là“Diamond”
select Hoten, count(HoTen) as solan from khachhang
join loaikhach
on khachhang.IdLoaiKhach = loaikhach.IdLoaiKhach
join hopdong
on khachhang.IdKhachHang = hopdong.IdKhachHang
where TenLoaiKhach like 'Diamond'
group by Hoten
order by count(HoTen);

-- 5. Hiển   thị  IDKhachHang,   HoTen,   TenLoaiKhach,   IDHopDong,TenDichVu,   NgayLamHopDong,   NgayKetThuc,   TongTien  (VớiTongTien   được   tính   theo   công   thức   như   sau:   ChiPhiThue   +SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cảcác Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từngđặt phòng cũng phải hiển thị ra).

update hopdong hd
join hopdongchitiet hdct
on hd.IdHopDong = hdct.IdHopDongChiTiet
join dichvudikem dvdk
on dvdk.IdDichVuDiKem = hdct.IdHopDongChiTiet
join dichvu dv
on hd.IdDichVu = dv.IdDichVu
set hd.TongTien = dv.ChiPhiThue + hdct.SoLuong * dvdk.Gia;

select kh.IdKhachHang, HoTen, TenLoaiKhach, hd.IdHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien
from khachhang kh
left join hopdong hd
on hd.IdKhachHang = kh.IdKhachHang
left join loaikhach lk
on kh.IdLoaiKhach = lk.IdLoaiKhach
left join dichvu dv
on hd.IdDichVu = dv.IdDichVu; 

-- 6.Hiển thị IDDichVu,     TenDichVu,     DienTich,     ChiPhiThue,TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàngthực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

select dv.IdDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu
from dichvu dv
join loaidichvu ldv
on dv.IdDichVu = ldv.IdLoaiDichVu
join hopdong hd
on dv.IdDichVu = hd.IdDichVu
where not hd.NgayLamHopDong between '2019-01-01' and '2019-03-01';
	
-- 7 .Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2018 nhưng chưa từng được khách hàng đặt phòng  trong năm 2019.

select dv.IdDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu
from dichvu dv
join loaidichvu ldv
on dv.IdDichVu = ldv.IdLoaiDichVu
join hopdong hd
on dv.IdDichVu = hd.IdHopDong
where not hd.NgayLamHopDong between '2019-01-01' and '2019-12-31'
and hd.NgayLamHopDong between '2018-01-01' and '2018-12-31';	

-- 8. Hiển thị thông tin HoTenKhachHang  có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau. Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

select distinct HoTen from khachhang; 
select HoTen from khachhang union select HoTen from khachhang;
select HoTen from khachhang group by HoTen;

-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select hopdong.IdHopDong, NgayLamHopDong,NgayKetThuc,TienDatCoc,SoLuong,count(IdHopDongChiTiet) 
from hopdong 
join hopdongchitiet 
on hopdong.IdHopDong= hopdongchitiet.IdHopDong
group by IdHopDong;

-- 10. Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêuDịch   vụ   đi   kèm.   Kết   quả   hiển   thị   bao   gồm  IDHopDong,NgayLamHopDong,NgayKetthuc,TienDatCoc,SoLuongDichVuDiKem   (được   tính   dựa   trên   việc   count   cácIDHopDongChiTiet).

 select hd.idHopDong, hd.NgayLamHopDong, hd.NgayKetThuc, hd.TienDatCoc, count(hdct.IdHopDongChiTiet) as 'so luong' 
 from hopdong hd 
 join hopdongchitiet hdct 
 on hd.idHopDong = hdct.idHopDong
 group by hd.idHopDong;

-- 11. Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Kháchhàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh”hoặc “Quảng Ngãi”.

select dvdk.IDDichVuDiKem, dvdk.TenDichVuDiKem, dvdk.gia, dvdk.DonVi, dvdk.TrangThaiKhaDung
from dichvudikem dvdk  
left join hopdongchitiet hdct 
on dvdk.IDDichVuDiKem=hdct.IDDichVuDiKem  
left join hopdong hd 
on hd.IDHopDong=hdct.IDHopDong  
left join khachhang kh 
on kh.IDKhachHang=hd.IDKhachHang
left join loaikhach lk 
on lk.IDLoaiKhach=kh.IDLoaiKhach
where kh.DiaChi like 'Vinh' or kh.DiaChi like 'Quang Ngai';


-- 12. Hiển   thị   thông   tin  IDHopDong,   TenNhanVien,   TenKhachHang,SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (đượctính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụđã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưatừng được khách hàng đặt vào 6 tháng đầu năm 2019.
-- 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi cácKhách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sửdụng nhiều như nhau).
-- 14. Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng mộtlần duy nhất. Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu,TenDichVuDiKem, SoLanSuDung.

 select hd.idHopDong, dvdk.tenDichVuDiKem, sum(hdct.SoLuong) as 'so lan' 
 from hopdong hd 
 join hopdongchitiet hdct 
 on hd.idHopDong = hdct.idHopDong
 join dichvudikem dvdk 
 on dvdk.idDichVuDiKem = hdct.idDichVuDiKem
 join dichvu dv 
 on dv.idDichVu = hd.idDichVu
 group by dvdk.tenDichVuDiKem
 having sum(hdct.SoLuong)  = 1
 ;


-- 15. Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen,TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3hợp đồng từ năm 2018 đến 2019.

 select nv.idNhanVien, nv.HoTen , nv.SDT, nv.NgaySinh, td.TenTrinhDo, bp.TenBoPhan, count(hd.idHopDong) as 'so lan', hd.NgayLamHopDong
 from nhanvien nv 
 join hopdong hd 
 on hd.idNhanVien = nv.idNhanVien
 join trinhdo td
 on td.idTrinhDo = nv.idTrinhDo
 join bophan bp 
 on bp.idBoPhan = nv.idBoPhan
 where NgayLamHopDong between '2018-01-01' and '2019-12-31'
 group by nv.idNhanVien
 having count(hd.idHopDong) <=3
 ;

-- 16. Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017đến năm 2019.
-- 17. Cập   nhật   thông   tin   những   khách   hàng   có  TenLoaiKhachHang   từPlatinium  lên  Diamond, chỉ cập nhật những khách hàng đã từng đặtphòng   với  tổng   Tiền   thanh   toán   trong   năm   2019   là   lớn   hơn10.000.000 VNĐ.






-- câu18. Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộcgiữa các bảng).

delete from khachhang where IDKhachHang = (select IDKhachHang from  hopdong
											where year(NgayLamHopDong) < 2016);
				
		
-- câu19. Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trongnăm 2019 lên gấp đôi.
update dichvudikem 
set gia = gia*2
where iddichvudikem in (select a.iddichvudikem 
						from hopdongchitiet a, hopdong b where soluong>0 and year(b.ngaylamhopdong) = 2019);
 
-- câu 20. Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệthống, thông tin hiển thị bao gồm  ID   (IDNhanVien,   IDKhachHang),HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
SELECT IdKhachHang as id,hoten,email,SoCMND,ngaysinh,diachi FROM khachhang
UNION 
SELECT IdNhanVien as id,hoten,email,SoCMND,ngaysinh,diachi FROM nhanvien;