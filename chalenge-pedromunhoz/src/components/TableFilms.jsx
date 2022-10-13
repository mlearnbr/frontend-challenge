import React from 'react'
import { UseStateContext } from '../contexts/contextProvider'
import { BiSearchAlt } from 'react-icons/bi'

function TableFilms() {
    const { films } = UseStateContext()

    function handleFilms() {
        let tr, td, txtValue;
        const input = document.getElementById("input");
        const filter = input.value.toUpperCase();
        const table = document.getElementById("table");
        tr = table.getElementsByTagName("tr");
        for (let i = 0; i < tr.length; i++) {
          td = tr[i].getElementsByTagName("td")[0];
          if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
              tr[i].style.display = "";
            } else {
              tr[i].style.display = "none";
            }
          }
        }
      }
    return (
        <div className="flex flex-col">
            <div className="flex border-1 border-gray-500 rounded-xl mb-2 p-1">
                <input className="focus:outline-none w-full" id="input" placeholder="Search Films" type="search" />
                <BiSearchAlt className="cursor-pointer" width="350px" onClick={()=> handleFilms()}/>
            </div>
            <table className="border-2 border-gray-400 items-center" id="table">
                <thead>
                    <tr className="border-2 border-gray-400 bg-blue-900  text-white text-center">
                        <td className="p-3">Thumb</td>
                        <td className="p-3">Films</td>
                    </tr>
                </thead>
                <tbody>
                    { films.map((i,index)=>(
                        <tr id="tr" key={index} className="border-2 border-gray-400 ">
                            <td className= "p-2 text-black filme">{i}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    )
}

export default TableFilms