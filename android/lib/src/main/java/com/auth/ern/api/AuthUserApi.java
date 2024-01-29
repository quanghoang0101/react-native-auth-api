/*
 * Copyright 2020 Walmart Labs
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.auth.ern.api;

import androidx.annotation.NonNull;

import com.walmartlabs.electrode.reactnative.bridge.ElectrodeBridgeEvent;
import com.walmartlabs.electrode.reactnative.bridge.ElectrodeBridgeEventListener;
import com.walmartlabs.electrode.reactnative.bridge.ElectrodeBridgeRequestHandler;
import com.walmartlabs.electrode.reactnative.bridge.ElectrodeBridgeResponseListener;
import com.walmartlabs.electrode.reactnative.bridge.None;
import com.walmartlabs.electrode.reactnative.bridge.RequestHandlerHandle;

import java.util.*;
import java.util.UUID;

import com.auth.ern.model.AuthUserEventData;

public final class AuthUserApi {
    private static final Requests REQUESTS;
    private static final Events EVENTS;

    static {
        REQUESTS = new AuthUserRequests();
        EVENTS = new AuthUserEvents();
    }

    private AuthUserApi() {
    }

    @NonNull
    public static Requests requests() {
        return REQUESTS;
    }

    @NonNull
    public static Events events() {
        return EVENTS;
    }

    public interface Events {
        String EVENT_AUTH_USER_EVENT = "com.auth.ern.api.event.authUserEvent";

        UUID addAuthUserEventEventListener(
                @NonNull final ElectrodeBridgeEventListener<AuthUserEventData> eventListener);

        ElectrodeBridgeEventListener<ElectrodeBridgeEvent> removeAuthUserEventEventListener(
                @NonNull final UUID uuid);

        void emitAuthUserEvent(@NonNull AuthUserEventData eventData);
    }

    public interface Requests {
    }
}
