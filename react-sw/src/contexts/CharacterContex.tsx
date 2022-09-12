import { createContext, Dispatch, ReactNode, useReducer } from 'react'
import { Character } from '../typings/characters'

type CharacterState = typeof initialState;
type Action = {
  type: 'SET_CHARACTER' | 'SET_THUMBNAIL'
  payload: Character
}

interface ChildrenElementProps {
  children: ReactNode
}

interface ContextType {
  state: CharacterState
  dispatch: Dispatch<Action>
}

const initialState = {
  character: {
    birth_year: '',
    eye_color: '',
    films: [''],
    gender: '',
    hair_color: '',
    height: '',
    homeworld: '',
    mass: '',
    name: '',
    skin_color: '',
    species: ['']
  },
  thumbnail: ''
}

const reducer = (state: CharacterState, action: Action) => {
  switch (action.type) {
    case 'SET_CHARACTER':
      return {
          ...state,
          character: action.payload
      };
    case 'SET_THUMBNAIL':
      return {
          ...state,
          thumbnail: action.payload.thumbnail
      };
    default:
      throw new Error();
  }
}

export const CharacterContext = createContext<ContextType>({
  state: initialState,
  dispatch: () => {}
})

const CharacterProvider = ({ children }: ChildrenElementProps) => {
  const [state, dispatch] = useReducer(reducer, initialState)

  return (
      <CharacterContext.Provider value={{ state, dispatch }}>
          { children }
      </CharacterContext.Provider>
  )
}

export default CharacterProvider
