import {electrodeBridge} from 'react-native-electrode-bridge';

import AuthUserEvents from './AuthUserEvents';

const EVENTS = new AuthUserEvents(electrodeBridge);

export function events() {
  return EVENTS;
}

export default {events};
