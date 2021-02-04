import entityReducer from "../reducers/entities_reducer"

export const fetchAllPokemon = () => {
  return $.ajax({
    method: "GET",
    url: "api/pokemons"
  })
}