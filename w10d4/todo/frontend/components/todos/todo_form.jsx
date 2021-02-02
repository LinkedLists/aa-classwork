import { uniqueId } from '../util/id_generator';
import React from 'react';

class TodoForm extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            title: '',
            body: '',
            done: false
        };
        this.handleSubmit = this.handleSubmit.bind(this);
    };

    update(property) {
        return e => this.setState({[property]: e.target.value});
    }

    handleSubmit(e) {
        e.preventDefault();
        const todo = Object.assign({}, this.state, { id: uniqueId() }); //takes our local state and makes a new todo
        this.props.recieveTodo(todo); //dispatches our new todo
        this.setSate({
            title: '',
            body: '',
        }); //reset form
    }

    render() {
        return (
            <form onSubmit={this.handleSubmit}>
                <label>Title:
                    <input 
                    type="text"
                    value={this.state.title}
                    placeholder="title goes here"
                    onChange={this.update('title')}
                    />
                </label>
                <label>Body:
                    <textarea 
                        cols='50'
                        rows='20'
                        value={this.state.body}
                        placeholder="body goes here"
                        onChange={this.update('body')}
                    />
                </label>
                <button>Create Todo!</button>
            </form>
        );
    };
};

export default TodoForm;