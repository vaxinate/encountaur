import React, {Component, PropTypes} from 'react'

const INITIAL_STATE = {
  name: 'name',
  hp: 'XX',
}

export default class ActorForm extends Component {
  static propTypes = {
    onSave: PropTypes.func.isRequired,
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
    console.log('onSubmit')
    this.props.onSave(this.state)
    return event.preventDefault()
  }

  clear() {
    this.setState(INITIAL_STATE)
  }

  render() {
    return (
      <form onSubmit={this.onSubmit}>
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
        <button type="submit">Save</button>
      </form>
    )
  }
}
