<img src="https://user-images.githubusercontent.com/1992842/99745393-8e493700-2aa7-11eb-8eaf-f7dd61173bf8.png" width="100" height="100">

# bitwarden-cli-helpers
helper functions to make the [Bitwarden v2 Alfred workflow](https://github.com/blacs30/bitwarden-alfred-workflow) play along nicely with the [bw CLI](https://bitwarden.com/help/article/cli/)

## The functions:

#### `bwauth_get_from_Alfred`
grabs the auth token from a logged-in Alfred workflow and export it to the current shell

#### `bwauth_save_to_Alfred`
saves the auth token from the current bw session for use by the Workflow

#### `bwauth_login_via_api`
function to login via API, avoiding prompt for username (you still need to enter your master password!)
