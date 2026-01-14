*** Variables ***
${BROWSER}    chrome
${URL}    http://the-internet.herokuapp.com/login

${USERNAME_FIELD}   id=username
${PASSWORD_FIELD}   id=password
${LOGIN_BUTTON}     css=button[type="submit"]
${LOGOUT_BUTTON}    css=a.button

${VALID_USERNAME}   tomsmith
${VALID_PASSWORD}   SuperSecretPassword!
${INVALID_PASSWORD} Password!
${INVALID_USERNAME} tomholland


${BASE_URL}        https://reqres.in
${USER_EXIST}      12
${USER_NOT_FOUND}  1234


${TEXT_A}    Buy groceries
${TEXT_B}    Do laundry
${TEXT_C}    Pay bills