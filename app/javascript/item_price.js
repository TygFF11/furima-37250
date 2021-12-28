function consumer (){
  const priceInput = document.getElementById("item-price") 

  const addTaxDom = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  priceInput.addEventListener("input", function(){
    const inputValue = priceInput.value

    const commissionCalculation = Math.floor( inputValue / 10 )
    const profitCalculation = inputValue - commissionCalculation
    
    addTaxDom.innerHTML = commissionCalculation
    profit.innerHTML = profitCalculation
  })
}


window.addEventListener('load', consumer)
