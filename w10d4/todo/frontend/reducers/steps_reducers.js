import { RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP } from '../actions/step_actions';

const stepsReducer = (state = {}, action) => {
  let nextState = {};
  Object.freeze(state);
  console.log(action);
  switch (action.type) {
    case RECEIVE_STEPS:
      action.steps.forEach( step => {
        nextState[step.id] = step;
      });
      return nextState;

    case RECEIVE_STEP:
      
      // const newstep = { [action.step.id]: action.step };
      let stepID = action.step.id; 
      const newStep = { [stepID]: action.step }; 
      return Object.assign({}, state, newStep,);

    case REMOVE_STEP:
      nextState = Object.assign({}, state);
      delete nextState[action.step.id];
      return nextState;

    default:
      return state;
  }
};

export default stepsReducer;