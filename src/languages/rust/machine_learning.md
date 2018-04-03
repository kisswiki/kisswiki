- https://medium.com/@mjhirn/tensorflow-wins-89b78b29aafb
- https://medium.com/@autumn_eng/about-rust-s-machine-learning-community-4cda5ec8a790
- https://weld-project.github.io/
- https://www.reddit.com/r/rust/comments/4m9x1f/is_rust_suitable_for_machine_learning/
- Hacker's guide to Neural Networks http://karpathy.github.io/neuralnets/
- Autodifferentiation package in Rust https://github.com/maciejkula/wyrm
- http://www.arewelearningyet.com/neural-networks/
- Awesome deep learning crate https://github.com/MikhailKravets/NeuroFlow
- https://www.reddit.com/r/rust/comments/30ie9c/a_neural_network_crate_im_working_on/
- https://medium.com/@maciejkula/building-an-autodifferentiation-library-9ccf32c7a658
  - https://www.reddit.com/r/MachineLearning/comments/7peglu/p_building_a_statically_compiled_pytorchlike/
- NeuroEvolution of Augmenting Topologies NEAT in Rust https://github.com/TLmaK0/rustneat

## What math needed

https://news.ycombinator.com/item?id=15116379

## Tensorflow vs Torch

I'd go tensorflow for the following reasons:
You don't have to learn a language just for this use case.
Python is being used by many others, like OpenAI. You can use OpenAI Gym with python/tensorflow - not sure what the torch interoperability is like.
Deep mind transitioned from torch to tensorflow. I was hesitant when I found out they were using torch after the release of tf, but they've since begun migration. I don't have time to do a thorough analysis of every framework, so going with frameworks used by people who do do the thorough analysis is much easier. I'm obviously not in exactly the same boat as the peeps from deep mind (and likely neither are you) but I think it's worth considering none-the-less.

https://www.reddit.com/r/MachineLearning/comments/4qk4mu/working_with_a_new_framework_torch_or_tensorflow/

As far I understood it, Facebook put lots of research into optimizing a certain type of neural network (CNN), while everyone else is using another type called RNN. Up until now, CNN was faster but less accurate. However FB has progressed CNN to the point where it can compete in accuracy, particularly in speech recognition. And most importantly, they are releasing the source code and papers. Does that sound right?

https://news.ycombinator.com/item?id=14302583

- The Unreasonable Popularity of TensorFlow http://deliprao.com/archives/168
- https://github.com/soumith/convnet-benchmarks
- https://github.com/deeplearning4j/dl4j-benchmark
- https://deeplearning4j.org/compare-dl4j-torch7-pylearn.html
- https://github.com/glample/rnn-benchmarks
- https://github.com/jasonbaldridge/try-tf

## Video Course

We’ve just launched a new course on Tensorflow: Creative Applications of Deep Learning with TensorFlow | Kadenze https://www.kadenze.com/courses/creative-applications-of-deep-learning-with-tensorflow/info

Unlike other courses, this is an application-led course, teaching you fundamentals of Tensorflow as well as state-of-the-art algorithms by encouraging exploration through the development of creative thinking and creative applications of deep neural networks.

https://www.quora.com/Are-there-video-tutorials-to-learn-Tensorflow/answer/Parag-K-Mital

https://github.com/pkmital/cadl
