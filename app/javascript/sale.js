function sale (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTax = document.getElementById("add-tax-price");
    addTax.innerHTML = Math.floor(inputValue / 10);
    const tax = addTax.innerHTML
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - tax);
  });
};

window.addEventListener('load', sale);