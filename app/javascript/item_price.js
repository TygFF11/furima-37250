function consumer (){
  const priceInput = document.getElementById("item-price") 
  
  priceInput.addEventListener("input", function(){
    const inputValue = priceInput.value
    
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = Math.round( priceInput.value / 10 )
    
    const profit = document.getElementById("profit")
    profit.innerHTML = priceInput.value - Math.round( priceInput.value / 10 )
    
  })
}

window.addEventListener('load', consumer)
