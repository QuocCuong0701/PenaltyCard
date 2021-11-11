drop database if exists penalty;
create database penalty;
use penalty;
-- giai dau
drop table if exists giai_dau;
create table giai_dau (
    id int primary key auto_increment not null,
    ma_giai_dau varchar(255),
    ten_giai_dau varchar(2255)
);
-- vong dau
drop table if exists vong_dau;
create table vong_dau (
    id int primary key auto_increment not null,
    giai_dau_id int(10),
    ma_vong_dau varchar(255),
    ten_vong_dau varchar(255)
);
-- tran dau doi bong
drop table if exists tran_dau_doi_bong;
create table tran_dau_doi_bong (
    id int primary key auto_increment not null,
    tran_dau int(10),
    doi_bong int(10),
    ma varchar(255),
    ghi_chu varchar(255)
);
-- doi bong
drop table if exists doi_bong;
create table doi_bong (
    id int primary key auto_increment not null,
    ma_doi varchar(255),
    ten_doi varchar(255),
    trang_phuc_truyen_thong varchar(255),
    mo_ta varchar(255)
);
-- cau thu
drop table if exists cau_thu;
create table cau_thu (
    id int primary key auto_increment not null,
    doi_bong_id int(10),
    ma_cau_thu varchar(255),
    ten_cau_thu varchar(255),
    nam_sinh int(10),
    vi_tri varchar(255),
    chan_thuan varchar(255),
    chieu_cao int(10),
    can_nang int(10),
    dac_diem varchar(255)
);
-- san dau
drop table if exists san_dau;
create table san_dau (
    id int primary key auto_increment not null,
    ma_san varchar(255),
    ten_san varchar(255),
    dia_chi varchar(255)
);
-- tran dau
drop table if exists tran_dau;
create table tran_dau (
    id int primary key auto_increment not null,
    vong_dau_id int(10),
    ket_qua_id int(10),
    san_dau_id int(10),
    ngay varchar(255),
    gio varchar(255),
    danh_sach_trong_tai varchar(255),
    danh_sach_doi_bong varchar(255)
);
-- ket qua
drop table if exists ket_qua;
create table ket_qua (
    id int primary key auto_increment not null,
    ban_to_chuc_id int(10),
    tran_dau_id int(10),
    so_the_vang int(10),
    so_the_do int(10),
    so_ban_thang int(10),
    so_pha_pham_loi int(10)
);
-- trong tai
drop table if exists trong_tai;
create table trong_tai (
    id int primary key auto_increment not null,
    ma_trong_tai varchar(255),
    ten_trong_tai varchar(255),
    so_dien_thoai varchar(255),
    dia_chi varchar(255)
);
-- trong tai tran dau
drop table if exists trong_tai_tran_dau;
create table trong_tai_tran_dau (
    id int primary key auto_increment not null,
    tran_dau_id int(10),
    trong_tai_id int(10),
    ghi_chu varchar(255),
    so_tien float(10)
);
-- ban to chuc
drop table if exists ban_to_chuc;
create table ban_to_chuc (
    id int primary key auto_increment not null,
    ma_ban_to_chuc varchar(255),
    so_dien_thoai varchar(15),
    email varchar(255)

);