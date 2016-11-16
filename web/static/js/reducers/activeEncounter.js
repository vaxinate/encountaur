import * as Actor from '../actions/actor'
import * as Encounter from '../actions/encounter'

const INITIAL_STATE = {
  id: null,
  name: '',
  hp: '',
  actors: [],
  loading: false,
}

export default function activeEncounter(state = INITIAL_STATE, action) {
  const {type, payload, error, meta} = action
  console.log(type)

  switch(action.type) {
    case Actor.BEGIN_CREATE:
      return {...state, loading: true}
    case Actor.CREATE_SUCCESS:
      console.log('action: ', action)
      const actors = [payload, ...state.actors]
      return {...state, actors, loading: false}
    case Actor.CREATE_ERROR:
      console.log(payload)
      console.log(payload.stack)
      return {...state, error}
    case Encounter.BEGIN_FIND:
      return {...state, loading: true}
    case Encounter.FIND_SUCCESS:
      return {...payload, loading: false}
    case Encounter.FIND_ERROR:
      console.log(payload)
      console.log(payload.stack)
      return {...state, error}
    default:
      return state
  }
}
