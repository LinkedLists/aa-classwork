import React from 'react';
import TodoListItem from './todo_list_item';

class TodoList extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    const todoItems = this.props.todos.map( (todo) => {
      return <TodoListItem todo={ todo } key={todo.id}/>
    });

    return(
      <div>
        <ul>
          {todoItems}
        </ul>
        <TodoForm recieveTodo={ recieveTodo } />
      </div>
    );
  }

}

export default TodoList;
