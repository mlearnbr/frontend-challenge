import React from 'react'
import { UseStateContext } from '../contexts/contextProvider'
import axios from 'axios'

function TableDetails() {
    const { name, birth_year, eye_color,gender,hair_color,
        height, mass,skin_color, homeworld, films, setFilms, filmsLink,
        specie } = UseStateContext()

    function getFilm( link ){
        axios.get( link  )
            .then(( response )=>{
                if(films.indexOf(response.data.title) < 0) {
                    let aux = films
                    aux.push(response.data.title)
                    setFilms(aux)
                }
            })
            .catch( error=>{
                console.log( error )
            })
        return films
    }

    filmsLink?.map((link)=>getFilm(link))
    return (
        <table className="border-2 border-gray-400 text-center">
            <tbody>
                <tr className="border-2 text-center border-gray-400 text-white">
                    <td className="p-4  bg-blue-900 ">Name</td>
                    <td className="text-gray-700 p-4"> { name } </td>
                </tr>
                <tr className="border-2 text-center border-gray-400 text-white">
                    <td className="p-4  bg-blue-900 ">Birth Year</td>
                    <td className="text-gray-700 p-4"> { birth_year } </td>
                </tr>
                <tr className="border-2 text-center border-gray-400 text-white">
                    <td className="p-4  bg-blue-900 ">Eye Color</td>
                    <td className="text-gray-700 p-4"> { eye_color } </td>
                </tr>
                <tr className="border-2 text-center border-gray-400 text-white">
                    <td className="p-4  bg-blue-900 ">Gender</td>
                    <td className="text-gray-700 p-4"> { gender } </td>
                </tr>
                <tr className="border-2 text-center border-gray-400 text-white">
                    <td className="p-4  bg-blue-900 ">Hair Color</td>
                    <td className="text-gray-700 p-4"> { hair_color } </td>
                </tr>
                <tr className="border-2 text-center border-gray-400 text-white">
                    <td className="p-4  bg-blue-900 ">Height</td>
                    <td className="text-gray-700 p-4"> { height } </td>
                </tr>
                <tr className="border-2  border-gray-400 text-white">
                    <td className="p-4  bg-blue-900 ">Mass</td>
                    <td className= "text-center text-gray-700 p-4"> { mass } </td>
                </tr>
                <tr className="border-2  border-gray-400 text-white">
                    <td className="p-4  bg-blue-900 ">Skin Color</td>
                    <td className= "text-center text-gray-700 p-4"> { skin_color } </td>
                </tr>
                <tr className="border-2  border-gray-400 text-white">
                    <td className="p-4  bg-blue-900 ">Home World</td>
                    <td className= "text-center text-gray-700 p-4"> { homeworld.name } </td>
                </tr>
                <tr className="border-2  border-gray-400 text-white">
                    <td className="p-4  bg-blue-900 ">Species</td>
                    <td className= "text-center text-gray-700 p-4"> { specie.name } </td>
                </tr>
            </tbody>
        </table>
    )
}

export default TableDetails