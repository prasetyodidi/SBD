CREATE TABLE tb_pemasok
(
    id_pemasok      VARCHAR(5) PRIMARY KEY,
    nama_pemasok    VARCHAR(50),
    alamat_pemasok  VARCHAR(50),
    telepon_pemasok VARCHAR(50),
    pic             VARCHAR(30)
);

CREATE TABLE tb_karyawan
(
    nik           VARCHAR(10) PRIMARY KEY,
    nama_karyawan VARCHAR(40),
    telepon       VARCHAR(12),
    jabatan       VARCHAR(20),
    sandi         VARCHAR(10)
);

CREATE TABLE tb_kategori
(
    id_kategori   CHAR(2) PRIMARY KEY,
    nama_kategori VARCHAR(40),
    id_pemasok    VARCHAR(5),
    FOREIGN KEY (id_pemasok) REFERENCES tb_pemasok (id_pemasok)
);

CREATE TABLE tb_produk
(
    kd_produk   VARCHAR(15) PRIMARY KEY,
    nama_produk VARCHAR(60),
    id_kategori CHAR(2),
    stok        INT(11),
    harga       INT(11),
    FOREIGN KEY (id_kategori) REFERENCES tb_kategori (id_kategori)
);

CREATE TABLE tb_pelanggan
(
    id_pelanggan      VARCHAR(10) PRIMARY KEY,
    nama_pelanggan    VARCHAR(40),
    alamat_pelanggan  VARCHAR(50),
    telepon_pelanggan VARCHAR(15)
);

CREATE TABLE tb_penjualan
(
    kd_jual      VARCHAR(15) PRIMARY KEY,
    tgl_jual     DATE,
    nik          VARCHAR(10),
    id_pelanggan VARCHAR(10),
    total_jual   INT(11),
    FOREIGN KEY (nik) REFERENCES tb_karyawan (nik),
    FOREIGN KEY (id_pelanggan) REFERENCES tb_pelanggan (id_pelanggan)
);

CREATE TABLE tb_detail_jual
(
    kd_jual   VARCHAR(15),
    kd_produk VARCHAR(15),
    jumlah    INT(11),
    harga     INT(11),
    sub_total INT(11),
    FOREIGN KEY (kd_jual) REFERENCES tb_penjualan (kd_jual),
    FOREIGN KEY (kd_produk) REFERENCES tb_produk (kd_produk)
);

INSERT INTO tb_karyawan
VALUES ('KRY-1', 'Arsila', '081758392', 'Owner', 'sila'),
       ('KRY-2', 'Perwira', '081384993', 'Supervisor', 'wira'),
       ('KRY-3', 'Misha', '081744536', '', 'admin'),
       ('KRY-4', 'Ica', '081757384', 'kasir', 'kasiri'),
       ('KRY-5', 'Dika', '08175355', 'kasir', 'kasir2');

INSERT INTO tb_pelanggan
VALUES ('C-1', 'Adi Gunawan', 'Purwokerto', '0838238237'),
       ('C-2', 'Bia Ramadhan', 'Purwokerto', '0823234343'),
       ('C-3', 'Cici Kirana', 'Banyumas', '08334234233'),
       ('C-4', 'Dona Ariana', 'Purbalingga', '0833425462'),
       ('C-5', 'Emilia', 'Banyumas', '08334234543'),
       ('C-6', 'Fino Barlian', 'Banyumas', '083346463'),
       ('C-7', 'Gita Gustian', 'Purwokerto', '0833423657'),
       ('C-8', 'Hanun Permata', 'Purbalingga', '083342346546');

INSERT INTO tb_pemasok
VALUES ('Spl-1', 'PT Inovasi Sukses Sentosa', 'Jl. Meruya No.88 Kebon Jeruk Jakarta Barat', '0818238237',
        'Ilham Sentosa'),
       ('Spl-2', 'CV. Zara Tech Achievement', 'Jl. Flamboyan No 74 Depok', '08277483338', 'Zara Zulaikha'),
       ('Spl-3', 'PT Integra Automa Solusi', 'Jl. Ratu No. 10, Pondokgede, Bekasi', '0847372737', 'Sultan'),
       ('Spl-4', 'PT. Jete Tenaga Indonesia', 'Jl. Lebak Jaya II Tengah No.02 Surabaya', '081555888', 'Arya Seloka'),
       ('Spl-5', 'PT. Kreasi Sarana Prima', 'Taman Palem No. 17 Cengkareng, Jakarta Barat', '081222444', 'Wiryawan'),
       ('Spl-6', 'PT. JAYA UTAMA', 'Jl. Daan mogot km 19 Jakarta Barat', '081767676', 'Wijaya'),
       ('Spl-7', 'PT Daveeno Group Indonesia', 'Ds. Mojosari RT04, Bantul, Yogyakarta', '081888999', 'Davino Suhardjo');

INSERT INTO tb_kategori
VALUES ('k1', 'Komputer', 'Spl-1'),
       ('k2', 'Printer', 'Spl-6'),
       ('k3', 'Alat Input', 'Spl-5'),
       ('k4', 'Aksesoris Komputer', 'Spl-3'),
       ('k5', 'Web Camera', 'Spl-4'),
       ('k6', 'Monitor', 'Spl-7'),
       ('k7', 'Media penyimpanan data', 'Spl-2');

# Query replace into
REPLACE INTO tb_kategori
VALUES ('k7', 'Memori dan media penyimpanan data', 'Spl-2');

# Query untuk mengubah data/update data
UPDATE tb_pelanggan
SET nama_pelanggan = 'Emilia Putri'
WHERE id_pelanggan = 'C-5';

#Query untuk menghapus data
DELETE
FROM tb_karyawan
WHERE nama_karyawan = 'Cici';

# Query untuk select data
SELECT *
FROM tb_karyawan;
SELECT *
FROM tb_pelanggan;
SELECT *
FROM tb_kategori;
SELECT *
FROM tb_produk;

# Tugas Praktikum 4
# 1. Inputkan data kedalam tabel produk (minimal 5 record/data)
INSERT INTO tb_produk
VALUES ('P-1', 'Produk 1', 'k1', 1, 1000),
       ('P-2', 'Produk 2', 'k2', 2, 2000),
       ('P-3', 'Produk 3', 'k3', 3, 3000),
       ('P-4', 'Produk 4', 'k4', 4, 4000),
       ('P-5', 'Produk 5', 'k5', 5, 5000),
       ('P-6', 'Produk 6', 'k6', 6, 6000);
# 2. Query untuk menampilkan data pemasok yang namanya tidak berakhiran huruf “a”
SELECT *
FROM tb_pemasok
WHERE nama_pemasok NOT LIKE '%a';
# (gunakan klausa NOT LIKE)
# 3. Query untuk menampilkan data pelanggan yang terdapat karakter “ana” pada
SELECT *
FROM tb_pelanggan
WHERE nama_pelanggan LIKE '%ana%';
# namanya (gunakan klausa LIKE)
# 4. Query untuk mengurutkan data produk dari stok tertinggi sampai terkecil (gunakan
SELECT *
FROM tb_produk
ORDER BY stok DESC;
# klausa ORDER BY)
# 5. Jika tugas praktikum sudah selesai, bisa langsung dicek oleh asisten dosen selama jadwal praktikum 4 berlangsung


# Praktikum 5
# 1. membuat user mysql baru. nama 'user_kasir2' password 'kasir2' hak akses update tabel tb_produk
CREATE USER 'user_kasir2'@'localhost' IDENTIFIED BY 'kasir2';
GRANT UPDATE ON tb_produk TO 'user_kasir2'@'localhost';
# 2 input penjualan dan detail_penjualan minimal 5 record
INSERT INTO tb_penjualan
VALUES ('tr-1', '2022-11-01', 'KRY-4', 'C-2', '30200000'),
       ('tr-2', '2022-11-01', 'KRY-4', 'C-1', '27000000'),
       ('tr-3', '2022-10-29', 'KRY-5', 'C-3', '3400000'),
       ('tr-4', '2022-10-30', 'KRY-5', 'C-8', '2049000'),
       ('tr-5', '2022-10-30', 'KRY-5', 'C-2', '27000000')
;
INSERT INTO tb_detail_jual
VALUES ('tr-1', 'p-6', '2', '1600000', '3200000'),
       ('tr-1', 'p-1', '1', '27000000', '27000000'),
       ('tr-2', 'p-1', '1', '27000000', '27000000'),
       ('tr-3', 'p-5', '1', '1600000', '1600000'),
       ('tr-3', 'p-2', '1', '1800000', '1800000'),
       ('tr-4', 'p-2', '1', '1800000', '1800000'),
       ('tr-4', 'p-3', '3', '83000', '249000'),
       ('tr-5', 'p-1', '1', '27000000', '27000000')
;
# 3. Tuliskan query untuk menampilkan harga produk termurah dan termahal yang berhasil terjual
SELECT distinct tp.nama_produk, tp.harga
FROM tb_detail_jual
         JOIN tb_produk tp on tb_detail_jual.kd_produk = tp.kd_produk
ORDER BY tp.harga;
# 4. Tuliskan queri untuk menghitung total penjualan dikelompokkan per tanggal penjualan
SELECT tp.tgl_jual, SUM(tp.total_jual)
FROM tb_penjualan tp
GROUP BY tp.tgl_jual;
# 5. Tuliskan queri untuk menghitung rata-rata penjualan per karyawan
SELECT AVG(tp.total_jual)
FROM tb_karyawan tk
         JOIN tb_penjualan tp on tk.nik = tp.nik
GROUP BY tk.nik;
# 6. Tuliskan query untuk menampilkan data produk yang jumlah terjualnya lebih dari Sama dengan 2
SELECT tp.*, tdj.jumlah
FROM tb_detail_jual tdj
         JOIN tb_produk tp on tdj.kd_produk = tp.kd_produk
WHERE tdj.jumlah >= 2;

# 1. Tuliskan query untuk left join antara tabel pemasok (left) dengan tabel kategori
# (right). Kolom yang ditampilkan adalah namapemasok dan namakategori
SELECT tp.nama_pemasok as 'Nama Pemasok', tk.nama_kategori as 'Nama Kategori'
FROM tb_pemasok tp
         LEFT JOIN tb_kategori tk on tp.id_pemasok = tk.id_pemasok;

# 2. Tuliskan query untuk inner join antara tabel penjualan, tabel karyawan dan tabel
# pelanggan. Kolom yang ditampilkan adalah kdjual, tgljual, namakaryawan,
# namapelanggan, dan totaljual
SELECT tp.kd_jual       as 'Kode Jual',
       tp.tgl_jual      as 'Tgl Jual',
       tk.nama_karyawan as 'Nama Karyawan',
       t.nama_pelanggan as 'Nama Pelanggan'
FROM tb_penjualan tp
         JOIN tb_karyawan tk on tp.nik = tk.nik
         JOIN tb_pelanggan t on tp.id_pelanggan = t.id_pelanggan;

##

# 1. menambahkan data supplier
SELECT *
FROM tb_pemasok;
DELETE
FROM tb_pemasok
WHERE id_pemasok = 'EX1';
CREATE OR REPLACE PROCEDURE InsertSupplier(
    IN id VARCHAR(5),
    IN nama VARCHAR(50),
    IN alamat VARCHAR(50),
    IN telepon VARCHAR(30),
    IN paramPic VARCHAR(30)
)
BEGIN
    INSERT INTO tb_pemasok VALUE (id, nama, alamat, telepon, paramPic);
END;

CALL InsertSupplier('EX1', 'Brg 1', 'Alamat 1', '08123123123', 'Ucup');

# 2. Menghapus data karyawan
SELECT *
FROM tb_karyawan;
INSERT INTO tb_karyawan VALUE ('EX-1', 'Ucup', '08123123', 'kasir', 'kasir');
CREATE OR REPLACE PROCEDURE DeleteEmployee(IN paramNik VARCHAR(10))
BEGIN
    DELETE FROM tb_karyawan WHERE paramNik = nik;
END;

CALL DeleteEmployee('EX-1');

# 3. Satu fungsi string supplier
SELECT *
FROM tb_pemasok;
CREATE OR REPLACE PROCEDURE SupplierNameUpper(IN idSupplier VARCHAR(5))
BEGIN
    SELECT UPPER(nama_pemasok) FROM tb_pemasok WHERE id_pemasok = idSupplier;
END;

CALL SupplierNameUpper('EX1');

# 4. Query User Define Function untuk menampilkan total penjualan berdasarkan tgl penjualan
SELECT *
FROM tb_penjualan;
CREATE OR REPLACE FUNCTION TotalPenjualan(paramTglJual DATE)
    RETURNS INT
BEGIN
    DECLARE totalJual INT;
    SELECT SUM(total_jual) INTO totalJual FROM tb_penjualan WHERE tgl_jual = paramTglJual;
    RETURN totalJual;
END;

SELECT TotalPenjualan('2022-11-01');

###
DELIMITER $$
CREATE OR REPLACE PROCEDURE TambahPelanggan(
    IN id VARCHAR(10),
    IN nama VARCHAR(40),
    IN alamat VARCHAR(45),
    IN telepon VARCHAR(15)
)
BEGIN
    INSERT INTO tb_pelanggan
    VALUES (id,
            nama,
            alamat,
            telepon);
END$$

/* pemanggilan procedure */
CALL TambahPelanggan('C-9', 'Kinar Mizania', 'Banjarnegara', 'null');

DELIMITER $$
CREATE OR REPLACE PROCEDURE UbahPelanggan(
    IN id VARCHAR(10),
    IN nama VARCHAR(30), IN alamat VARCHAR(40),
    IN telepon VARCHAR(15))
BEGIN
    UPDATE tb_pelanggan
    SET nama_pelanggan    = nama,
        alamat_pelanggan  = alamat,
        telepon_pelanggan = telepon
    WHERE id_pelanggan = id;
END$$

/* pemanggilan procedure */
CALL UbahPelanggan('C-9', 'Kinara Mazaya', 'Cilacap', '081223344');

DELIMITER $$
CREATE OR REPLACE PROCEDURE HapusPelanggan(IN id VARCHAR(10))
BEGIN
    DELETE FROM tb_pelanggan WHERE id_pelanggan = id;
END$$

/* pemanggilan procedure */
CALL HapusPelanggan('C-9');

DELIMITER $$
CREATE OR REPLACE PROCEDURE jumlahPelanggan(OUT hasil INT)
BEGIN
    SELECT COUNT(*) INTO hasil FROM tb_pelanggan;
END$$

/*pemanggilan procedure dg parameter out*/
CALL jumlahPelanggan(@Jumlah);
SELECT @jumlah AS 'jumlahpelanggan';

DELIMITER $$
CREATE OR REPLACE PROCEDURE jumlahPelanggan2(
    IN alamat VARCHAR(15),
    OUT hasil INT)
BEGIN
    SELECT COUNT(*)
    INTO hasil
    FROM tb_pelanggan
    WHERE alamat_pelanggan = alamat;
END$$

/* pemanggilan procedure */
CALL jumlahPelanggan2('Purwokerto', @n);
SELECT @n AS 'Jml pelanggan';

SELECT nama_pelanggan, LEFT(nama_pelanggan, 5), RIGHT(nama_pelanggan, 5)
FROM tb_pelanggan;

SELECT tgl_jual, DATEDIFF(NOW(), tgl_jual)
FROM tb_penjualan
WHERE kd_jual = 'tr-3';

SELECT tgl_jual, MONTHNAME(tgl_jual)
FROM tb_penjualan;

DELIMITER $$
CREATE OR REPLACE FUNCTION f_jumlahStok(id VARCHAR(5))
    RETURNS INT
BEGIN
    DECLARE jumlah INT;
    SELECT stok
    INTO jumlah
    FROM tb_produk
    WHERE kd_produk = id;
    RETURN jumlah;
END$$

/* pemanggilan function */
SELECT f_jumlahStok('prd-6');

DELIMITER $$
CREATE OR REPLACE FUNCTION f_jumlahStok2(id CHAR(3))
    RETURNS INT
BEGIN
    DECLARE jumlah INT;
    SELECT SUM(stok)
    INTO jumlah
    FROM tb_produk
    WHERE id_kategori = id;
    RETURN jumlah;
END$$

/* pemanggilan function */
SELECT f_jumlahStok2('K7');


DELIMITER $$
CREATE OR REPLACE FUNCTION f_hargabarang(pharga INT)
    RETURNS INT
BEGIN
    DECLARE dtbrg INT;
    SELECT COUNT(harga)
    INTO dtbrg
    FROM tb_produk
    WHERE harga < pharga;
    RETURN dtbrg;
END$$

/* pemanggilan function */
SELECT f_hargabarang(5000000) AS 'jml dara barang dgn harga < 5000000';

# Praktiku 9

# 1 Tuliskan query percabangan (IF) untuk menampilkan bonus dengan ketentuan:
# • Jika totaljual lebih dari 2 juta bonus = flashdisk
# • Jika totaljual lebih dari 1 juta bonus = notebook
# • Jika totaljual lebih dari 500K bonus = ear phone
# • Selain kondisi diatas maka tidak dapat bonus
INSERT INTO tb_penjualan value ('EX-1', '2022-12-12', 'KRY-1', 'c-1', 200000);
DELETE
FROM tb_penjualan
where kd_jual = 'EX-1';
SELECT kd_jual,
       total_jual,
       CASE
           WHEN total_jual >= 2000000 THEN 'flashdisk'
           WHEN total_jual >= 1000000 THEN 'notebook'
           WHEN total_jual >= 500000 THEN 'ear phone'
           ELSE 'tidak dapat bonus'
           END AS 'Bonus'
FROM tb_penjualan;

SELECT kd_jual,
       CASE
           WHEN sub_total >= 2000000 THEN 'flashdisk'
           WHEN sub_total >= 1000000 THEN 'notebook'
           WHEN sub_total >= 500000 THEN 'ear phone'
           ELSE 'tidak dapat bonus'
           END AS 'Bonus'
FROM tb_detail_jual;

# 2 Tuliskan query percabangan untuk menampilkan bonus dengan ketentuan:
# • Jika subtotal lebih dari 2 juta diskon 15%
# • Jika subtotal lebih dari lebih dari 1 juta diskon 15%
# • Jika subtotal lebih dari 500K diskon 5%
# • Selain kondisi diatas maka tidak dapat diskon
SELECT kd_jual,
       sub_total,
       CASE
           WHEN sub_total > 2000000 THEN '15%'
           WHEN sub_total > 1000000 THEN '10%'
           WHEN sub_total > 500000 THEN '5%'
           ELSE 'Tidak dapat diskon'
           END AS 'Diskon'
FROM tb_detail_jual;

# 3 Tuliskan query untuk menampilkan total produk yang sudah berhasil terjual/belum berhasil terjual
CREATE OR REPLACE FUNCTION cekTransaction(kdProduct VARCHAR(10))
    RETURNS VARCHAR(50)
BEGIN
    DECLARE totalJual INT;
    SELECT COUNT(kd_produk) INTO totalJual FROM tb_detail_jual WHERE kd_produk = kdProduct;
    IF (totalJual > 0) THEN
        RETURN CONCAT('Produk sudah terjual sebanyak ', totalJual, ' Item');
    ELSE
        RETURN 'Produk belum pernah terjual';
    END IF;
END;

SELECT kd_produk, COUNT(jumlah)
FROM tb_detail_jual
GROUP BY kd_produk;

SELECT cekTransaction('p-3');

# 4 Tuliskan query untuk menampilkan bilangan genap menggunakan statement looping
CREATE OR REPLACE PROCEDURE genap(IN batas INT)
BEGIN
    DECLARE i INT;
    DECLARE hasil VARCHAR(30) DEFAULT '';
    SET i = 1;
    WHILE i < batas
        DO
            IF MOD(i, 2) != 1 THEN
                SET hasil = CONCAT(hasil, i, ' ');
            END IF;
            SET i = i + 1;
        END WHILE;
    SELECT hasil;
END;

CALL genap(10);
