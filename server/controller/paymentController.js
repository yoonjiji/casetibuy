import axios from "axios";

// 카카오페이 QR 결제 요청 함수
export const paymentKakaopay = async (req, res) => {
    try {
        const { id, item_name, total_amount } = req.body;
        const KAKAO_ADMIN_KEY = "ec4f35c9da872eac46fb9893573e4a90";

        // partner_order_id를 한 번만 생성합니다.
        const partner_order_id = `order_${Date.now()}_${id}`;

        const response = await axios.post(
            "https://kapi.kakao.com/v1/payment/ready",
            {
                cid: "TC0ONETIME",
                partner_order_id, // 준비 단계에서 생성한 값을 그대로 사용
                partner_user_id: id,
                item_name,
                quantity: 1,
                total_amount,
                tax_free_amount: 0,
                approval_url: "http://54.180.155.70:3000/order-success",
                cancel_url: "http://54.180.155.70:3000/payment/cancel",
                fail_url: "http://54.180.155.70:3000/payment/fail",
            },
            {
                headers: {
                    Authorization: `KakaoAK ${KAKAO_ADMIN_KEY}`,
                    "Content-Type": "application/x-www-form-urlencoded",
                },
            }
        );
        // partner_order_id를 응답에 포함시켜 클라이언트가 저장할 수 있도록 합니다.
        res.json({ ...response.data, partner_order_id });
    } catch (error) {
        console.error("QR 결제 요청 실패:", error);
        res.status(500).json(error.response.data);
    }
};

// 카카오페이 결제 승인 함수 (승인 시 클라이언트가 전달한 partner_order_id를 그대로 사용)
export const paymentKakaopayApprove = async (req, res) => {
    try {
        const { pg_token, tid, id, total_amount, partner_order_id } = req.body;
        const KAKAO_ADMIN_KEY = "ec4f35c9da872eac46fb9893573e4a90";

        const response = await axios.post(
            "https://kapi.kakao.com/v1/payment/approve",
            {
                cid: "TC0ONETIME",
                tid,
                partner_order_id, // 클라이언트가 보관한 값을 사용
                partner_user_id: id,
                pg_token,
            },
            {
                headers: {
                    Authorization: `KakaoAK ${KAKAO_ADMIN_KEY}`,
                    "Content-Type": "application/x-www-form-urlencoded",
                },
            }
        );
        res.json({
            message: "카카오페이 결제 승인 성공",
            partner_order_id: response.data.partner_order_id,
        });
    } catch (error) {
        console.error("❌ 카카오페이 승인 실패:", error);
        res.status(500).json(error.response?.data || { message: "카카오페이 승인 오류" });
    }
};
