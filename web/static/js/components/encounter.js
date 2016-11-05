import React, {PropTypes, Component} from 'react'
import ReactDOM from 'react-dom'

import EncounterHeader from './encounter/header'
import EncounterActors from './encounter/actors'
import ActorForm from './encounter/actorForm'

class Encounter extends Component {
  static propTypes = {
    encounter: PropTypes.object.isRequired,
  }

  render() {
    const {encounter} = this.props

    return (
      <section className="Encounter">
        <EncounterHeader encounter={encounter} />
        <ActorForm encounterId={encounter.id}>
          <h2>New Actor</h2>
        </ActorForm>
        <EncounterActors actors={encounter.actors} />
      </section>
    )
  }
}

const container = document.getElementById('Encounter')
if (container) {
  // TODO: use real data here obviously
  const encounter = {
    id: 1,
    name: 'this is fake',
    actors: [
      {id: 1, name: 'Fake Dude', hp: 10},
      {id: 2, name: 'Fake Lady', hp: 10},
    ]
  }
  ReactDOM.render(<Encounter encounter={encounter}/>, container)
}
