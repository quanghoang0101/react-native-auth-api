// @flow

export default class AuthUserEvents {
  _bridge: Object;

  constructor(bridge: Object) {
    this._bridge = bridge;
  }

  addAuthUserEventEventListener(eventListener: Function): string {
    return this._bridge.registerEventListener(
      'com.auth.ern.api.event.authUserEvent',
      eventListener,
    );
  }

  removeAuthUserEventEventListener(uuid: string): any {
    return this._bridge.removeEventListener(uuid);
  }

  emitAuthUserEvent(eventData: any): void {
    return this._bridge.emitEvent('com.auth.ern.api.event.authUserEvent', {
      data: eventData,
    });
  }
}
