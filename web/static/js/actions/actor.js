import * as ActorApi from '../models/actorApi'

export const BEGIN_CREATE = "ACTOR:BEGIN_CREATE"
export const CREATE_SUCCESS = "ACTOR:CREATE_SUCCESS"
export const CREATE_ERROR = "ACTOR:CREATE_ERROR"

export function create(payload, meta = {}) {
  return (dispatch) => {
    dispatch(beginCreate())
    const promise =  ActorApi.create(payload, meta)
      .then((json) => dispatch(createSuccess(json)))
      .catch((error) => dispatch(createError(error)))
  }
}

function beginCreate() {
  return {type: BEGIN_CREATE}
}

function createSuccess(json) {
  return {type: CREATE_SUCCESS, payload: json}
}

function createError(error) {
  return {type: CREATE_ERROR, payload: error, error: true}
}
