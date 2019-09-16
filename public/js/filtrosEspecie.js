var campoFiltroEspecie = document.querySelector("#filtrarEspecie");
campoFiltroEspecie.addEventListener("input", function() {

    var arrayBox = document.querySelectorAll(".box");
    if (this.value.length > 0) {
        for (var i = 0; i < arrayBox.length; i++) {
            
            var box = arrayBox[i];
            var pEspecie = box.querySelector(".especiePersonagem");
            var titulo = pEspecie.textContent;
            var expressao = new RegExp(this.value, "i");

            if (!expressao.test(titulo)) {
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
