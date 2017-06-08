# WhiteNoise Generator
white noise generator in Swift 4

This is a hobby project to work on my Swift 4 skills. 

The definition of white noise is sound waves that are random but average out to zero.

Thinking this out I realized output from a perfect Random Number Generator (RNG) would fix this. You can choose between the apparent 
recommended RNG for Swift, as well as the two file-like RNG's inherited from BSD, /dev/random and /dev/urandom. I've seen the source 
for ARC4 and it's incredibly terse (which is why it's so fast), however there is a consistent bias of about +2%. As expected the /dev/random 
and /dev/urandom give better performance.
