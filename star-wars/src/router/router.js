import { 
    BrowserRouter, 
    Routes, 
    Route 
} from "react-router-dom";
import CharactersPage from "../pages/CharactersPage";
import CharactersDetailsPage from "../pages/CharactersDetailsPage";

function Router() {
    return (
        <BrowserRouter>
            <Routes>
                <Route exact path="/" element={<CharactersPage />}/>
                <Route exact path="/details/:index" element={<CharactersDetailsPage />}/>
            </Routes>
        </BrowserRouter>
    );
}

export default Router;