function updatePrice() {
    let itemPrice = parseFloat(document.getElementById('item-price').value);
    let addTaxPrice = document.getElementById('add-tax-price');
    let profit = document.getElementById('profit');
    
    if (addTaxPrice !== null && profit !== null) {
        const calcTax = Math.floor(itemPrice * 0.1);
        const calcProfit = Math.floor(calcTax + itemPrice);
        
        addTaxPrice.innerText = calcTax;
        profit.innerText = calcProfit;
    }
}

// 新規登録ページが読み込まれた際に直接 updatePrice() 関数を呼び出す
updatePrice();

document.getElementById('item-price').addEventListener('input', updatePrice);
