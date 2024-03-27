const pay = () => {
  console.log("ok")
  const payjp = Payjp('pk_test_ea813664c40ceef5538ce36f');
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  form.addEventListener("submit", async (e) => {
    e.preventDefault();
    const { token, error } = await payjp.createToken(numberElement);
    if (error) {
      console.error(error.message);
      return;
    }
    const tokenInput = document.createElement('input');
    tokenInput.setAttribute('type', 'hidden');
    tokenInput.setAttribute('name', 'token');
    tokenInput.setAttribute('value', token);
    form.appendChild(tokenInput);
    form.submit();
  });
};

window.addEventListener("turbo:load", pay);

