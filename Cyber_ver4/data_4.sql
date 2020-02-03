insert into QuanlyCyber_Ver4.COSO values
	('1',  'CyberKimGiang', 'Số 20B ngõ 278, Kim Giang, Hà Nội'),
	('2',   'CyberLinhDam', 'Tòa nhà CC2 Linh Đàm, Hà Nội'),
	('3', 'CyberTrieuKhuc', '53, Triều Khúc, Thanh Xuân, Hà Nội');

insert into QuanlyCyber_Ver4.PHONG values 
	('1',  '1',  'CyberKimGiang', 'Quạt'),
	('2',  '2',  'CyberKimGiang', 'Điều hòa, No smoking'),
	('3',  '2',  'CyberKimGiang', 'Quạt'),
	('4',  '3',  'CyberKimGiang', 'Điều hòa, No smoking'),
	('5',  '3',  'CyberKimGiang', 'Chưa sử dụng'),
	('1',  '1', 'CyberTrieuKhuc', 'Quạt'),
	('2',  '2', 'CyberTrieuKhuc', 'Điều hòa, No smoking'),
	('1',  '1',   'CyberLinhDam', 'Quạt'),
	('2',  '2',   'CyberLinhDam', 'Quạt'),
	('3',  '2',   'CyberLinhDam', 'Điều hòa, No smoking'),
	('4',  '3',   'CyberLinhDam', 'Điều hòa, No smoking'),
	('5',  '3',   'CyberLinhDam', 'VIP - Điều hòa, , No smoking, Ghế đôi'),
	('6',  '4',   'CyberLinhDam', 'Chưa sử dụng');

insert into QuanlyCyber_Ver4.DICHVU values
	('DV_001',       'Mì', 			 'Mì xào trứng', '15000.0'),	
	('DV_002',       'Mì', 'Mì xào trứng xúc xích ', '20000.0'),	
	('DV_003',       'Mì',   		   'Mì xào bò ', '20000.0'),	
	('DV_004',       'Mì', 					'Mì bò', '20000.0'),
	('DV_005',       'Mì', 			 'Mì tôm trứng', '15000.0'),	
	('DV_006',      'Cơm', 			   'Cơm đùi gà', '27000.0'),
	('DV_007',      'Cơm', 		 'Cơm sườn cốt lết', '27000.0'),
	('DV_008',      'Cơm', 	   'Cơm xào chua ngọt ', '30000.0'),
	('DV_009',      'Cơm',           'Cơm thịt heo', '25000.0'),
	('DV_010', 'Cơm rang',        'Cơm rang dưa bò', '32000.0'),
	('DV_011', 'Cơm rang',      'Cơm rang thập cẩm', '30000.0'),
	('DV_012', 'Cơm rang',      'Cơm rang đặc biệt', '40000.0'),
	('DV_013',  'Đồ uống',         'Sting đỏ, vàng',  '8000.0'),		
	('DV_014',  'Đồ uống',                  'Ice +', '10000.0'),
	('DV_015',  'Đồ uống',               'Red Bull', '12000.0'),
	('DV_016',  'Đồ uống',                   'Coca', '10000.0'),
	('DV_017',  'Đồ uống',                  'Pepsi', '10000.0'),
	('DV_018',  'Đồ uống',           'Mountain Dew', '10000.0'),
	('DV_019',  'Đồ uống',         'Monster Energy', '27000.0'),
	('DV_020',  'Đồ uống',                 'Revive', '10000.0'),
	('DV_021', 'Thuốc lá',                   'Vina', '22000.0'),
	('DV_022', 'Thuốc lá',         'Vina (lẻ điếu)',  '2000.0'),
	('DV_023', 'Thuốc lá',              'Thanglong', '10000.0');

insert into QuanlyCyber_Ver4.CAUHINH values
('art-work-01',    'Intel core i7-8700K', '16', 'GTX 1080 8gb', '24', '12000.000'),
('art-work-02',    'Intel core i9-9900K', '32', 'RTX 2060 6gb', '27', '17000.000'),
('art-work-03',        'AMD Ryzen 3700x', '16', 'GTX 1080 8gb', '24', '10000.000'),
('art-work-04',        'AMD Ryzen 3900x', '32', 'RTX 2060 6gb', '27', '15000.000'),
('gaming-01', 	   'Intel core i3-9400F',  '8', 'GTX 1050 4gb', '25', '5000.000'),
('gaming-02', 	   'Intel core i5-9100F',  '8', 'GTX 1060 6gb', '25', '6000.000'),
('gaming-03', 	   'Intel core i5-9400F', '16', 'GTX 1660 6gb', '32', '7000.000'),
('gaming-04', 	   'Intel core i7-9400F', '16', 'GTX 1070 6gb', '32', '8000.000'),
('ps4', 							NULL, NULL, 		  NULL, '40', '20000.000');

insert into QuanlyCyber_Ver4.MAY values
	('1',    'gaming-01', '1', 'CyberKimGiang'),
	('2',    'gaming-01', '1', 'CyberKimGiang'),
	('3',    'gaming-01', '1', 'CyberKimGiang'),
	('4',    'gaming-01', '1', 'CyberKimGiang'),
	('5',    'gaming-01', '1', 'CyberKimGiang'),
	('6',    'gaming-02', '1', 'CyberKimGiang'),
	('7',    'gaming-02', '1', 'CyberKimGiang'),
	('8',    'gaming-02', '1', 'CyberKimGiang'),
	('9',    'gaming-02', '1', 'CyberKimGiang'),
	('10',   'gaming-02', '1', 'CyberKimGiang'),
	('11',   'gaming-03', '2', 'CyberKimGiang'),
	('12',   'gaming-03', '2', 'CyberKimGiang'),
	('13',   'gaming-03', '2', 'CyberKimGiang'),
	('14',   'gaming-03', '2', 'CyberKimGiang'),
	('15',   'gaming-04', '2', 'CyberKimGiang'),
	('16',   'gaming-04', '2', 'CyberKimGiang'),
	('17',   'gaming-04', '2', 'CyberKimGiang'),
	('18',   'gaming-04', '2', 'CyberKimGiang'),
	('19',   'gaming-04', '2', 'CyberKimGiang'),
	('20', 'art-work-04', '3', 'CyberKimGiang'),
	('21', 'art-work-04', '3', 'CyberKimGiang'),
	('22', 'art-work-04', '3', 'CyberKimGiang'),
	('23', 'art-work-04', '3', 'CyberKimGiang'),
	('24', 'art-work-04', '3', 'CyberKimGiang'),
	('25',         'ps4', '4', 'CyberKimGiang'),
	('26',         'ps4', '4', 'CyberKimGiang'),
	('27',         'ps4', '4', 'CyberKimGiang'),
	('28',         'ps4', '4', 'CyberKimGiang'),
	('29',   'gaming-02', '1', 'CyberLinhDam'),
	('30',   'gaming-02', '1', 'CyberLinhDam'),
	('31',   'gaming-02', '1', 'CyberLinhDam'),
	('32',   'gaming-02', '1', 'CyberLinhDam'),
	('33',   'gaming-02', '1', 'CyberLinhDam'),
	('34',   'gaming-02', '1', 'CyberLinhDam'),
	('35',   'gaming-02', '1', 'CyberLinhDam'),
	('36',   'gaming-02', '1', 'CyberLinhDam'),
	('37',   'gaming-02', '1', 'CyberLinhDam'),
	('38',   'gaming-02', '1', 'CyberLinhDam'),
	('39',   'gaming-03', '2', 'CyberLinhDam'),
	('40',   'gaming-03', '2', 'CyberLinhDam'),
	('41',   'gaming-03', '2', 'CyberLinhDam'),
	('42',   'gaming-03', '2', 'CyberLinhDam'),
	('43',   'gaming-03', '2', 'CyberLinhDam'),
	('44',   'gaming-03', '2', 'CyberLinhDam'),
	('45',   'gaming-03', '2', 'CyberLinhDam'),
	('46',   'gaming-03', '2', 'CyberLinhDam'),
	('47',   'gaming-03', '2', 'CyberLinhDam'),
	('48',   'gaming-03', '2', 'CyberLinhDam'),
	('49',   'gaming-03', '2', 'CyberLinhDam'),
	('50',   'gaming-03', '2', 'CyberLinhDam'),
	('51',   'gaming-04', '3', 'CyberLinhDam'),
	('52',   'gaming-04', '3', 'CyberLinhDam'),
	('53',   'gaming-04', '3', 'CyberLinhDam'),
	('54',   'gaming-04', '3', 'CyberLinhDam'),
	('55',   'gaming-04', '3', 'CyberLinhDam'),
	('56',   'gaming-04', '3', 'CyberLinhDam'),
	('57',   'gaming-04', '3', 'CyberLinhDam'),
	('58',   'gaming-04', '3', 'CyberLinhDam'),
	('59',   'gaming-04', '3', 'CyberLinhDam'),
	('60',   'gaming-04', '3', 'CyberLinhDam'),
	('61', 'art-work-03', '4', 'CyberLinhDam'),
	('62', 'art-work-03', '4', 'CyberLinhDam'),
	('63', 'art-work-03', '4', 'CyberLinhDam'),
	('64', 'art-work-03', '4', 'CyberLinhDam'),
	('65', 'art-work-03', '4', 'CyberLinhDam'),
	('66', 'art-work-04', '4', 'CyberLinhDam'),
	('67', 'art-work-04', '4', 'CyberLinhDam'),
	('68', 'art-work-04', '4', 'CyberLinhDam'),
	('69', 'art-work-04', '4', 'CyberLinhDam'),
	('70', 'art-work-04', '4', 'CyberLinhDam'),
	('71',         'ps4', '5', 'CyberLinhDam'),
	('72',         'ps4', '5', 'CyberLinhDam'),
	('73',         'ps4', '5', 'CyberLinhDam'),
	('74',         'ps4', '5', 'CyberLinhDam'),
	('75',         'ps4', '5', 'CyberLinhDam'),
	('76',         'ps4', '5', 'CyberLinhDam'),
	('77',   'gaming-01', '1', 'CyberTrieuKhuc'),
	('78',   'gaming-01', '1', 'CyberTrieuKhuc'),
	('79',   'gaming-01', '1', 'CyberTrieuKhuc'),
	('80',   'gaming-01', '1', 'CyberTrieuKhuc'),
	('81',   'gaming-01', '1', 'CyberTrieuKhuc'),
	('82',   'gaming-01', '1', 'CyberTrieuKhuc'),
	('83',   'gaming-01', '1', 'CyberTrieuKhuc'),
	('84',   'gaming-01', '1', 'CyberTrieuKhuc'),
	('85',   'gaming-01', '1', 'CyberTrieuKhuc'),
	('86',   'gaming-01', '1', 'CyberTrieuKhuc'),
	('87',   'gaming-03', '2', 'CyberTrieuKhuc'),
	('88',   'gaming-03', '2', 'CyberTrieuKhuc'),
	('89',   'gaming-03', '2', 'CyberTrieuKhuc'),
	('90',   'gaming-03', '2', 'CyberTrieuKhuc'),
	('91',   'gaming-04', '2', 'CyberTrieuKhuc'),
	('92',   'gaming-04', '2', 'CyberTrieuKhuc'),
	('93',   'gaming-04', '2', 'CyberTrieuKhuc'),
	('94',   'gaming-04', '2', 'CyberTrieuKhuc'),
	('95',   'gaming-04', '2', 'CyberTrieuKhuc'),
	('96', 'art-work-01', '2', 'CyberTrieuKhuc'),
	('97', 'art-work-01', '2', 'CyberTrieuKhuc'),
	('98', 'art-work-01', '2', 'CyberTrieuKhuc'),
	('99', 'art-work-04', '2', 'CyberTrieuKhuc'),
	('100','art-work-04', '2', 'CyberTrieuKhuc'),
	('101',        'ps4', '2', 'CyberTrieuKhuc'),
	('102',        'ps4', '2', 'CyberTrieuKhuc');

insert into QuanlyCyber_Ver4.THONGTINKHACHHANG values
	( '1',  'Phạm Minh Tùng', '187756678', '0355568668', 'minhtung98'),
	( '2',    'Phạm Đức Huy', '184537787', '0345667213', 'duchuy99'),
	( '3',   'Vũ Minh Vương', '194654354', '0984215315', 'minhvuong69'),
	( '4',    'Vũ Văn Thanh', '181354135', '0813513131', 'vanthanh79'),
	( '5',    'Vũ Huy Thành', '135463845', '0316485613', 'thanh123'),
	( '6',    'Bùi Huy Việt', '187543578', '0354543568', 'huyviet11'),
	( '7',    'Vũ Thành Huy', '184354541', '0355553153', 'huyaltium'),
	( '8',    'Vũ Minh Hưng', '187443433', '0315328142', 'minhhung96'),
	( '9', 'Phạm Thanh Tùng', '182546568', '0135568668', 'thanhtung97'),
	('10','Nguyễn Quang Hải', '185653458', '1354135156', 'quanghai19'),
	('11','Trương Công Hiếu', '187153678', '0323586689', 'conghieu3'),
	('12',  'Nguyễn Văn Lâm', '183144512', '0313541223', 'vanlam1'),
	('13',    'Đỗ Hùng Dũng', '134641213', '0331313538', 'hungdung11'),
	('14',    'Quế Ngọc Hải', '135434843', '0813541313', 'ngochai4'),
	('15',   'Bùi Tiến Dũng', '186723533', '0986143513', 'tiendung23'),
	('16','Nguyễn Tiến Linh', '186561355', '0923515261', 'tienlinh22'),
	('17',    'Hà Đức Chinh', '181543535', '0861351355', 'chinhha9'),
	('18','Nguyễn Hoàng Đức', '187765643', '0987513515', 'hoangduc21');

insert into QuanlyCyber_Ver4.TAIKHOAN values
	( 'minhtung98', '915719.555', '152:37:12',     'active',  '15',     NULL, '2019-12-15 20:07:22'),
	('minhvuong69',  '59236.323',  '45:37:12',     'active',  '12',     NULL, '2019-12-20 18:05:22'),
	(   'thanh123',   '9890.000',  '21:00:00', 'not active',  NULL,     NULL, '2019-12-12 16:44:11'),
	(   'duchuy99',     '51.108',   '3:00:01',     'active',   '1',     NULL, '2019-12-15 18:04:34'),
	( 'vanthanh79',  '48337.490',  '94:50:01',     'active',  '33',     NULL, '2019-12-17 23:31:14'),
	(  'huyviet11',   '7003.245',  '10:21:01',     'active',  '44', 'DV_012', '2019-12-15 18:07:16'),
	(  'huyaltium',  '28003.320',  '54:40:02',     'active',  '17',     NULL, '2019-12-15 18:05:22'),
	( 'minhhung96', '467238.555', '102:37:12',     'active',  '32',     NULL, '2019-12-16 16:05:22'),
	('thanhtung97',   '3245.000',   '2:05:00', 'not active',  NULL,     NULL, '2019-12-09 18:48:12'),
	(  'conghieu3',      '4.154',   '3:00:01',     'active',  '12',     NULL, '2019-12-14 16:34:29'),
	( 'quanghai19',  '23546.780',   '5:56:01', 'not active',  NULL,     NULL, '2019-12-16 22:31:35'),
	(    'vanlam1',   '2345.876',   '1:39:41',     'active',  '42', 'DV_023', '2019-12-21 19:25:16'),
	( 'hungdung11',  '32452.560',   '2:34:22', 'not active',  NULL,     NULL, '2019-12-15 17:23:24'),
	(   'ngochai4',   '4446.780',   '5:56:01', 'not active',  NULL,     NULL, '2019-12-16 21:23:43'),
	( 'tiendung23',   '2345.876',   '1:39:41',     'active', '102', 'DV_022', '2019-12-13 23:25:23'),
	( 'tienlinh22',  '32452.560',  '12:34:22', 'not active',  NULL,     NULL, '2019-12-14 18:23:12'),
	(   'chinhha9',   '2345.876',   '5:39:41',     'active',  '52',  'DV_013', '2019-12-17 13:25:43'),
	( 'hoangduc21',  '32452.560',   '3:34:22', 'not active',  NULL,     NULL, '2019-12-19 21:43:12');
		
