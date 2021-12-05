function paginacao(obj_items){
    
    const list_element = container;
    const pagination_element = document.getElementById('pagination');
    
    let pagina_atual = 1;
    let quantidade = 12;
    
    function mostrarItems (items, wrapper, blts_por_pagina, pagina) {
        wrapper.innerHTML = "";
        pagina--;
    
        let inicio = blts_por_pagina * pagina;
        let fim = inicio + blts_por_pagina;
        let itens_por_pagina = items.slice(inicio, fim);

        for (let i = 0; i < itens_por_pagina.length; i++)
            wrapper.appendChild(items[i+inicio]);
    }
    
    function SetupPaginacao (items, wrapper, blts_por_pagina) {
        wrapper.innerHTML = "";
    
        let conta_paginas = Math.ceil(items.length / blts_por_pagina);
        for (let i = 1; i <= conta_paginas; i++) {
            let btnp = PaginationButton(i, items);
            wrapper.appendChild(btnp);
        }
    }
    
    function PaginationButton (pagina, items) {
        let button = document.createElement('button');
        button.innerText = pagina;
    
        if (pagina_atual == pagina) button.classList.add('active');
    
        button.addEventListener('click', function () {
            pagina_atual = pagina;
            
            mostrarItems(items, list_element, quantidade, pagina_atual);
    
            let btn_atual = document.querySelector('.pagenumbers button.active');
            btn_atual.classList.remove('active');
    
            button.classList.add('active');
        });
    
        return button;
    }
    
    mostrarItems(obj_items, list_element, quantidade, pagina_atual);
    SetupPaginacao(obj_items, pagination_element, quantidade);
    
};