import activeEncounter from './activeEncounter'
import {combineReducers} from 'redux'

// application state layout:
//
// encounter

const reducer = combineReducers({
  activeEncounter
})

export default reducer
