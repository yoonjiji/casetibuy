import express from "express";
import * as orderController from "../controller/orderController.js";

const router = express.Router();

// 주문 생성 API
router.post("/checkout", orderController.createOrder);
router.post("/orderlist", orderController.getOrders);

export default router;
