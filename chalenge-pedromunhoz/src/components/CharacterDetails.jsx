import React from 'react'
import Header from './Header'
import TableDetails from './TableDetails'
import TableFilms from './TableFilms'
import Modal from 'react-modal'
import { UseStateContext } from '../contexts/contextProvider'


function CharacterDetails() {

  const { openCharacterDetails, setOpenCharacterDetails } = UseStateContext()

  return (
    <Modal
      isOpen={ openCharacterDetails }
    >
      <div className="m-2 md:m-10 p-2 md:p-10 bg-white rounded-xl">
          <Header category="Mais" title="Detalhes" />
          <div className="flex gap-12">
              <TableDetails />
              <TableFilms />
          </div>
              <button onClick={()=>{
                setOpenCharacterDetails(false)
                window.location.reload(true);
              }}>
                fechar
              </button>
      </div>
    </Modal>
  )
}

export default CharacterDetails