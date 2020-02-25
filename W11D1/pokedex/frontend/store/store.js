import { createStore, applyMiddleware } from 'redux';
import logger from 'redux-logger';
import rootReducer from '../reducers/root_reducer';
import myThunk from '../middleware/thunk';


const configureStore = () => (
  createStore(
    rootReducer, 
    applyMiddleware(myThunk, logger)
  )
);

export default configureStore;