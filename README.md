# Message me app

This is a message me real chat app that uses rails action cable with redis for data store.

# Setup locally

 * git clone https://github.com/Vutivi/message-me.git
 * cd message-me
 * bundle install
 * rake db:create:all
 * rake db:migrate
 * rails s
 * navigate to localhost:3000 and start chatting

The app is available to chat remotely on https://messageme-chatroom.herokuapp.com/
