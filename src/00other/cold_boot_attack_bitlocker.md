- https://labs.f-secure.com/blog/sniff-there-leaks-my-bitlocker-key/
  - https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-countermeasures
- https://www.linuxjournal.com/magazine/cold-boot-attack-tools-linux
- [A Lightweight Framework for Cold Boot Based Forensics on Mobile Devices](https://ieeexplore.ieee.org/document/7299905)
  - https://journal-home.s3.ap-northeast-2.amazonaws.com/site/netsec2020/netsec-file/%EC%9B%90%EC%9C%A0%EC%8A%B9.pdf
  - Air duster (cost under $10)
  - 3. Cold Boot Attack on Practical IoT device
    - Temperature: -35℃
    - Decay time: 5 seconds - some missing pixels, 30 seconds many missing pixels
- [124 - Cold Boot Attack! - dump a computer's memory to a USB drive](https://www.rmprepusb.com/tutorials/124)
  - Beware. Provides exe and zip with malware TSCOPE.TROJAN.VB aka Win32.Malware.Heur_Generic.A.(kcloud)
    - https://www.virustotal.com/gui/file/69e9f5e3df9a4090269231d435210327fee31d2f0fe750eae6d8f63bc9fa56ff/detection
    - https://www.virustotal.com/gui/file/5107b356931499aaa61c1a6c6f15adc2977b695e6075a5a0480df8c17fc514c1/detection\
    - http://malwarefixit.com/howto/remove-uninstall-tscope-trojan-vb-virus-redirect.htm
    - is it also TSCOPE.TROJAN.VB? https://howtofix.guide/malware-ai-1439109415/
    - https://www.youtube.com/watch?v=xv-W6_pH56I&lc=Ugwbwr04PVtKltD8RUB4AaABAg
  - `diskmgmt.msc`
  - [Cold Boot Attack | University of South Wales VeraCrypt Research Group](https://youtu.be/XfUlRsE3ymQ)
  - https://github.com/baselsayeh/coldboot-tools/releases/tag/2
- Memory Overwrite Request - MOR bit
  - https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/memory-overwrite-request-control-lock-version-2
  - [Using an @arduino as SPI programmer to reset the MemoryOverwriteRequest bit](https://twitter.com/pascal_gujer/status/1100304458716758016)
- https://www.toolbox.com/tech/tech-security/question/is-there-a-defense-to-a-cold-boot-attack-032315/
- https://security.stackexchange.com/questions/231752/has-there-ever-been-a-known-case-of-bitlocker-breach-through-lock-screen
- https://www.delltechnologies.com/resources/en-us/asset/white-papers/products/security/dell-trusted-device-below-the-os-whitepaper.pdf
- https://en.m.wikipedia.org/wiki/Memory_forensics
- https://hackernewsdog.com/best-memory-dump-tools-for-forensics/
- https://github.com/Rohde-Schwarz/TrustedGRUB2
- https://www.andreafortuna.org/2020/03/06/cold-boot-attack-in-digital-forensics/
- [nullcon Goa 2015: Cold Boot Attack on DDR2 and DDR3 RAM by Marko Schuba](https://youtu.be/ZHq2xG4XJXM)
- https://superuser.com/questions/163720/after-the-bios-boots-how-can-i-dump-memory

## Week 12: practical cold boot attacks that will make cryptonerds shit their pants

- https://swizec.com/blog/week-12-practical-cold-boot-attacks-that-will-make-cryptonerds-shit-their-pants

### Key reconstruction

Once you've got the memory contents with a few bit errors, you have to get the encryption keys. An encryption key that's in use will necessarily have to be in memory. But they are specifically designed so even a tiny corruption will render the key useless.

A 256-bit key with 10% corruption has a Hamming distance of just 12 from the actual key. But brute forcing this still means 256 combinations. Too many.

Luckily, most encryption programs want to be fast. Especially important when they are live-encrypting data between hard drive and memory as is often the case on modern laptops. To achieve higher speeds most encryption programs store precomputed data in memory - key schedules for block ciphers, extended forms of the private key for RSA.

By using this data, the authors have been able to break encryption in practical time. It could've been even faster had they also taken account of predictable decay patterns, but it wasn't necessary and would complicate things too much.

To reconstruct DES keys they used the 16 subkeys produced by the DES scheduling algorithm. This means that every bit from the original key is repeated about 14 to 16 times.

You can treat this as a repetition code where the message is a single bit and codeword is a sequence of n copies. This means that even with a 50% error rate, the probability that the key can be correctly reconstructed without resorting to brute force is 98%.

AES keys are more complicated, but you can search keys in increasing distances from the recovered key and output anything with a similar enough schedule. The authors were able to search 109 candidates in about 20 minutes to correct a key with 7 errors. It would take 10 days to correct 11 errors.

A better approach is taking advantage of the AES schedule structure. Instead of correcting the whole key at once, you can look at it as a sequence of chunks. Each chunk is small enough to brute force efficiently, yet large enough to contribute to the whole key.

Once you have a set of candidates, you can put them together and check against the recovered schedule.

The authors used similar methods to break tweak codes that are used in common disk encryption systems. Except they mention a bunch of XORing and shifting blocks to the left and whatnot. I'm sure this section makes a lot more sense if you know how LRW, XEX, and XTS work.

Mostly they seem to take a block cipher and augment it in some way by XORing blocks together with something that I'm assuming is a salt.

Either way, the authors were able to break disk encryption in a practical amount of time.

They even managed to break RSA. RSA is essentially a polynomial equation that uses primary numbers p and q as its basis. The authors were able to deduce these factors by iteratively reconstructing them from least significant bits.

Brute force guided by reasonable heuristics. They were able to reconstruct 2048-bit keys with a 4% error rate at a median time of just 4.5 seconds. For higher error rates they could use this algorithm to reconstruct the first quarter of the key, then get the rest using Coppersmith's lattice technique.

And you thought RSA was safe!

### Finding keys in memory

Now that we can retrieve memory images and reconstruct partially corrupted keys, we still have to find them. 1GB of memory is a lot of room to hide a few bits.

A naive approach could be going through the whole image, trying different regions, and seeing if they decrypt something. But this assumes the image is perfect, and is generally slow.

Lucky for us, encryption keys have a predictable look. The authors were able to create fully automated systems to find keys in memory based on combinatorial properties of key schedules alone. This enabled them to recover keys even from closed-source encryption programs without reverse engineering.

For instance, to find AES keys they would iterate through memory in ~240bit blocks, check if they work as potential key schedules, and output them if the Hamming distance is sufficiently small. The only assumption being made is that the whole AES schedule will be in a contiguous memory region.

To find RSA keys they used two different approaches. Both relied on the idea that the most common format for storing RSA keys is the PKCS#1. They were able to retrieve keys both by anticipating the contents of the fields (public key modulus for instance) and by anticipating the structure of the format.