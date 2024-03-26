// カード情報を取得し、トークンを生成してサーバーサイドへ送信する
var form = document.getElementById('payment-form');
form.addEventListener('submit', function(event) {
  event.preventDefault();
  Payjp.createToken({
    number: document.getElementById('card_number').value,
    exp_month: document.getElementById('exp_month').value,
    exp_year: document.getElementById('exp_year').value,
    cvc: document.getElementById('cvc').value
  }, function(status, response) {
    if (status === 200) {
      var token = response.id;
      // 生成されたトークンをサーバーサイドへ送信する
      var hiddenInput = document.createElement('input');
      hiddenInput.setAttribute('type', 'hidden');
      hiddenInput.setAttribute('name', 'payjp_token');
      hiddenInput.setAttribute('value', token);
      form.appendChild(hiddenInput);
      // フォームをサーバーサイドへ送信する
      form.submit();
    } else {
      // エラーメッセージを表示するなどの処理を行う
      console.error(response.error.message);
    }
  });
});