Więc wracając do Vulkan, jest to tak zwane "Expert API" i to określenie nie jest bez powodu. Pisanie w Vulkanie jest cholernie trudne, szczególnie projektów open source. Vulkan jest tak niskopoziomowy, że trzeba pisać nawet własne alokatory pamięci dla przechowywania buforów, czy obrazów w pamięci. To jest w teorii fajne, ale nie gdy pisze się silnik w wolnym czasie po 2-3h dziennie, ponieważ tzw. "Time to Hello World" jest bardzo wysoki, gdyż trzeba napisać kilka tysięcy linii kodu zanim uda się wyświetlić cokolwiek na ekranie. OpenGL natomiast jest dość starutkim API i ma on swoje problemy przez które w gamedev nie jest popularny tak bardzo (jeżeli będziesz zainteresowany to Ci mogę wypisać w innym komentarzu kilka z nich). DirectX natomiast mimo swoich wad jest dość... dobry. Powiedziałbym, że nawet bardzo dobry. Microsoft ładuje kupę kasy, żeby DirectX był na topie. DirectX jest spójny w ma wiele "ficzerów", które no... robią wrażenie. DirectX 12 na przykład ma wsparcie dla sprzętowego ray tracingu. Chociaż DirectX 12 to też "Expert API" to jednak jest na tyle podobne do wersji 11, że da się z niego łatwiej przesiąść, niż z OpenGL do Vulkana. Zamknięcie tylko na Windowsa jest słabe, ale ma też wiele zalet. Zresztą tak jak pisałem, chciałbym kiedyś zaimplementować sobie PhysX, a jego zbudowanie np. na takiego Linuxa to nie jest tak przyjemna rzecz jak mogło by się wydawać w moim odczuciu. Dodatkowo jedna platforma to mniej testowania, czy wszystko jest okej. Ogólnie temat jest dość wielopoziomowy i skomplikowany.

https://www.wykop.pl/wpis/43112249/hej-chcialem-sie-pochwalic-moim-pierwszym-w-zyciu-/#comment-152020365

##

I recommend starting with OpenGL, because it’s easier to learn. The principles are the same, so a lot of what you learn using OpenGL is transferable.

Once you know what you’re doing, then you’re in a good position to handle the extra complexities that Vulkan brings. Vulkan gives developers a lot more control over low-level operations (e.g., when data is transferred to VRAM). The goal is to reduce driver overhead to pretty much zero, thereby boosting performance. It works, but it does make Vulkan much harder to use because you’re having to manage things that OpenGL drivers took care of for you.

https://www.quora.com/Should-new-graphics-programmers-be-learning-Vulkan-instead-of-OpenGL/answer/Hans-de-Ruiter-1

##

K900\_

4 months ago
Helpful
A graphics API is like a language you use to talk to a graphics driver.

OpenGL is a complicated, context-sensitive language, where the driver often has to keep track of what you said a long time ago, or guess what you intended with a specific construction, because there's no way to express what you actually want. It's also designed for older graphics cards, so using it on modern hardware is kind of like trying to communicate in Old English - you'll probably understand each other, but you'll definitely be translating back and forth in your head, and so will the driver.

With Vulkan, on the other hand, the language itself is very simple, and it maps to specific things modern graphics hardware does. The downside of that is it's much more verbose, so you have to be very specific when describing what you want done, and how exactly you want it done. This means you get more control, but you also get more responsibility, because the driver will not try to guess what you actually wanted to say, it will just do what you told it to, and if you set your computer on fire, it's going to be your own damn fault.

pragmojo

4 months ago
Just to make it a bit more concrete, in my experience the biggest new things in Vulkan were:

having to specify a lot more detail around how resources are used: i.e. in OpenGL a texture is a texture is a texture, but in Vulkan you need to specify whether it's going to be used by a fragment shader or a compute shader and so on.

dealing with synchronization: for instance in OpenGL you can just do something like: run shader 1, run shader 2 but in Vulkan you have to specify a lot more detail to make sure shader 2 isn't reading to a texture that shader 1 is still writing for example.

Besides that, a lot of things will be familiar: like you still have vertex buffers, textures, shaders, frambuffers and so on.

I actually thought it was pretty cool learning Vulkan, because you kind of start to understand how OpenGL works, because you have to specify a lot of the details which OpenGL does automatically under the hood.

danybittel

4 months ago
Great explanation. I'd like to add, that while you have to be very specific of what you want to too, the validation layers are really helpful. It says exactly what's gone wrong and you can look it up in the specification, which after a while is quite readable. This gives you great confidence in your code. Something which is way more "hand wavy" in OpenGL.

I think OpenGL was meant to be used by Game Developers (and more general Programmers). While Vulkan is targeted to Engine or Framework developers. And "Game Programmers" that used to work in OpenGL probably choose an Engine such as Unity or Unreal now. Which makes sense, because those things weren't so widely available back then.

That is probably also the reason that while Vulkan is thriving, it is no where near as widespread as OpenGL.

kymani37299

4 months ago
You got your explanation in other comments , I want to add something. My advice is if you are new to graphics try learning opengl first, not because vulkan is "harder" but because with all that low level stuff you will be confused if you don't know exactly what you want to achieve. Opengl will give you more space to think about high level concepts.

kymani37299

4 months ago
You got your explanation in other comments , I want to add something. My advice is if you are new to graphics try learning opengl first, not because vulkan is "harder" but because with all that low level stuff you will be confused if you don't know exactly what you want to achieve. Opengl will give you more space to think about high level concepts.

kymani37299

4 months ago
Basic stuff like gpu pipeline, framebuffers, buffers and resources, nothing more than that. But you need to know how and when to use it, that is the point, so when you want to abstract some things in seperate classes/modules you know what things you need to parameterize and what can stay static. That can be achieved best first by using those abstractions to make something, for example lighting, and then shadow maps where you need to use multiple render targets etc. When you are confident with that you are ready for vulkan, because vulkan will then introduce new problems like synchronization, keeping state of gpu, multithreading which you will not get if you are busy learning basic stuff... I hope this helps.

Goku1920

4 months ago
There is no set percentage that you have to complete because there is no set ending point. There will always be something you could learn with openGL.

However, for starters there are some basic things. Like creating buffers for storing triangle/polygon mesh, index mesh, compiling and writing frag and vert shaders. Loading data to the shaders. Loading a texture. Drawing on the screen.

Then, advanced features like instanced meshes, using the Geometry shaders, using compute shaders, stencil buffers, frame buffers, depth buffers for CG tricks.

Then even more advanced use of these features on the gpu to have shadows, transparency, multi pass rendering... and so on.

But in order to move from openGL to Vulkan you can learn the basics and test out your knowledge by implementation and move on to vulkan. That would be tough but certainly doable. I usually don’t discourage people from learning vulkan but keep this one thought in mind: The tool should always be a reasonable way to achieve your goal.

nightblackdragon

4 months ago
If you want to learn Vulkan and don't know any other modern API then I recommend starting with OpenGL. You can start with Vulkan but if you never used any other modern API then you don't know how modern GPU programming looks like (vertex buffers, shaders, uniforms etc.). You will need to learn it while learning API so it should be easier to start with OpenGL. Vulkan gives you total control of almost everything and it won't provide any defaults settings - you need to setup everything. That amount of informations to learn may make learning GPU programming harder.

https://www.reddit.com/r/vulkan/comments/kx1mfw/vulkan_vs_opengl/

##

To elaborate on OpenGL's future:

OpenGL might achieve comparable performance to Vulkan, in draw calls per second, but also regarding general driver overhead:

- The most recent OpenGL extensions actually remove a lot of driver overhead by making everything bindless (e.g. [ARB_direct_state_access](https://www.opengl.org/registry/specs/ARB/direct_state_access.txt) (4.5 core), - [ARB_bindless_texture](https://www.opengl.org/registry/specs/ARB/bindless_texture.txt), ...).
- With persistent mapping ([ARB_buffer_storage](https://www.opengl.org/registry/specs/ARB/buffer_storage.txt), core in 4.4) the buffer memory can be accessed directly by the CPU, thus the synchronization with the GPU is also - explicit, just like Vulkan.
- Future extensions such as `NV_command_list` (see [Tristan Lorach's Siggraph Asia 2014 presentation](http://www.slideshare.net/tlorach/opengl-nvidia-commandlistapproaching-zerodriveroverhead))) are likely to provide to OpenGL the same "GPU feeding paradigm" as Vulkan.

https://gamedev.stackexchange.com/questions/96014/what-is-vulkan-and-how-does-it-differ-from-opengl/96125#96125

##

Polecam przemyśleć, czy chcesz przepisywać na Vulkan API, ponieważ ja szczerze mówiąc polecam Ci DirectX 12. Jest to też niskopoziomowe API, które pozwala na dostęp do tych samych rzeczy w GPU, a jest o klasę wygodniejsze pod każdym względem.

https://www.wykop.pl/link/6749185/#comment-108213251
