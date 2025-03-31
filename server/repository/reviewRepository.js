import { db } from './db.js'

export const getReviewList = async (pid) => {
    const sql = `
        select * from casetibuy_review where pid = ?
    `;

    const [result] = await db.execute(sql, [pid]);

    return result;
}

export const addReview = async (formData) => {
    const sql = `
        insert into casetibuy_review (order_id, pid, member_id, kinds, color, casetype, comment, rating, review_date)
        values (?, ?, ?, ?, ?, ?, ?, ?, now())
    `;
    const values = [
        formData.order_id,
        formData.pid,
        formData.member_id,
        formData.kinds,
        formData.color,
        formData.case,
        formData.comment,
        formData.rating,
    ];
    const [result] = await db.execute(sql, values);

    return { "result_rows": result.affectedRows };
}