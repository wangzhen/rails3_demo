# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Rails3demo::Application.config.secret_token = 'f7e877ac5fd502e5e656d1cf3873f4e715aa51964a29cab4151b7b7ff94c8376e8e7dcb630d65a2f075dcf315ea13b5f41eb630fe862157248e9ead1a5c043ed'


# Repeated applications of the hash make brute force (even with a compromised
# database and site key) harder, and scale with Moore's law.
#
#   bq. "To squeeze the most security out of a limited-entropy password or
#   passphrase, we can use two techniques [salting and stretching]... that are
#   so simple and obvious that they should be used in every password system.
#   There is really no excuse not to use them." http://tinyurl.com/37lb73
#   Practical Security (Ferguson & Scheier) p350
#
# A modest 10 foldings (the default here) adds 3ms.  This makes brute forcing 10
# times harder, while reducing an app that otherwise serves 100 reqs/s to 78 signin
# reqs/s, an app that does 10reqs/s to 9.7 reqs/s
#
# More:
# * http://www.owasp.org/index.php/Hashing_Java
# * "An Illustrated Guide to Cryptographic Hashes":http://www.unixwiz.net/techtips/iguide-crypto-hashes.html


