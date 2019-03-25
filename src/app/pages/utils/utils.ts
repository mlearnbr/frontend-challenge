import axios from 'axios'

export const getPeopleData = (url, typeOfData, resolve, reject) => {
  axios.get(url)
    .then(response => {
      const retrievedData = typeOfData.concat(response.data.results)
      if (response.data.next !== null) {
        getPeopleData(response.data.next, retrievedData, resolve, reject)
      } else {
        resolve(retrievedData)
      }
    })
    .catch(error => {
      console.log(error)
      reject('Something wrong. Please refresh the page and try again.')
    })
}