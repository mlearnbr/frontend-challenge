import { useQuery } from '@apollo/client';
import CHARACTERS from '../../querys/characters';
import './styles.css';

import Card from '../../components/card'

function Home() {
    
    const { loading, error, data } = useQuery(CHARACTERS);

    
    if (loading) {
        return <p>Loading...</p>;
    }

    if (error) {
        return <p>an error occurred...</p>;
    }
    
    const characters = data.characters.results.map( (item,index) => {
      return {
        id:item.id,
        name:item.name,
        specie:item.species.results.length > 0 ? item.species.results[0].name : 'Human',
        birthYear:item.birthYear
      }
    })

    
    return (
      <div className='home'>
        {characters.map((item,index) => {
          return(
            <Card 
              key={index} 
              id={item.id} 
              image="/images/image.png" 
              name={item.name} 
              specie={item.specie} 
              birthYear={item.birthYear}
            />
          )
        })}
      </div>
    );
}

export default Home;
