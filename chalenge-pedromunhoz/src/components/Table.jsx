import React from 'react'
import axios from 'axios'
import { GrStatusInfo } from 'react-icons/gr'
import { UseStateContext } from '../contexts/contextProvider'


function Table () {

    const { peoples, setPeoples, specie, setSpecie,
        setName, setBirth_year, setEye_color, setGender, setHair_color,
        setHeight, setMass, setSkin_color, setHomeworld, setFilmsLink, setOpenCharacterDetails } = UseStateContext()


    function getPeople(){
      axios.get( "https://swapi.dev/api/people/" )
          .then(( response )=>{
            setPeoples( response.data.results )
          })
          .catch( error=>{
              console.log( error )
          })
    }
    getPeople()

    function getSpecie( link ){
      axios.get( link  )
          .then(( response )=>{
            setSpecie( response.data )
          })
          .catch( error=>{
              console.log( error )
          })
          return specie.name
    }

    function getWorld( link ){
        axios.get( link  )
            .then(( response )=>{
                setHomeworld( response.data )
            })
            .catch( error=>{
                console.log( error )
            })
    }
    return (
        <div>
            <table className="border-2 border-gray-400 text-center">
                <thead>
                    <tr className="border-2 border-gray-400 bg-blue-900  text-white">
                        <td className="p-4">Name</td>
                        <td className="p-4">Specie</td>
                        <td className="p-4">Birth Year</td>
                        <td className="p-4">More Details</td>
                    </tr>
                </thead>
                <tbody>
                {peoples.map((i, index)=>(
                    <tr key={index} className="border-2 border-gray-400 ">
                        <td className="p-2">
                            {i.name}
                        </td>
                        <td className="p-2">
                            { !i.species[0] ? "unknown" : getSpecie( i.species[0] ) }
                        </td>
                        <td className="p-2">
                            {i.birth_year}
                        </td>
                        <td className="p-2">
                            <button className="cursor-pointer" onClick={()=>{
                                setName(i.name)
                                setBirth_year(i.birth_year)
                                setEye_color(i.eye_color)
                                setGender(i.gender)
                                setHair_color(i.hair_color)
                                setHeight(i.height)
                                setMass(i.mass)
                                setSkin_color(i.skin_color)
                                getWorld(i.homeworld)
                                setFilmsLink(i.films)
                                setOpenCharacterDetails(true)
                            }}>
                                <GrStatusInfo />
                            </button>
                        </td>
                    </tr>
                ))}
                </tbody>
            </table>
        </div>
    )
}

export default Table