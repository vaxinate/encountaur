// wraps up fetch config for making a request to an API route
// path: full API endpoint path
// method: HTTP verb
// params: Object of request params with snake case keys for phoenix
export default function apiRequest(path, method, params) {
  const headers = new Headers({
    "Content-Type": "application/json"
  })

  return fetch(path, {
    method: method,
    headers: headers,
    body: JSON.stringify(params)
  }).then((resp) => {
    if (!resp.ok) {
      throw new Error(`${resp.statusText} (${resp.status})`)
    }

    return resp.json()
  })
}
