import { db } from "../repository/db.js";
import * as orderRepository from "../repository/orderRepository.js";

// 결제 완료 후 실행되는 주문 생성 함수
export const createOrder = async (req, res) => {  
    const { member_id, total_price, payment_method, zipcode, address, detail_address, cartItems } = req.body;

    if (!member_id || !total_price || !payment_method || !zipcode || !address || !detail_address || !cartItems) {
        return res.status(400).json({ message: "필수 정보를 입력해주세요." });
    }

    const connection = await db.getConnection();
    try {
        await connection.beginTransaction();

        const orderSql = `
                            INSERT INTO casetibuy_order (member_id, total_price, payment_method, zipcode, address, detail_address)
                            VALUES (?, ?, ?, ?, ?, ?)`;
        const [orderResult] = await connection.execute(orderSql, [
            member_id,
            total_price,
            payment_method,
            zipcode,
            address,
            detail_address,
        ]);

        const order_id = orderResult.insertId;

        const orderDetailSql = `
                                    INSERT INTO casetibuy_order_detail (order_id, product_id, product_name, qty, unit_price, kinds, color, case_type, product_image)
                                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`;

        for (const item of cartItems) {
            await connection.execute(orderDetailSql, [
                order_id,
                item.product_id,
                item.product_name,
                item.qty,
                item.unit_price,
                item.kinds,
                item.color,
                item.case_type,
                item.product_image,
            ]);
        }

        const deleteCartSql = `DELETE FROM casetibuy_cart WHERE id = ?`;
        await connection.execute(deleteCartSql, [member_id]);

        await connection.commit();
        res.status(201).json({ message: "주문이 성공적으로 저장되었습니다.", order_id });
    } catch (error) {
        await connection.rollback();
        console.error("주문 생성 중 오류 발생:", error);
        res.status(500).json({ message: "주문 저장 중 오류 발생" });
    } finally {
        connection.release();
    }
};




export const getOrders = async (req, res) => {
  
  try {
    const { memberId } = req.body;
    if (!memberId) {
      return res.status(400).json({ message: "Member id is required." });
    }
    const orders = await orderRepository.getOrdersByMember(memberId);
    return res.status(200).json(orders);
  } catch (error) {
    console.error("Error fetching orders:", error);
    return res.status(500).json({ message: "Failed to fetch orders." });
  }
};