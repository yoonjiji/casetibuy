create database casetibuy;

use casetibuy;

show tables;

create table casetibuy_product(
	pid		int				primary key		auto_increment,
    pname	varchar(50)			not null,
    upload_file		json,
    source_file		json,
    pdate			datetime
);

create table casetibuy_member(
		name			varchar(10)		not null,
        birthdate		char(8)			not null,
		id				varchar(20)		primary key,
		pwd				varchar(20)		not null,
        email			varchar(30)		not null,
        phone			char(11)		not null,
        mdate			datetime
);
INSERT INTO casetibuy_member (name, birthdate, id, pwd, email, phone, mdate) VALUES
('김민수', '19850115', 'minsuglow', '123456', 'minsuglow@smartmail.com', '01011112222', '2025-01-10 08:15:00'),
('이서연', '19900220', 'seoyeonvivid', '123456', 'seoyeonvivid@smartmail.com', '01022223333', '2025-01-25 12:30:00'),
('박지훈', '19881130', 'jihoonfire', '123456', 'jihoonfire@smartmail.com', '01033334444', '2025-02-03 09:45:00'),
('최은정', '19920515', 'eunjeongwave', '123456', 'eunjeongwave@smartmail.com', '01044445555', '2025-02-15 14:20:00'),
('정현우', '19870707', 'hyunwoofresh', '123456', 'hyunwoofresh@smartmail.com', '01055556666', '2025-02-20 16:50:00'),
('윤지민', '19911201', 'jiminvibe', '123456', 'jiminvibe@smartmail.com', '01066667777', '2025-02-25 11:10:00'),
('오수빈', '19930505', 'subinlight', '123456', 'subinlight@smartmail.com', '01077778888', '2025-03-01 07:05:00'),
('문재영', '19890312', 'jaeyoungjoy', '123456', 'jaeyoungjoy@smartmail.com', '01088889999', '2025-03-03 19:30:00'),
('임지원', '19940723', 'jiwoncharm', '123456', 'jiwoncharm@smartmail.com', '01099990000', '2025-03-05 15:45:00'),
('유성민', '19861230', 'seongminedge', '123456', 'seongminedge@smartmail.com', '01010101010', '2025-03-07 10:00:00'),
('신다은', '19930317', 'daeunshine', '123456', 'daeunshine@smartmail.com', '01012121212', '2025-03-09 18:20:00'),
('강동혁', '19890625', 'donghyeokpulse', '123456', 'donghyeokpulse@smartmail.com', '01013131313', '2025-03-11 13:35:00'),
('배수현', '19911010', 'baesuhyeonbeat', '123456', 'baesuhyeonbeat@smartmail.com', '01014141414', '2025-03-13 21:55:00'),
('곽동혁', '19880508', 'kwakdaring', '123456', 'kwakdaring@smartmail.com', '01015151515', '2025-03-15 08:25:00'),
('서민지', '19921111', 'seominjirise', '123456', 'seominjirise@smartmail.com', '01016161616', '2025-03-16 16:00:00'),
('조동현', '19870707', 'jodonghyunvibe', '123456', 'jodonghyunvibe@smartmail.com', '01017171717', '2025-03-17 12:10:00'),
('한예림', '19930530', 'hanyerimglow', '123456', 'hanyerimglow@smartmail.com', '01018181818', '2025-03-18 09:05:00'),
('노진우', '19890109', 'nojinwooflare', '123456', 'nojinwooflare@smartmail.com', '01019191919', '2025-03-19 17:50:00'),
('송혜민', '19940404', 'songhyemindream', '123456', 'songhyemindream@smartmail.com', '01020202020', '2025-03-20 14:40:00'),
('김도현', '19911011', 'kimdohyeonswift', '123456', 'kimdohyeonswift@smartmail.com', '01021212121', '2025-03-21 11:55:00');


use casetibuy;
select * from casetibuy_product;
select * from casetibuy_member;

truncate table casetibuy_member;

alter table casetibuy_product add column repImage varchar(300);
-- 콜라보 항목 추가!!!!!! 
alter table casetibuy_product add column isColab varchar(50) not null;

SELECT 
                    pid,
                    pname as name,
                    price,
                    upload_file as image,                                   
                    source_file as sourceFile,
                    pdate,
                    concat('http://localhost:9000/',upload_file->>'$[0]') as firstImage,
                    -- json_array() 사용해서 imgList 배열만듬
                    json_array(
						concat('http://localhost:9000/',upload_file->>'$[0]'),
						concat('http://localhost:9000/',upload_file->>'$[1]'),
						concat('http://localhost:9000/',upload_file->>'$[2]')
                    ) as imgList,
                    json_arrayagg(
						concat('http://localhost:9000/',jt.filename)
                    ) as detailImgList
                FROM
                    casetibuy_product, 
                    -- json_table(테이블.컬럼명,매핑데이터 columns(컬럼 생성 후 리턴)) as jt 
                    json_table(shoppy_product.upload_file,'$[*]'
							   columns(filename varchar(100) path '$')) as jt
                WHERE
                    pid = 10
                    ;
                    
                    
                SELECT 
                    pid,
                    pname as name,
                    upload_file as image,                                   
                    source_file as sourceFile,
                    pdate
                FROM
                    casetibuy_product
                WHERE
                    pid = 1;
                    
-- casetibuy_cart
create table casetibuy_cart(
	cid			 int				primary key		auto_increment, 
    cname 		 varchar(30)		not null,
    qty 		 int				not null,
    color		 varchar(30)		not null,
    caseType     varchar(30)		not null,
	image 		 varchar(200)		not null,
    price 		 int				not null,
    id			 varchar(30)		not null,
    pid			 int 				not null,
    cdate		 datetime,
    constraint fk_id_casetibuy_member_id foreign key(id)
					references casetibuy_member(id),
	constraint fk_pid_casetibuy_product_pid foreign key(pid)
					references casetibuy_product(pid)
);

-- casetibuy_cart, casetibuy_member. casetibuy_product 조인
select cc.cid,
	   cc.cname,
       cc.qty,
       cc.color,
       cc.caseType,
       cc.price,
       cm.id,
       cp.pid,
       cp.pname,
       concat('http://localhost:9000/', cc.image) as image		
		 from casetibuy_cart cc,
			  casetibuy_member cm,
              casetibuy_product cp
		 where cc.id = cm.id and cc.pid = cp.pid;
         
-- 장바구니 전체 조회 뷰 생성
create view view_cart_list
as
select cc.cid,
	   cc.cname,
       cc.qty,
       cc.color,
       cc.caseType,
       cc.price,
       cm.id,
       cp.pid,
       cp.pname,
       concat('http://localhost:9000/', cc.image) as image	
		 from casetibuy_cart cc,
			  casetibuy_member cm,
              casetibuy_product cp
		 where cc.id = cm.id and cc.pid = cp.pid;

select * from casetibuy_product;
select * from casetibuy_member;
select * from casetibuy_cart;
select * from view_cart_list;

UPDATE casetibuy_product
SET upload_file = '["upload_files\\\\1742631005803_283883963iphone16p_FunFriends_case_bounce_color_babyblue1.webp", "upload_files\\\\1742631005803_335937676iphone16p_FunFriends_case_bounce_color_babyblue2.webp", "upload_files\\\\1742631005810_964446295iphone16p_FunFriends_case_bounce_color_black1.webp", "upload_files\\\\1742631005813_945712843iphone16p_FunFriends_case_bounce_color_black2.webp", "upload_files\\\\1742631005813_31566268iphone16p_FunFriends_case_bounce_color_primrose1.webp", "upload_files\\\\1742631005816_865499992iphone16p_FunFriends_case_bounce_color_primrose2.webp", "upload_files\\\\1742631005818_24358371iphone16p_FunFriends_case_impact_color_black1.webp", "upload_files\\\\1742631005818_792833932iphone16p_FunFriends_case_impact_color_black2.webp", "upload_files\\\\1742631005819_333562088iphone16p_FunFriends_case_impact_color_skyblue1.webp", "upload_files\\\\1742631005820_66581673iphone16p_FunFriends_case_impact_color_skyblue2.webp", "upload_files\\\\1742631005822_589037516iphone16p_FunFriends_case_impact_color_purple1.webp", "upload_files\\\\1742631005824_184024889iphone16p_FunFriends_case_impact_color_purple2.webp", "upload_files\\\\1742631005824_974243790iphone16p_FunFriends_case_mimpact_color_black1.webp", "upload_files\\\\1742631005826_849243052iphone16p_FunFriends_case_mimpact_color_black2.webp", "upload_files\\\\1742631005826_403897319iphone16p_FunFriends_case_mimpact_color_purple1.webp", "upload_files\\\\1742631005827_23132531iphone16p_FunFriends_case_mimpact_color_purple2.webp", "upload_files\\\\1742631005828_953541468iphone16p_FunFriends_case_mimpact_color_skyblue1.webp", "upload_files\\\\1742631005830_213976238iphone16p_FunFriends_case_mimpact_color_skyblue2.webp", "upload_files\\\\1742631005830_148344505iphone16p_FunFriends_case_mirror_color_black1.webp", "upload_files\\\\1742631005832_799083695iphone16p_FunFriends_case_mirror_color_black2.webp", "upload_files\\\\1742631005833_556790996iphone16p_FunFriends_case_mirror_color_silver1.webp", "upload_files\\\\1742631005833_103583020iphone16p_FunFriends_case_mirror_color_silver2.webp", "upload_files\\\\1742631005834_747542401iphone16p_FunFriends_case_ring_color_black1.webp", "upload_files\\\\1742631005835_455215194iphone16p_FunFriends_case_ring_color_black2.webp", "upload_files\\\\1742631005836_897873423iphone16p_FunFriends_case_ring_color_purple1.webp", "upload_files\\\\1742631005838_554200424iphone16p_FunFriends_case_ring_color_purple2.webp", "upload_files\\\\1742631005838_941123318iphone16p_FunFriends_case_ring_color_skyblue1.webp", "upload_files\\\\1742631005839_634581551iphone16p_FunFriends_case_ring_color_skyblue2.webp"]'
WHERE pid = 16;


-- 테이블 삭제(카트랑 참조중 => 카트 먼저 삭제 후 멤버 삭제)
drop table casetibuy_product;
drop table casetibuy_member;
drop table casetibuy_cart;
drop table casetibuy_order_detail;
drop table casetibuy_order;
drop table casetibuy_review;


DROP VIEW IF EXISTS view_cart_list;                

-- 테이블 내용 삭제(카트랑 참조중 => 카트 먼저 삭제 후 멤버 삭제)
TRUNCATE TABLE casetibuy_member;
TRUNCATE TABLE casetibuy_cart;
TRUNCATE TABLE casetibuy_product;
TRUNCATE TABLE casetibuy_order;
TRUNCATE TABLE casetibuy_order_detail;
TRUNCATE TABLE casetibuy_review;
ALTER TABLE casetibuy_order DROP FOREIGN KEY fk_order_member;
DROP TABLE casetibuy_member;
ALTER TABLE casetibuy_cart DROP FOREIGN KEY fk_pid_casetibuy_product_pid;
DROP TABLE casetibuy_product;

ALTER TABLE casetibuy_order_detail DROP FOREIGN KEY fk_product;
DROP TABLE casetibuy_product;

DELETE FROM casetibuy_product WHERE pid = 21;


-- 결제관련 오더 테이블
CREATE TABLE casetibuy_order (
    order_id         INT AUTO_INCREMENT PRIMARY KEY,
    member_id        VARCHAR(20) NOT NULL, -- 기존 'id' 컬럼과 일치
    total_price      INT NOT NULL,
    payment_method   ENUM('creditCard', 'kakaoPay') NOT NULL,
    order_status     ENUM('pending', 'completed', 'canceled') DEFAULT 'pending',
    order_date       DATETIME DEFAULT CURRENT_TIMESTAMP,
    zipcode          VARCHAR(10) NOT NULL,
    address          VARCHAR(255) NOT NULL,
    detail_address   VARCHAR(255) NOT NULL,
    CONSTRAINT fk_order_member FOREIGN KEY (member_id) REFERENCES casetibuy_member(id)
);

CREATE TABLE casetibuy_order_detail (
    order_detail_id  INT AUTO_INCREMENT PRIMARY KEY,
    order_id         INT NOT NULL,
    product_id       INT NOT NULL, -- 기존 'pid' 컬럼과 일치
    product_name     VARCHAR(50) NOT NULL, -- 기존 'pname' 컬럼과 일치
    qty             INT NOT NULL,
    unit_price      INT NOT NULL, -- 기존 'price' 컬럼과 일치
    color           VARCHAR(30) NOT NULL,
    case_type       VARCHAR(30) NOT NULL,
    product_image   VARCHAR(200), -- 기존 'image' 컬럼과 일치
    CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES casetibuy_order(order_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES casetibuy_product(pid)
);

-- 계정을 삭제하기 위한 제약키 수정
ALTER TABLE casetibuy_order DROP FOREIGN KEY fk_order_member;

ALTER TABLE casetibuy_order ADD CONSTRAINT fk_order_member
FOREIGN KEY (member_id) REFERENCES casetibuy_member(id)
ON DELETE CASCADE;

ALTER TABLE casetibuy_order_detail DROP FOREIGN KEY fk_order;

ALTER TABLE casetibuy_order_detail ADD CONSTRAINT fk_order
FOREIGN KEY (order_id) REFERENCES casetibuy_order(order_id)
ON DELETE CASCADE;

show tables;

-- 유저가 구매한 상품 조회
SELECT 
    o.order_id,
    o.member_id,
    o.total_price,
    o.payment_method,
    o.order_status,
    o.order_date,
    o.address,
    od.product_id,
    od.product_name,
    od.qty,
    od.unit_price,
    od.color,
    od.case_type,
    CONCAT('http://localhost:9000/', od.product_image) AS image
FROM casetibuy_order o
INNER JOIN casetibuy_order_detail od ON o.order_id = od.order_id
WHERE o.member_id = 'rkdgusdn';

select * from casetibuy_order;
select * from casetibuy_order_detail;


CREATE TABLE casetibuy_review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    pid INT NOT NULL,
    member_id VARCHAR(50) NOT NULL,
    color	varchar(30) not null,
    casetype	varchar(30) not null,
    comment TEXT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_review_order FOREIGN KEY (order_id)
        REFERENCES casetibuy_order (order_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_review_member FOREIGN KEY (member_id)
        REFERENCES casetibuy_member (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_review_product FOREIGN KEY (pid)
        REFERENCES casetibuy_product (pid)
        ON DELETE CASCADE ON UPDATE CASCADE
);


      SELECT 
          o.order_id,
          o.member_id,
          o.total_price,
          o.payment_method,
          o.order_status,
          o.order_date,
          o.address,
          o.detail_address,
          od.product_id,
          od.product_name as product_name,
          od.qty,
          od.unit_price,
          od.color,
          od.case_type,
          CONCAT('http://localhost:9000/', od.product_image) AS image
      FROM casetibuy_order o
      INNER JOIN casetibuy_order_detail od ON o.order_id = od.order_id
      WHERE o.member_id = 'test123'
      ORDER BY o.order_id DESC
    ;

select * from casetibuy_review;


        select pid,
               pname as name,
               kinds,
               isNew,
               isHot,
               isRec,
               isColab,
               repImage,
               upload_file,
               source_file,
               pdate
         from casetibuy_product
         where pname = 'test2';

select * from casetibuy_product;
UPDATE casetibuy_product
SET pid = 25
WHERE pid = 39;