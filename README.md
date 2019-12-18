# Tel Aviv Bitcoin emBassy POS

Source files for the Tel-Aviv Bitcoin emBassy POS,
based on [nanopos](https://github.com/ElementsProject/nanopos).

## Setup

```bash
# Setup c-lightning
# https://github.com/ElementsProject/lightning

# Setup Lightning Charge
$ npm install -g lightning-charge
$ charged --ln-path ~/.lightning --api-token mySecretToken

# Setup POS
$ git clone git@github.com:bitembassy/nanopos.git && cd nanopos
$ npm install

# Start the web server
$ npm start -- --charge-token mySecretToken
```
