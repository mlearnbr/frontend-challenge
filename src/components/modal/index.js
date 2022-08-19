
import { useQuery } from '@apollo/client';
import './styles.css';
import CHARACTER from '../../querys/character';
import ReactModal from 'react-modal';


function Modal(props) {
    console.log(props.id)
    var character = {}
    const { loading, error, data } = useQuery(CHARACTER,{
        variables:{id:props.id}
    });
    
    if (loading) {
        return <p>Loading...</p>;
    }

    if (error) {
        return <p>an error occurred...</p>;
    }

    if(data.character){
        const item = data.character
        character = {
            id:item.id,
            name:item.name,
            birthYear:item.birthYear ?? 'Unknown',
            eyeColor:item.eyeColor ?? 'Unknown',
            gender:item.gender ?? 'Unknown',
            hairColor:item.hairColor ?? 'Unknown',
            height:item.height ?? 'Unknown',
            mass:item.mass ?? 'Unknown',
            skinColor:item.skinColor ?? 'Unknown',
            homeworld:item.homeworld.name ?? 'Unknown',
            films:item.films.results,
            specie:item.species.results.length > 0 ? item.species.results[0].name : 'Human',
        }
    }
    return (

            <ReactModal
                isOpen={true}
                className="modal"
                ariaHideApp={false}
            >
                <div className='modal-header'>
                     <button className='close-modal'>
                        <img className='close-modal' src="/images/close.svg" alt="close button" />
                    </button>
                </div>
                <div className='modal-body'>
                    <h1 className='name'>{character.name}</h1>
                    <span className='species'><span className='title'>Species</span>  : {character.specie}</span>
                    <span className='birthYear'><span className='title'>Birth Year</span> : {character.birthYear}</span>
                    <span className='eyeColor'><span className='title'>Eye Color</span> : {character.eyeColor}</span>
                    <span className='gender'><span className='title'>Gender</span> : {character.gender}</span>
                    <span className='hairColor'><span className='title'>HairColor</span> : {character.hairColor}</span>
                    <span className='height'><span className='title'>Height</span> : {character.height}</span>
                    <span className='mass'><span className='title'>Mass</span> : {character.mass}</span>
                    <span className='skinColor'><span className='title'>Skin Color</span> : {character.skinColor}</span>
                    <span className='homeworld'><span className='title'>Homeworld</span> : {character.homeworld}</span>
                    <span className='films'>
                        <span className='title'>Films</span> :  
                        <ul>
                            {character.films.map((item,index) => {
                                return(
                                    <li key={index}>{item.title} - {new Date(item.releaseDate).getFullYear()}</li>
                                )
                            })}
                        </ul>
                    </span>
                </div>
            </ReactModal>

            // <div className="modal" >
            //     <div className='modal-header'>
            //         <button className='close-modal'>
            //             <img className='close-modal' src="/images/close.svg" alt="close button" />
            //         </button>
            //     </div>
            //     <div className='modal-body'>
            //         <h1 className='name'>{character.name}</h1>
            //         <span className='species'><span className='title'>Species</span>  : {character.specie}</span>
            //         <span className='birthYear'><span className='title'>Birth Year</span> : {character.birthYear}</span>
            //         <span className='eyeColor'><span className='title'>Eye Color</span> : {character.eyeColor}</span>
            //         <span className='gender'><span className='title'>Gender</span> : {character.gender}</span>
            //         <span className='hairColor'><span className='title'>HairColor</span> : {character.hairColor}</span>
            //         <span className='height'><span className='title'>Height</span> : {character.height}</span>
            //         <span className='mass'><span className='title'>Mass</span> : {character.mass}</span>
            //         <span className='skinColor'><span className='title'>Skin Color</span> : {character.skinColor}</span>
            //         <span className='homeworld'><span className='title'>Homeworld</span> : {character.homeworld}</span>
            //         <span className='films'>
            //             <span className='title'>Films</span> :  
            //             <ul>
            //                 {character.films.map(item => {
            //                     return(
            //                         <li>{item.title} - {new Date(item.releaseDate).getFullYear()}</li>
            //                     )
            //                 })}
            //             </ul>
            //         </span>
            //     </div>
            // </div>
        
       
    );
}

export default Modal;
