import * as Actor from '../actions/actor'

const INITIAL_STATE = {
  id: null,
  name: '',
  hp: '',
  actors: [],
  loading: false,
}

export default function activeEncounter(state = INITIAL_STATE, action) {
  console.log(action.type)
  switch(action.type) {
    case Actor.BEGIN_CREATE:
      return {...state, loading: true}
    case Actor.CREATE_SUCCESS:
      console.log('action: ', action)
      const actors = [...state.actors, action.payload]
      return {...state, actors, loading: false}
    case Actor.CREATE_ERROR:
      const {error, payload} = action
      console.log(payload)
      console.log(payload.stack)
      return {...state, error}
    default:
      return state
  }
}
