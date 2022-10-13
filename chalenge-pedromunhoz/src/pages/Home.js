import React from 'react'
import Header from '../components/Header'
import Table from '../components/Table'
import CharacterDetails from '../components/CharacterDetails'

function Home() {
  return (
    <div className="m-2 md:m-10 p-2 md:p-10 bg-white rounded-xl">
      <Header category="Desafio" title="StarWars" />
      <Table/>
      <CharacterDetails />
    </div>
  )
}

export default Home