function ProductList({ products }) {

    const parseCaseAndColor = (fileName) => {
      // 예시 정규식 등으로 caseType, color 추출
      const match = fileName.match(/_case_([a-zA-Z]+)_color_([a-zA-Z]+)/);
      if (!match) return { caseType: "", color: "" };
      return { caseType: match[1], color: match[2] };
    };
  
    return (
      <div>
        {products.map(product => {
          // 상품의 upload_file 배열을 복사
          let files = product.upload_file ? [...product.upload_file] : [];
  
          // 1) 필터링: bounce 케이스만
          files = files.filter(f => {
            const { caseType } = parseCaseAndColor(f);
            return caseType === "bounce";
          });
  
          // 2) 정렬 필요 시 (파일명 끝번호 기준)
          files.sort((a, b) => {
            const numA = extractNumber(a);
            const numB = extractNumber(b);
            return numA - numB;
          });
  
          return (
            <div key={product.pid}>
              <h2>{product.name}</h2>
              <div>
                {files.map((filePath, idx) => {
                  const fullUrl = "http://localhost:9000/" + filePath.replace(/\\/g, "/");
                  return (
                    <img
                      key={idx}
                      src={fullUrl}
                      alt={`img-${idx}`}
                      style={{ width: "100px", margin: "5px" }}
                    />
                  );
                })}
              </div>
            </div>
          );
        })}
      </div>
    );
  }
  