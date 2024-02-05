# BlackBox

BlackBox is a Flash-based login application circa 2008. We built this much for the same reasons Comet was. We didn't have anyway of doing a secure (read SSL) connection so we made our own next best thing. Whats funny is that in the end, the method we "ingeniously" came up with is almost the exact same method used with POP servers to send email.

This is how the login works:

1. Flash client first initiates a handshake by sending a random number (clientRand) to the server.
1. The server generates it's own random number (serverRand) and grabs the difference (randDiff) between the two numbers.
1. The difference (randDiff) is saved to the database for the user logging in and the server's random number is sent back to the client.
1. The client calculates the same difference (randDiff) and then sends the username and an MD5 of the password salted with the difference (randDiff).
1. The server then uses the username to pull randDiff and password for the user. Creates a hash salted with randDiff and compares what the client sent.
1. If all is well, it returns success and the client continues onto to the secure page.

This is an old project that's basically a poor mans Diffe-Hellman key exchange done well before I knew what Diffie-Hellman even was. Check out the demo of it [here](https://mariani.life/projects/blackbox/). The username is **demo** and the password is **password**. Enjoy!

## Features

-   Secure login - Session based
-   Easy to setup
