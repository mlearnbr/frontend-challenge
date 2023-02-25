import './App.css';
import Characters from './components/Characters';
import {PeopleProvider} from './providers/peopleProvider';

function App() {
  return (
    <>
      <PeopleProvider>
        <Characters />
      </PeopleProvider>
    </>
  );
}

export default App;
