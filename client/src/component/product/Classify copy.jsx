import React, { useState, useEffect } from "react";

export default function Classify({ productList, onFilterChange }) {
  // "all", "new", "hot", "rec" 중 선택
  const [filter, setFilter] = useState("all");

  // filter나 productList가 변경될 때마다 필터링된 결과를 계산하여 부모에 전달
  useEffect(() => {
    // 필터 상태가 변경될 때 부모 컴포넌트로 필터 타입 전달
    onFilterChange(filter);
  }, [filter, onFilterChange]);

  return (
    <div className="flex gap-4">
      <button onClick={() => setFilter("all")}>전체</button>
      <button onClick={() => setFilter("new")}>신상품</button>
      <button onClick={() => setFilter("hot")}>인기상품</button>
      <button onClick={() => setFilter("rec")}>추천상품</button>
    </div>
  );
}
