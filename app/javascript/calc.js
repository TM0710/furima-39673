function calc (){
  const itemprice = document.getElementById("item-price");
  itemprice.addEventListener("keyup", () => {
    const itempriceVal = itemprice.value;
    const tax = 0.1
    const commission =  Math.floor(itempriceVal * tax);
    const addtaxprice = document.getElementById("add-tax-price");
    addtaxprice.innerHTML = `${commission}`;
    const profit = document.getElementById("profit");
    const profitprice = itempriceVal - commission
    profit.innerHTML = `${profitprice}`
  });
};
 
window.addEventListener('turbo:load', calc);
 