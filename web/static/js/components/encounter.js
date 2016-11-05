import React, {PropTypes, Component} from 'react'
import ReactDOM from 'react-dom'

class Encounter extends Component {
  static propTypes = {
    encounter: PropTypes.object.isRequired,
  }

  render() {
    const {encounter} = this.props

    return (
      <section className="Encounter">
        <header>
          <h1>{encounter.name}</h1>
        </header>
      </section>
    )
  }
}

const container = document.getElementById('Encounter')
if (container) {
  // TODO: use real data here obviously
  const encounter = {name: "this is fake"}
  ReactDOM.render(<Encounter encounter={encounter}/>, container)
}
