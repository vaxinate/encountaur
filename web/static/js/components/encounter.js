import React, {PropTypes, Component} from 'react'
import {bindActionCreators} from 'redux'
import {Provider, connect} from 'react-redux'
import ReactDOM from 'react-dom'
import * as ActorActionCreators from '../actions/actor'
import createAppStore from '../util/createAppStore'
import EncounterHeader from './encounter/header'
import EncounterActors from './encounter/actors'
import ActorForm from './encounter/actorForm'

class Encounter extends Component {
  static propTypes = {
    activeEncounter: PropTypes.object.isRequired,
  }

  render() {
    const {activeEncounter, actorActions} = this.props

    return (
      <section className="Encounter">
        <EncounterHeader encounter={activeEncounter} />
        <ActorForm
          encounterId={activeEncounter.id}
          onSave={actorActions.create}
        >
          <h2>New Actor</h2>
        </ActorForm>
        <EncounterActors actors={activeEncounter.actors} />
      </section>
    )
  }
}

const mapStateToProps = (state) => state
const mapActionsToProps = (dispatch) => {
  return {
    actorActions: bindActionCreators(ActorActionCreators, dispatch),
  }
}

const ConnectedEncounter = connect(
  mapStateToProps,
  mapActionsToProps,
)(Encounter)

// DOM setup
const container = document.getElementById('Encounter')

if (container) {
  // TODO: replace this with real data at some point
  const store = createAppStore({
    activeEncounter: {
      id: 1,
      name: 'this is fake',
      actors: [
        {id: 1, name: 'Fake Dude', hp: 10},
        {id: 2, name: 'Fake Lady', hp: 10},
      ],
    },
  })

  ReactDOM.render(
    <Provider store={store}>
      <ConnectedEncounter />
    </Provider>,
    container
  )
}
