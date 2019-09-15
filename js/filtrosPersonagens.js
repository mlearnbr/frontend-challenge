var campoFiltro = document.querySelector("#filtrarPersonagem");
campoFiltro.addEventListener("input", function() {

    var arrayBox = document.querySelectorAll(".box");
    if (this.value.length > 0) {
        for (var i = 0; i < arrayBox.length; i++) {
            
            var box = arrayBox[i];
            var h2Nome = box.querySelector(".nomePersonagem");
            var nome = h2Nome.textContent;
            var expressao = new RegExp(this.value, "i");

            if (!expressao.test(nome)) {
                box.classList.add("invisivel");
            } else {
                box.classList.remove("invisivel");
            }
        }
    } else {
        for (var i = 0; i < arrayBox.length; i++) {
            var box = arrayBox[i];
            box.classList.remove("invisivel");
        }
    }
});


