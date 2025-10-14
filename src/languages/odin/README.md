## is struct copied like a pass by value parameter?

It automatically passes by immutable reference if the parameter is larger than 16 bytes. The immutability makes sure you don't change it by accident.

<https://www.youtube.com/watch?v=KSy6EA7VBC4&lc=UgyXdyP6-XxDewrXcPh4AaABAg>
