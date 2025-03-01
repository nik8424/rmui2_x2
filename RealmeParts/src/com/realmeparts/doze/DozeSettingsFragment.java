/*
 * Copyright (C) 2015 The CyanogenMod Project
 *               2017-2019 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.realmeparts.doze;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.widget.CompoundButton;

import androidx.preference.Preference;
import androidx.preference.Preference.OnPreferenceChangeListener;
import androidx.preference.PreferenceCategory;
import androidx.preference.PreferenceFragment;
import androidx.preference.SwitchPreferenceCompat;

import com.android.settingslib.widget.MainSwitchPreference;

import com.realmeparts.R;

public class DozeSettingsFragment extends PreferenceFragment implements
        Preference.OnPreferenceChangeListener, CompoundButton.OnCheckedChangeListener {

    private MainSwitchPreference mSwitchBar;
    private SwitchPreferenceCompat mAlwaysOnDisplayPreference;
    private SwitchPreferenceCompat mPickUpPreference;
    private SwitchPreferenceCompat mRaiseToWakePreference;
    private SwitchPreferenceCompat mPocketPreference;
    private SwitchPreferenceCompat mSmartWakePreference;
    private SwitchPreferenceCompat mFODWakePreference;
    private SwitchPreferenceCompat mFODSleepPreference;

    private Handler mHandler = new Handler();

    @Override
    public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
        addPreferencesFromResource(R.xml.doze_settings);

        SharedPreferences prefs = getActivity().getSharedPreferences("doze_settings",
                Activity.MODE_PRIVATE);
        if (savedInstanceState == null && !prefs.getBoolean("first_help_shown", false)) {
            showHelp();
        }

        boolean dozeEnabled = DozeUtils.isDozeEnabled(getActivity());

        mSwitchBar = (MainSwitchPreference) findPreference(DozeUtils.DOZE_ENABLE);
        mSwitchBar.addOnSwitchChangeListener(this);
        mSwitchBar.setChecked(dozeEnabled);
        
        mAlwaysOnDisplayPreference = (SwitchPreferenceCompat) findPreference(DozeUtils.ALWAYS_ON_DISPLAY);
        mAlwaysOnDisplayPreference.setEnabled(dozeEnabled);
        mAlwaysOnDisplayPreference.setChecked(DozeUtils.isAlwaysOnEnabled(getActivity()));
        mAlwaysOnDisplayPreference.setOnPreferenceChangeListener(this);

        PreferenceCategory pickupSensorCategory = (PreferenceCategory) getPreferenceScreen().
                findPreference(DozeUtils.CATEG_PICKUP_SENSOR);
        PreferenceCategory proximitySensorCategory = (PreferenceCategory) getPreferenceScreen().
                findPreference(DozeUtils.CATEG_PROX_SENSOR);

        SwitchPreferenceCompat raiseToWakeGesture = (SwitchPreferenceCompat) getPreferenceScreen().
                findPreference(DozeUtils.GESTURE_RAISE_TO_WAKE);

        mPickUpPreference = (SwitchPreferenceCompat) findPreference(DozeUtils.GESTURE_PICK_UP_KEY);
        mPickUpPreference.setEnabled(dozeEnabled);
        mPickUpPreference.setOnPreferenceChangeListener(this);

        mRaiseToWakePreference = (SwitchPreferenceCompat) findPreference(DozeUtils.GESTURE_RAISE_TO_WAKE_KEY);
        mRaiseToWakePreference.setEnabled(dozeEnabled);
        mRaiseToWakePreference.setOnPreferenceChangeListener(this);

        mPocketPreference = (SwitchPreferenceCompat) findPreference(DozeUtils.GESTURE_POCKET_KEY);
        mPocketPreference.setEnabled(dozeEnabled);
        mPocketPreference.setOnPreferenceChangeListener(this);

        mSmartWakePreference = (SwitchPreferenceCompat) findPreference(DozeUtils.GESTURE_SMART_WAKE_KEY);
        mSmartWakePreference.setEnabled(dozeEnabled);
        mSmartWakePreference.setOnPreferenceChangeListener(this);

        mFODWakePreference = (SwitchPreferenceCompat) findPreference(DozeUtils.GESTURE_FOD_WAKE_KEY);
        mFODWakePreference.setEnabled(dozeEnabled);
        mFODWakePreference.setOnPreferenceChangeListener(this);

        mFODSleepPreference = (SwitchPreferenceCompat) findPreference(DozeUtils.GESTURE_FOD_SLEEP_KEY);
        mFODSleepPreference.setEnabled(dozeEnabled);
        mFODSleepPreference.setOnPreferenceChangeListener(this);

        // Hide AOD if not supported and set all its dependents otherwise
        if (!DozeUtils.alwaysOnDisplayAvailable(getActivity())) {
            getPreferenceScreen().removePreference(mAlwaysOnDisplayPreference);
        } else {
            mPickUpPreference.setDependency(DozeUtils.ALWAYS_ON_DISPLAY);
            pickupSensorCategory.setDependency(DozeUtils.ALWAYS_ON_DISPLAY);
            proximitySensorCategory.setDependency(DozeUtils.ALWAYS_ON_DISPLAY);
            raiseToWakeGesture.setDependency(DozeUtils.ALWAYS_ON_DISPLAY);
            mSmartWakePreference.setDependency(DozeUtils.GESTURE_PICK_UP_KEY);

            mFODWakePreference.setDependency(DozeUtils.ALWAYS_ON_DISPLAY);
            mFODSleepPreference.setDependency(DozeUtils.GESTURE_FOD_WAKE_KEY);
        }
    }

    @Override
    public boolean onPreferenceChange(Preference preference, Object newValue) {
        if (DozeUtils.ALWAYS_ON_DISPLAY.equals(preference.getKey())) {
            DozeUtils.enableAlwaysOn(getActivity(), (Boolean) newValue);
        }

        mHandler.post(() -> DozeUtils.checkDozeService(getActivity()));

        return true;
    }

    @Override
    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
        DozeUtils.enableDoze(getActivity(), isChecked);
        DozeUtils.checkDozeService(getActivity());

        mSwitchBar.setChecked(isChecked);

        if (!isChecked) {
            DozeUtils.enableAlwaysOn(getActivity(), false);
            mAlwaysOnDisplayPreference.setChecked(false);
        }
        mAlwaysOnDisplayPreference.setEnabled(isChecked);

        mPickUpPreference.setEnabled(isChecked);
        mRaiseToWakePreference.setEnabled(isChecked);
        mPocketPreference.setEnabled(isChecked);
        mSmartWakePreference.setEnabled(isChecked);
    }

    public void showHelp() {
        HelpDialogFragment fragment = new HelpDialogFragment();
        fragment.show(getFragmentManager(), "help_dialog");
    }

    public static class HelpDialogFragment extends DialogFragment {
        @Override
        public Dialog onCreateDialog(Bundle savedInstanceState) {
            return new AlertDialog.Builder(getActivity())
                    .setTitle(R.string.doze_settings_help_title)
                    .setMessage(R.string.doze_settings_help_text)
                    .setNegativeButton(R.string.dialog_ok, (dialog, which) -> dialog.cancel())
                    .create();
        }

        @Override
        public void onCancel(DialogInterface dialog) {
            getActivity().getSharedPreferences("doze_settings", Activity.MODE_PRIVATE)
                    .edit()
                    .putBoolean("first_help_shown", true)
                    .commit();
        }
    }
}
