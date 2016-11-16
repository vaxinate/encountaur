import React, {Component, PropTypes} from 'react'

const INITIAL_STATE = {
  name: 'Cool Thing',
  hp: 10,
}

export default class ActorForm extends Component {
  static propTypes = {
    onSave: PropTypes.func.isRequired,
    encounterId: PropTypes.number.isRequired,
  }

  constructor(props) {
    super(props)
    this.state = INITIAL_STATE
  }

  onChangeValues = (event) => {
    const target = event.currentTarget
    this.setState({[target.name]: target.value})
  }

  onSubmit = (event) => {
    const {encounterId} = this.props
    const {name, hp} = this.state

    this.props.onSave({encounterId, name, hp})
    this.setState({name: '', hp: ''})
  }

  render() {
    return (
      <form>
        {this.props.children}
        <input
          name="name"
          value={this.state.name}
          onChange={this.onChangeValues}
        />
        <br/>
        <input
          name="hp"
          value={this.state.hp}
          onChange={this.onChangeValues}
        />
        <br/>
        <button type="button" onClick={this.onSubmit}>
          Save
        </button>
      </form>
    )
  }
}
