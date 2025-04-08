create database casetibuy;

use casetibuy;
show tables;

select * from information_schema.views where table_schema = 'casetibuy';
select * from casetibuy_product;
select * from casetibuy_member;
select * from casetibuy_order;
select * from casetibuy_order_detail;
select * from casetibuy_cart;
drop view view_cart_list;
select * from view_cart_list;

delete from casetibuy_order where member_id = 'rkdgusdn';

create view view_cart_list
as
select cc.cid,
	   cc.cname,
       cc.qty,
       cc.color,
       cc.caseType,
       cc.price,
       cc.kinds,
       cm.id,
       cp.pid,
       cp.pname,
       concat('http://54.180.155.70:9000/', cc.image) as image	
		 from casetibuy_cart cc,
			  casetibuy_member cm,
              casetibuy_product cp
		 where cc.id = cm.id and cc.pid = cp.pid;
         
INSERT INTO casetibuy_order (member_id, total_price, payment_method, zipcode, address, detail_address)
                            VALUES ('test11',1,1,1,1,1);
                            
INSERT INTO casetibuy_order_detail (order_id, product_id, product_name, qty, unit_price, kinds, color, case_type, product_image)
VALUES (22, 1,1,1,1,1,1,1,1);

-- 계정을 삭제하기 위한 제약키 수정
ALTER TABLE casetibuy_order DROP FOREIGN KEY fk_order_member;

ALTER TABLE casetibuy_order ADD CONSTRAINT fk_order_member
FOREIGN KEY (member_id) REFERENCES casetibuy_member(id)
ON DELETE CASCADE;

ALTER TABLE casetibuy_order_detail DROP FOREIGN KEY fk_order;

ALTER TABLE casetibuy_order_detail ADD CONSTRAINT fk_order
FOREIGN KEY (order_id) REFERENCES casetibuy_order(order_id)
ON DELETE CASCADE;

ALTER TABLE casetibuy_cart
DROP FOREIGN KEY fk_id_casetibuy_member_id;

ALTER TABLE casetibuy_cart
ADD CONSTRAINT fk_id_casetibuy_member_id
FOREIGN KEY (id) REFERENCES casetibuy_member(id)
ON DELETE CASCADE;

create database hrdb2019;