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

-- 2. Hi???n th??? th??ng tin c???a t???t c??? nh??n vi??n c?? trong h??? th???ng c?? t??n b???t ?????u l??m???t trong c??c k?? t??? ???H???, ???T??? ho???c ???K??? v?? c?? t???i ??a 15 k?? t???.
select * from nhanvien where char_length(HoTen) <= 15 having HoTen like 'H%' or HoTen like 'T%' or HoTen like 'K%';
					   
-- 3. Hi???n th??? th??ng tin c???a t???t c??? kh??ch h??ng c?? ????? tu???i t??? 18 ?????n 50 tu???i v??c?? ?????a ch??? ??? ??????? N???ng??? ho???c ???Qu???ng Tr??????.
select * from khachhang where DiaChi like 'Da Nang' or DiaChi like 'Quang Tri'
								having NgaySinh between '1969-01-01' and '2003-01-01';

-- 4. ?????m xem t????ng ???ng v???i m???i kh??ch h??ng ???? t???ng ?????t ph??ng bao nhi??ul???n. K???t qu??? hi???n th??? ???????c s???p x???p t??ng d???n theo s??? l???n ?????t ph??ng c???akh??ch h??ng. Ch??? ?????m nh???ng kh??ch h??ng n??o c?? T??n lo???i kh??ch h??ng l?????Diamond???
select Hoten, count(HoTen) as solan from khachhang
join loaikhach
on khachhang.IdLoaiKhach = loaikhach.IdLoaiKhach
join hopdong
on khachhang.IdKhachHang = hopdong.IdKhachHang
where TenLoaiKhach like 'Diamond'
group by Hoten
order by count(HoTen);

-- 5. Hi???n   th???  IDKhachHang,   HoTen,   TenLoaiKhach,   IDHopDong,TenDichVu,   NgayLamHopDong,   NgayKetThuc,   TongTien  (V???iTongTien   ???????c   t??nh   theo   c??ng   th???c   nh??   sau:   ChiPhiThue   +SoLuong*Gia, v???i SoLuong v?? Gi?? l?? t??? b???ng DichVuDiKem) cho t???t c???c??c Kh??ch h??ng ???? t???ng ?????t ph???ng. (Nh???ng Kh??ch h??ng n??o ch??a t???ng?????t ph??ng c??ng ph???i hi???n th??? ra).

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

