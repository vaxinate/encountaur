export const BEGIN_CREATE = "ACTOR:BEGIN_CREATE"
export const CREATE_SUCCESS = "ACTOR:CREATE_SUCCESS"
export const CREATE_ERROR = "ACTOR:CREATE_ERROR"

export function create(payload, meta = {}) {
  return (dispatch) => {
    dispatch(beginCreate())
    const promise =  post(payload, meta)
      .then((json) => dispatch(createSuccess(json)))
      .catch((error) => dispatch(createError(error)))
  }
}

function post(actor, opts = {}) {
  // TODO: this should do stuff on the internet
  const promise = new Promise((resolve, reject) => {
    if (opts.fail) {
      throw new Error("POST ACTOR FAIL")
    }
    resolve(actor)
  })

  return promise
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
