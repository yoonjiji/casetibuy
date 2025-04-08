import { db } from "./db.js";
/**
 * 유저 아이디
 */
export const getId = async ({ id }) => {
  const sql = `
            select * from casetibuy_cart
              where id = ? 
    `;
  const [result] = await db.execute(sql, [id]);

  return result;
};

/**
 * 장바구니 전체 조회
 */
export const getItems = async ({ id }) => {
  const sql = `
            select * from view_cart_list 
            where id = ?
    `;
  const [result] = await db.execute(sql, [id]);

  return result;
};

/**
 * 장바구니 추가
 */
export const addCart = async ({ id, cartList }) => {
  let result_rows = 0;

  const result = await Promise.all(
    cartList.map(async (item) => {
      const values = [
        item.qty ?? 1,
        id,
        item.pid ?? null,
        item.kinds ?? "종류 없음",
        item.cname ?? "이름 없음",
        item.color ?? "색상 없음",
        item.caseType ?? "기본 케이스",
        item.image ?? "이미지 없음",
        item.price ?? 0,
      ];
      const sql = `
                  insert into casetibuy_cart(qty, id, pid, kinds, cname, color, caseType, image, price, cdate)
                  values(?, ?, ?, ?, ?, ?, ?, ?, ?, now());
                `;

      const [result] = await db.execute(sql, values); //Promise형태로 실행
      return result.affectedRows;
    })
  );
  result_rows = result.reduce((acc, cur) => acc + cur, 0);
  
  return { result_rows: result_rows };
};

/**
 * 장바구니 전체 카운트 조회
 */
export const getCount = async ({ id }) => {
  const sql = `
        select count(*) as count from casetibuy_cart
            where id= ?
    `;

  const [result] = await db.execute(sql, [id]); // [[{count: 2}] [count필드정보]]
  return result[0];
};

/**
 * 장바구니 상품 수량 업데이트
 */
export const updateQty = async ({ cid, type }) => {
  const str = type === "increase" ? "qty=qty+1" : "qty=qty-1";
  const sql = `
        update casetibuy_cart 
            set ${str}
            where cid = ?
    `;

  const [result] = await db.execute(sql, [cid]);
  return { result_rows: result.affectedRows };
};

/**
 * 장바구니 아이템 삭제
 */
export const deleteItem = async ({ cid }) => {
  const sql = `
        delete from casetibuy_cart where cid = ?
    `;
  const [result] = await db.execute(sql, [cid]);
  return { result_rows: result.affectedRows };
};
