import thunkMiddleware from 'redux-thunk'
import {createStore, applyMiddleware} from 'redux'
import reducer from '../reducers/index'

export default function createAppStore(initialState) {
  return createStore(
    reducer,
    initialState,
    applyMiddleware(
      thunkMiddleware
    )
  )
}
