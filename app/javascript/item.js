
function updatePrice() {
    let itemPrice = parseFloat(document.getElementById('item-price').value);
    let addTaxPrice = document.getElementById('add-tax-price');
    let profit = document.getElementById('profit');
    
    const calcTax = Math.floor(itemPrice * 0.1);
    const calcProfit = Math.floor(calcTax + itemPrice);
    
    addTaxPrice.innerText = calcTax;
    profit.innerText = calcProfit;
}

document.getElementById('item-price').addEventListener('input', updatePrice);

window.addEventListener('load', updatePrice);
