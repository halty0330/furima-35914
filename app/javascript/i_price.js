window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
   console.log(priceInput);
  
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
    console.log(inputValue);

  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
    console.log(addTaxDom);

    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
    console.log(addProfitDom);
  })
});

