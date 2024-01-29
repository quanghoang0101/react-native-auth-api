// @flow

export default class AuthUserRequests {
  _bridge: Object;

  constructor(bridge: Object) {
    this._bridge = bridge;
  }

  /**
   * Registers a handler for a particular api. This allows JavaScript to handle a request from native.
   * @param handler The handler function, taking a single parameter being the data of the request and returning a Promise. Implementer of the handler should either resolve the promise with an object being the response data (if any) or reject the promise with an Error
   */
  registerAuthUserRequestHandler(handler: Function) {
    this._bridge.registerRequestHandler(
      'com.auth.ern.api.request.authUser',
      handler,
    );
  }

  /**
   * @param  authInfo Return user information
   * @param timeout timeout in milliseconds
   * @return {Promise} a {@link https://www.promisejs.org/|Promise}
   */
  authUser(authInfo: any, timeout: number): Promise<any> {
    return this._bridge.sendRequest('com.auth.ern.api.request.authUser', {
      data: authInfo,
      timeout,
    });
  }
}
