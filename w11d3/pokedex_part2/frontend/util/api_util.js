export const fetchAllPokemon = () => {
  return $.ajax({
    method: "GET",
    url: "/api/pokemon"
  })
}

export const fetchAPokemon = (pokeId) => {
  return $.ajax({
    method: "GET",
    url: `/api/pokemon/${pokeId}`
  })
}