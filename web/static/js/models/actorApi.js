import apiRequest from '../util/apiRequest'

export function create(actor, opts = {}) {
  const params = {
    actor: {
      encounter_id: actor.encounterId,
      name: actor.name,
      hp: actor.hp,
    }
  }

  return apiRequest('/api/actors/', 'POST', params)
    .then((json) => json.data)
}
