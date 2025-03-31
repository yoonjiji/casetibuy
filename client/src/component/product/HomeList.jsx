import React, { useContext, useState } from 'react';
import ProductType from './ProductType.jsx';
import Series from './Series.jsx';
import { PListContext } from '../../context/PListContext.js';


export default function HomeList() {
    // 시리즈 데이터를 JSON 형식의 배열로 정의


    return (
        <div className=''>
            <Series />
            <ProductType />
        </div>
    );
}

