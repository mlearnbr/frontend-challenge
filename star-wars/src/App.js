import GlobalState from "./global/GlobalState";
import Router from "./router/router";

function App() {
  return (
    <>
      <GlobalState>
        <Router />
      </GlobalState>
    </>
  );
}

export default App;
