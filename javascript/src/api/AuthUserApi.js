import {electrodeBridge} from 'react-native-electrode-bridge';

import AuthUserRequests from './AuthUserRequests';

const REQUESTS = new AuthUserRequests(electrodeBridge);

export function requests() {
  return REQUESTS;
}

export default {requests};
