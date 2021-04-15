create table LoaiDichVu (
	IdLoaiDichVu int not null primary key auto_increment,
    TenLoaiDichVu varchar(45)
);

create table DichVu (
	IdDichVu int not null primary key auto_increment,
    TenDichVu varchar(45),
    DienTich int,
    SoTang int,
    SoNguoiToiDa varchar(45),
    ChiPhiThue varchar(45),
    IdKieuThue int,
    IdLoaiDichVu int,
    TrangThai varchar(45),
    FOREIGN KEY (IdKieuThue) REFERENCES kieuthue(IdKieuThue),
    FOREIGN KEY (IdLoaiDichVu) REFERENCES loaidichvu(IdLoaiDichVu)
);

create table KieuThue (
	IdKieuThue int not null primary key auto_increment,
    TenKieuThue varchar(45),
    Gia int
);

create table LoaiKhach (
	IdLoaiKhach int not null primary key auto_increment,
    TenLoaiKhach varchar(45)
); 

create table KhachHang (
	IdKhachHang int not null primary key auto_increment,
    IdLoaiKhach int,
	FOREIGN KEY (IdLoaiKhach) REFERENCES loaikhach(IdLoaiKhach),
    HoTen varchar(45),
    NgaySinh date,
    SoCMND varchar(45),
    SDT varchar(45),
    Email varchar(45),
    DiaChi varchar(45)
);

create table ViTri (
	IdVitri int not null primary key auto_increment,
    TenVitri varchar(45)
);

create table TrinhDo (
	IdTrinhDo int not null primary key auto_increment,
    TenTrinhDo varchar(45)
);

create table BoPhan (
	IdBoPhan int not null primary key auto_increment,
    TenBoPhan varchar(45)
);

create table NhanVien (
	IdNhanVien int not null primary key auto_increment,
    HoTen varchar(45),
    IdViTri int,
    FOREIGN KEY (IdViTri) REFERENCES vitri(IdVitri),
    IdTrinhDo int,
    FOREIGN KEY (IdTrinhDo) REFERENCES trinhdo(IdTrinhDo),
    IdBoPhan int,
    FOREIGN KEY (IdBoPhan) REFERENCES bophan(IdBoPhan),
    NgaySinh date,
    SoCMND varchar(45),
    Luong varchar(45),
    SDT varchar(45),
	Email varchar(45),
	DiaChi varchar(45)
);

create table DichVuDiKem (
	IdDichVuDiKem int not null primary key auto_increment,
    TenDichVUDiKem varchar(45),
    Gia int,
    DonVi int,
    TrangThaiKhaDung varchar(45)
);

create table HopDong (
	IdHopDong int not null primary key auto_increment,
    IdNhanVien int,
    foreign key (IdNhanVien) references nhanvien(IdNhanVien),
    IdKhachHang int,
    foreign key (IdKhachHang) references khachhang(IdKhachHang),
    IdDichVu int,
    foreign key (IdDichVu) references dichvu(IdDichVu),
    NgayLamHopDong date,
    NgayKetThuc date,
    TienDatCoc int,
    TongTien int
);

create table HopDongChiTiet (
	IdHopDongChiTiet int primary key auto_increment,
    IdHopDong int,
    foreign key (IdHopDong) references hopdong(IdHopDong),
    IdDichVuDiKem int,
    foreign key (IdDichVuDiKem) references dichvudikem(IdDichVuDiKem),
    SoLuong int
);

-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu làmột trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select * from nhanvien where char_length(HoTen) <= 15 having HoTen like 'H%' or HoTen like 'T%' or HoTen like 'K%';
					   
-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi vàcó địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khachhang where DiaChi like 'Da Nang' or DiaChi like 'Quang Tri'
								having NgaySinh between '1969-01-01' and '2003-01-01';

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
join dichvu dv
on hd.IdDichVu = dv.IdDichVu


select kh.IdKhachHang, HoTen, TenLoaiKhach, hd.IdHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien
from hopdong hd
join khachhang kh
on hd.IdKhachHang = kh.IdKhachHang
join loaikhach lk
on kh.IdLoaiKhach = lk.IdLoaiKhach
join dichvu dv
on hd.IdDichVu = dv.IdDichVu 

