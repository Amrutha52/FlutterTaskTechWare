# myproo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Project Description

This is for create Email/Password login and signup using Firebase in a flutter app.

In this case, the firebase_auth package is going to be our data layer so we're only going to be creating an AuthenticationRepository to compose data from the API clients.

auth_repository , auth_bloc, auth_event, auth_state files are used to implement login and signup using firebase.

## State

Auth_State contains LoginResponse state and SignupResponseState

## Event

AuthRequest which notifies the bloc that the user has requested to be logged in or sign up.

## Bloc

The auth_bloc responds to incoming auth_events and transforms them into outgoing auth_states. Upon initialization, it immediately subscribes to the user stream from the AuthenticationRepository.

Initialize Firebase in Main file

Login and SignUp page is used for login and sign up responsibilities.

login_setpin_page is used for creating pin after successful login and stored the pin into SharedPreferences.

login_resetpin_page is used for resetting pin if user needed.

product_adding_page is used to send product data's such as name, measurement, price and qr code into product table in firestore database.

product_state contains producting adding, product added and product error states.

product_event file used to create product.

The product_bloc responds to incoming product_events and transforms them into outgoing product_states.

qr_flutter package is used to generate qr code for corresponding products.

## screen recording is stored in screenvideo folder

## apk stored in apk folder


