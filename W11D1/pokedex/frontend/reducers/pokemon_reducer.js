import {RECEIVE_ALL_POKEMON} from '../actions/pokemon_actions'

const pokemonReducer = (prevState = {}, action) => {
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return action.pokemon;
    default:
      return prevState;
  }
}

export default pokemonReducer;