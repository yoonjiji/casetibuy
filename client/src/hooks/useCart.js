import { useContext } from "react";
import axios from "axios";
import { CartContext } from "../context/CartContext";

export const useCart = () => {
  const {
    isCartOpen,
    setIsCartOpen,
    cartList,
    setCartList,
    cartCount,
    setCartCount,
    totalPrice,
    setTotalPrice,
  } = useContext(CartContext);

  /**
   * 장바구니 전체 리스트 조회
   */
  const getCartList = async () => {
    const id = localStorage.getItem("user_id"); // <<< 지혜 / 추가 >>>
    const result = await axios.post("http://localhost:9000/cart/items", {
      id: id,
    });
    setCartList(result.data);
    setCartCount(result.data.length);
    calculateTotalPrice(result.data);
  };

  /**
   * 장바구니 새로운 아이템 저장
   */
  const saveToCartList = async (formData) => {
    const result = await axios.post("http://localhost:9000/cart/add", formData);
    if (result.data.result_rows) {
      setCartCount(cartCount + 1);
      console.log("서버로 보낼 데이터:", formData);
      getCartList();
    }
    return result.data.result_rows;
  };

  /**
   * 장바구니 아이템 수량 업데이트
   */
  const updateCartList = async (cid, type) => {
    const result = await axios.put("http://localhost:9000/cart/updateQty", {
      cid: cid,
      type: type,
    });
    result.data.result_rows && getCartList();
    return result.data.result_rows;
  };

  /**
   * 장바구니 전체 카운트 조회
   */
  const getCount = async () => {
    const id = localStorage.getItem("user_id"); // <<< 지혜 / 추가 >>>
    const result = await axios.post("http://localhost:9000/cart/count", {
      id: id,
    });
    setCartCount(result.data.count);
    return result.data.count;
  };

  /**
   * 장바구니 카운트 초기화
   */
  const setCount = (value) => {
    setCartCount(value);
  };

  /**
   * 장바구니 아이템 삭제
   */
  const deleteCartItem = async (cid) => {
    const result = await axios.delete("http://localhost:9000/cart/deleteItem", {
      data: { cid: cid },
    });
    result.data.result_rows && getCartList();
  };

  /**
   * 장바구니 총 주문금액 계산하기
   */
  const calculateTotalPrice = (cartList) => {
    const totalPrice = cartList.reduce(
      (sum, item) => sum + item.price * item.qty,
      0
    );
    setTotalPrice(totalPrice);
  };

  return {
    isCartOpen,
    toggleCart: () => setIsCartOpen((prev) => !prev),
    saveToCartList,
    getCartList,
    getCount,
    setCount,
    updateCartList,
    deleteCartItem,
    calculateTotalPrice,
  };
};
