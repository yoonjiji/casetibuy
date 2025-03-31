import React, { useEffect, useState, useContext } from "react";
import { AuthContext } from "../context/AuthContext.js";
import useOrder from "../hooks/useOrder.js";
import SeriesItem from "./product/SeriesItem.jsx";
import { Swiper, SwiperSlide } from 'swiper/react';
import useColorScheme from "../hooks/useColorScheme.js";
import { useNavigate } from "react-router-dom";

export default function OrderList() {
    const { isLoggedIn } = useContext(AuthContext);
    const { getOrderList } = useOrder();
    const [orderGroups, setOrderGroups] = useState([]);
    const getColorScheme = useColorScheme();
    const navigate = useNavigate();
    useEffect(() => {
        if (isLoggedIn) {
            getOrderList().then((data) => {
                if (!data) return;
                // order_id별 그룹화
                const groups = {};
                data.forEach((row) => {
                    if (!groups[row.order_id]) {
                        groups[row.order_id] = [];
                    }
                    groups[row.order_id].push(row);
                });
                // 내림차순 정렬
                const orderArray = Object.values(groups).sort(
                    (a, b) => new Date(b[0].order_date) - new Date(a[0].order_date)
                );
                setOrderGroups(orderArray);
            });
        }
    }, [isLoggedIn, getOrderList]);

    if (!orderGroups.length) {
        return <p>구매한 주문이 없습니다.</p>;
    }

    return (
        <div className="flex flex-col gap-8">
            <h2 className="font-bold text-32 mb-30">주문</h2>
            {/* <div className="flex gap-10 mb-10">
                <span className="px-20 py-10 text-white bg-black border rounded-full">
                    모든 주문
                </span>
                <span className="px-20 py-10 border rounded-full">출고 완료</span>
            </div> */}

            {orderGroups.map((orderGroup) => {
                const orderInfo = orderGroup[0];
                return (
                    <div
                        key={orderInfo.order_id}
                        className="p-16 border shadow-sm border-[#d9d9d9] rounded-20 mb-15"
                    >
                        {/* 주문 정보 */}
                        <div className="mb-4">
                            <li className="flex items-center justify-between">
                                <span className="mb-16 font-bold">
                                    {/* 주문 현황 : <span className="font-bold">{orderInfo.order_status}</span> */}
                                </span>
                                <span className="flex items-center">
                                    <span className="p-2 mr-5 bg-sky text-blue text-10">포인트</span>
                                    <span className="text-blue">적립 완료</span>
                                    {/* <FontAwesomeIcon icon={faAngleRight} className="ml-20" /> */}
                                </span>
                            </li>

                            <div className="grid grid-flow-col w-[400px]">
                                <div className="flex flex-col text-[#8b8b8b]">
                                    <span>주문 번호</span>
                                    <span className="mt-8">주문 일자</span>
                                    <span className="my-8">총 금액</span>
                                </div>
                                <div className="flex flex-col">
                                    <span>{orderInfo.order_id}</span>
                                    <span className="mt-8">
                                        {new Date(orderInfo.order_date).toLocaleString()}
                                    </span>
                                    <span className="my-8">
                                        {Number(orderInfo.total_price).toLocaleString()} 원
                                    </span>
                                </div>
                            </div>
                        </div>

                        <Swiper
                            spaceBetween={8}
                            breakpoints={{
                                768: { slidesPerView: 3.2 },
                                1024: { slidesPerView: 4 },
                                1280: { slidesPerView: 4.8 },
                            }}
                        >
                            {orderGroup.map((item, index) => {
                                const { bg, text } = getColorScheme(index);

                                return (
                                    <SwiperSlide key={`${item.product_id}-${index}`}>
                                        <SeriesItem
                                            onClick={() => {
                                                navigate(`/detail/${item.product_id}`);
                                                window.scrollTo(0, 0);
                                            }}
                                            className={`p-8 pb-16 h-[250px] w-[200px] rounded-16 ${bg}`}
                                            imageSrc={item.image}
                                            titleClassName={`mt-10 text-16 font-bold text-left ${text}`}
                                            title={item.product_name}
                                        />
                                    </SwiperSlide>
                                );
                            })}
                        </Swiper>
                    </div>
                );
            })}
        </div>
    );
}
