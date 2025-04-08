/**
 * 1. DB 연동 라이브러리 호출 - DB서버주소, user, password, port 
 */
import mysql from 'mysql2';

const pool = mysql.createPool({
    host: 'alsrb1205-db.c1uagmqqwxda.ap-northeast-2.rds.amazonaws.com',
    port: 3306,
    user: 'admin',
    password: 'casetibuy!1344',
    database: 'casetibuy',
    charset: 'utf8mb4'
});

export const db = pool.promise();
