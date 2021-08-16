The big difference is that AMD's GPUs only work on vectors whereas Google's TPUs (and NVidia's latest card) can work on matrices directly for a large increase in throughput. https://news.ycombinator.com/item?id=16875888

## AMD vs nVidia

NVidia can support anything because they have a PTX-translation layer between cards, and invest heavily on PTX.
Each assembly language from each generation of cards changes. PTX recompiles the "pseudo-assembly" instructions into the new assembly code each generation.

---

AMD has no such technology. When AMD's assembly language changes (ex: from Vega into RDNA), its a big compiler change. AMD managed to keep the ISA mostly compatible from 7xxx GCN 1.0 series in the late 00s all the way to Vega 7nm in the late 10s... but RDNA's ISA change was pretty massive.

I think its only natural that RDNA was going to have compiler issues.

---

AMD focused on Vulkan / DirectX support for its RDNA cards, while its compute team focused on continuing "CDNA" (which won large supercomputer contracts). So that's just how the business ended up.

https://news.ycombinator.com/item?id=28200823
