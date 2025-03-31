// src/repository/orderRepository.js
import { db } from "./db.js";

export async function getOrdersByMember(memberId) {
  const connection = await db.getConnection();
  try {
    const query = `
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
          od.product_name,
          od.qty,
          od.kinds,
          od.unit_price,
          od.color,
          od.case_type,
          od.product_image AS image
      FROM casetibuy_order o
      INNER JOIN casetibuy_order_detail od ON o.order_id = od.order_id
      WHERE o.member_id = ?
      ORDER BY o.order_id DESC
    `;
    const [rows] = await connection.execute(query, [memberId]);
    return rows;
  } catch (error) {
    console.error("orderRepository.getOrdersByMember error:", error);
    throw error;
  } finally {
    connection.release();
  }
}
