import { useState } from 'react';
import './styles.css';

import Modal from '../modal';

function Card(props) {
    const [open,setOpen] = useState(false)

    function togleModal(evt){
        if(open && (evt.target.className !== "modal-background" && evt.target.className !== 'close-modal')){return}
        setOpen(!open)
    }
    return (
        <div className="card" onClick={togleModal}>
            <img src={props.image} alt={`Imagem do personagem ${props.name}`} />
            <span className='name'>{props.name}</span>
            <span className='specie'>Specie: {props.specie}</span>
            <span className='birthYear'>Birth Year: {props.birthYear}</span>
            
            {open ? <Modal id={props.id} closeFunct={togleModal}/> : ''}
        </div>
    );
}

export default Card;
