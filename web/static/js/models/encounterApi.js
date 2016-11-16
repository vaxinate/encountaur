import apiRequest from '../util/apiRequest'

export function find(id) {
  return apiRequest(`/api/encounters/${id}`)
}
