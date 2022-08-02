import { ApolloClient, InMemoryCache } from "@apollo/client";

const client = new ApolloClient({
  uri: "https://parseapi.back4app.com/graphql",
  cache: new InMemoryCache(),
  headers:{
    'X-Parse-Application-Id': 'kFuqGsemy2j84m8AfykdWikN2WdHEs45uGIFDV7F', // This is the fake app's application id
    'X-Parse-Master-Key': 'mbUJqmLAMaVoASAkhmnOWf6am5qhmFXL5hcw0Ecf', // This is the fake app's readonly master key
  },
  cors: {
    origin: ["http://localhost:3000 ", "https://parseapi.back4app.com/graphql"]
  },
});

export default client;
