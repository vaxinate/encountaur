import React, {Component, PropTypes} from 'react'

export default class EncounterHeader extends Component {
  static propTypes = {
    encounter: PropTypes.object.isRequired,
  }

  render() {
    const {encounter} = this.props
    
    return(
      <header>
        <h1>{encounter.name}</h1>
      </header>
    )
  }
}
