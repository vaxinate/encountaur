import * as EncounterApi from '../models/encounterApi'

export const BEGIN_FIND = 'ENCOUNTER:BEGIN_FIND'
export const FIND_SUCCESS = 'ENCOUNTER:FIND_SUCCESS'
export const FIND_ERROR = 'ENCOUNTER:FIND_ERROR'

export function find(id) {
  return (dispatch) => {
    const resolve = (encounter) => dispatch(findSuccess(encounter))
    const reject = ({error, resp}) => dispatch(findError(error, resp))

    dispatch(beginFind())
    EncounterApi.find(id).then(resolve, reject)
  }
}

function beginFind() {
  return {type: BEGIN_FIND}
}

function findSuccess(json) {
  return {
    type: FIND_SUCCESS,
    payload: json.data,
  }
}

function findError(error, resp) {
  return {
    type: FIND_ERROR,
    payload: error,
    error: true,
    meta: resp,
  }
}
