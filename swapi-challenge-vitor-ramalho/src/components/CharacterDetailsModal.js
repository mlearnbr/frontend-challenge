import React from 'react'
import { usePeople } from '../providers/peopleProvider';
import './CharacterDetailsModal.css';

const CharacterDetailsModal = ({ setOpenModal }) => {
    const { people } = usePeople();


    return (
        <div className="modal-background">
            <div className="modal-container">
                <div className="close-btn">
                    <button
                        onClick={() => {
                            setOpenModal(false);
                        }}
                    >
                        X
                    </button>
                </div>
                <div className="modal-title">
                    <h1>This is the modal Title, Nice</h1>
                </div>
                <div className="modal-body">
                    <p>This is the modal paragraph</p>
                </div>
                <div className="modal-footer">
                    <p>This is the modal Footer</p>
                </div>
            </div>
        </div>
    )
}

export default CharacterDetailsModal
