import React, {PropTypes, Component} from 'react'
import {bindActionCreators} from 'redux'
import {Provider, connect} from 'react-redux'
import ReactDOM from 'react-dom'
import * as ActorActionCreators from '../actions/actor'
import * as EncounterActionCreators from '../actions/encounter'
import EncounterHeader from './encounter/header'
import EncounterActors from './encounter/actors'
import ActorForm from './encounter/actorForm'
import createAppStore from '../util/createAppStore'

class Encounter extends Component {
  static propTypes = {
    activeEncounter: PropTypes.object.isRequired,
  }

  componentWillMount() {
    const {encounterActions, activeEncounter} = this.props
    encounterActions.find(activeEncounter.id)
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
    encounterActions: bindActionCreators(EncounterActionCreators, dispatch)
  }
}

const ConnectedEncounter = connect(
  mapStateToProps,
  mapActionsToProps,
)(Encounter)

// DOM setup
const container = document.getElementById('Encounter')

if (container) {
  const {encounterId} = container.dataset
  const store = createAppStore({
    activeEncounter: {
      id: parseInt(encounterId, 10),
      actors: [],
    }
  })

  ReactDOM.render(
    <Provider store={store}>
      <ConnectedEncounter />
    </Provider>,
    container
  )
}
