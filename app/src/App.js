import "./App.css";
import CollapsibleTable from "./components/table";
import Title from "./components/h1";

function App() {
  return (
    <div className="App">
      <Title msg="Titulo" />
      <CollapsibleTable />
    </div>
  );
}

export default App;
