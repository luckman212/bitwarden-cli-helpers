#!/usr/bin/env bash

# helper functions for Bitwarden v2 Alfred workflow:
#   https://github.com/blacs30/bitwarden-alfred-workflow

# for help with obtaining & using API keys, see:
#   https://bitwarden.com/help/article/personal-api-key
#   https://vault.bitwarden.com/#/settings/account

# add the lines below to your .bash_profile for convenience
# =========================================================

wf_bundle_id=com.lisowski-development.alfred.bitwarden
wf_keychain_account_name=token

function bwauth_get_from_Alfred() {
  local temp_bw_session
  temp_bw_session="$(
    /usr/bin/security find-generic-password \
    -a $wf_keychain_account_name \
    -s $wf_bundle_id -w
  )"
  if [ -n "$temp_bw_session" ]; then
    export BW_SESSION=$temp_bw_session
    echo "successfully retreived token from Keychain"
  else
    unset BW_SESSION
    echo "error fetching token from Keychain" 1>&2
  fi
}

function bwauth_save_to_Alfred() {
  local temp_bw_session
  bwauth_login_via_api 2>/dev/null
  temp_bw_session=$(bw unlock --raw)
  if [ -n "$temp_bw_session" ]; then
    /usr/bin/security add-generic-password -a $wf_keychain_account_name -s $wf_bundle_id -w $temp_bw_session -U
    export BW_SESSION=$temp_bw_session
    echo "saved token to Keychain for use by Alfred workflow"
  else
    unset BW_SESSION
    echo "error unlocking Vault, token was not saved" 1>&2
  fi
}

function bwauth_login_via_api() {
  export BW_CLIENTID=your_api_client_id
  export BW_CLIENTSECRET=your_api_client_secret
  bw login --apikey
}
