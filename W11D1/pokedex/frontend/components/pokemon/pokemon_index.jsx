import React from 'react';

class PokemonIndex extends React.Component {
  constructor(props){
    super(props)
  }

  allPokemon() {
    const {pokemon} = this.props;
    return pokemon.map(poke => {
      console.log(poke);
      
      return (
        <li key={poke.id}>
          <label>{poke.name}</label>
          <img src={poke.image_url}/>
        </li>)
    })
  }

  componentDidMount() {
    this.props.requestAllPokemon;
    console.log(this.props);
    
  }

  render() {

    return (
      <div>
        <ul>
          {this.allPokemon()}
        </ul>
      </div>
    )
  }
}

export default PokemonIndex;