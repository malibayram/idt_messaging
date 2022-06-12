# idt_messaging

Test case app for IDT Messaging interview

## Test: ![coverage](coverage_badge.svg)

## Similar apps written by me:

- https://drive.google.com/file/d/1z3-xW5EpezMGL1talS-cCZGJE-SLkEyl/view?usp=sharing
  - Still under development.
  - Using Firebase as backend services
  - Using peer to peer for direct connection and calls
  - Using https://pub.dev/packages/flutter_webrtc for peer to peer connection
  - There are two 2 messaging:
    - First is using Firebase as backend and stored on the server
    - Second is using encryption and direct connection without using any server connection and storing users device
- https://play.google.com/store/apps/details?id=dershub.senv2yayin
  - One of the fist app has written with Flutter in Turkey I started to write it with Fluttter about 2018
  - Has been using by above 20.000 users
  - Chat part includes:
    - Group chatting
    - Sending several attachment types; docs, images, videos
    - Creating polls

### Development Steps

1. Create models for data
   - Chat model
   - Message model
2. Write unit tests for models
   - Chat model
   - Message model
3. Test coverage badge and test analyze script created
4. Running tests and making test coverage analyze before every commit set up with git hooks
5. Github workflow created to build and deploy web version of the app to Firebase hosting on every push
   - Web version of the app will be live on https://idtmessaging.web.app/
6. Base idea of using resources accros the app is implemented
7. Repositories for data are created
   - Services those provide the data are written
   - Test for services are written
8. Blocs for messages and chats are created
   - Cubits and their tests are written
9. Native splash screen and app icons added
   - App visible name is renamed to IDT Messaging
10. UI is completed
    - Chats screen ui is created
    - Messages screen ui is created
    - Send message part is completed
11. Random message sender is written
