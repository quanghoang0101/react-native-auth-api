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

public class UserInfo implements Parcelable, Bridgeable {
    public static final Creator<UserInfo> CREATOR =
            new Creator<UserInfo>() {
                @Override
                public UserInfo createFromParcel(Parcel in) {
                    return new UserInfo(in);
                }

                @Override
                public UserInfo[] newArray(int size) {
                    return new UserInfo[size];
                }
            };

    private String username;
    private String phone;

    private UserInfo() {
    }

    private UserInfo(Builder builder) {
        this.username = builder.username;
        this.phone = builder.phone;
    }

    private UserInfo(Parcel in) {
        this(in.readBundle());
    }

    public UserInfo(@NonNull Bundle bundle) {
        if (!bundle.containsKey("username")) {
            throw new IllegalArgumentException("username property is required");
        }

        if (!bundle.containsKey("phone")) {
            throw new IllegalArgumentException("phone property is required");
        }

        this.username = bundle.getString("username");
        this.phone = bundle.getString("phone");
    }

    /**
     * Name of User
     *
     * @return String
     */
    @NonNull
    public String getUsername() {
        return username;
    }

    /**
     * Number phone of user
     *
     * @return String
     */
    @NonNull
    public String getPhone() {
        return phone;
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
        bundle.putString("username", this.username);
        bundle.putString("phone", this.phone);
        return bundle;
    }

    @Override
    public String toString() {
        return "{"
                + "username:" + (username != null ? "\"" + username + "\"" : null) + ","
                + "phone:" + (phone != null ? "\"" + phone + "\"" : null)
                + "}";
    }

    public static class Builder {
        private final String username;
        private final String phone;

        public Builder(@NonNull String username, @NonNull String phone) {
            this.username = username;
            this.phone = phone;
        }

        @NonNull
        public UserInfo build() {
            return new UserInfo(this);
        }
    }
}
