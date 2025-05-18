var elements = document.querySelectorAll(".yyosfl4");

var buttonsConnect = [];
elements.forEach((element) => {
  if (element.innerText.includes("Conectar")) {
    buttonsConnect.push(element);
  }
});

buttonsConnect.map((button) => {
  button.click();
});
