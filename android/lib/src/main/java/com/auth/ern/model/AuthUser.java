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

package com.auth.ern.model;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import java.util.List;

import com.walmartlabs.electrode.reactnative.bridge.Bridgeable;

import static com.walmartlabs.electrode.reactnative.bridge.util.BridgeArguments.*;

public class AuthUser implements Parcelable, Bridgeable {
    public static final Creator<AuthUser> CREATOR =
            new Creator<AuthUser>() {
                @Override
                public AuthUser createFromParcel(Parcel in) {
                    return new AuthUser(in);
                }

                @Override
                public AuthUser[] newArray(int size) {
                    return new AuthUser[size];
                }
            };

    private String token;
    private UserInfo userInfo;

    private AuthUser() {
    }

    private AuthUser(Builder builder) {
        this.token = builder.token;
        this.userInfo = builder.userInfo;
    }

    private AuthUser(Parcel in) {
        this(in.readBundle());
    }

    public AuthUser(@NonNull Bundle bundle) {
        if (!bundle.containsKey("token")) {
            throw new IllegalArgumentException("token property is required");
        }

        if (!bundle.containsKey("userInfo")) {
            throw new IllegalArgumentException("userInfo property is required");
        }

        this.token = bundle.getString("token");
        this.userInfo = bundle.containsKey("userInfo") ? new UserInfo(bundle.getBundle("userInfo")) : null;
    }

    /**
     * Token to detect user is authorized
     *
     * @return String
     */
    @NonNull
    public String getToken() {
        return token;
    }

    @NonNull
    public UserInfo getUserInfo() {
        return userInfo;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeBundle(toBundle());
    }

    @NonNull
    @Override
    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putString("token", this.token);
        bundle.putBundle("userInfo", this.userInfo.toBundle());
        return bundle;
    }

    @Override
    public String toString() {
        return "{"
                + "token:" + (token != null ? "\"" + token + "\"" : null) + ","
                + "userInfo:" + (userInfo != null ? userInfo.toString() : null)
                + "}";
    }

    public static class Builder {
        private final String token;
        private final UserInfo userInfo;

        public Builder(@NonNull String token, @NonNull UserInfo userInfo) {
            this.token = token;
            this.userInfo = userInfo;
        }

        @NonNull
        public AuthUser build() {
            return new AuthUser(this);
        }
    }
}
