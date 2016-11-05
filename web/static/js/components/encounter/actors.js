import React, {Component, PropTypes} from 'react'

export default class EncounterActors extends Component {

  render() {
    const {actors} = this.props

    return (
      <ul className="Encounter-actors EncounterActors">
        {actors.map((actor) => <Actor actor={actor} key={`actor-${actor.id}`} />)}
      </ul>
    )
  }
}

const Actor = ({actor}) =>
  <li className="EncounterActors-actor Actor">
    <h2>{actor.name}</h2>
    <p>HP: {actor.hp}</p>
  </li>
