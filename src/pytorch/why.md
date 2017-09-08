Two problems. 1) Tensorflow sucks 2) People that are actually experts in deep learning prefer Pytorch or Caffe2 so your mindshare thing is wrong, once the dust of the Tensorflow hype train clears people will choose tools that are actually any good


Two metrics stood out in my experiments with CNNs back in May 2017:
1) Compilation speed for a jumbo CNN architecture: Tensorflow took 13+ minutes to start training every time network architecture was modified, while PyTorch started training in just over 1 minute. PyT suits my style of interactive coding far better.
2) Memory footprint: I was able to fit 30% larger batch size for PyTorch over Tensorflow on Titan X cards. Exact same CNN architecture.

Both frameworks had major releases since May, so I am sure these metrics might have changed by now. However I ended up adopting PyT for my project.


This post is spot on.

Google is actually very scared of PyTorch since nearly all new AI research papers are using PyTorch. This means in 1-2 years or so, most companies will be using PyTorch for training and Caffe for deployment. Tensorflow doesn't even have an implementation of the latest ImageNet winner, DenseNet, but PyTorch does!

I have sources on the Tensorflow team saying they are scrambling to make another higher level wrapper for tensorflow at the level of PyTorch.


Jumbo CNNs are not the battleground. The real battleground is distribution. The first framework that scales out without placing much onus on the programmer will win, IMO. Facebook already showed that Caffe2 scales to 256 GPUs for imagenet. Tensorflow need to show it can scale as well. PyTorch needs to work on usability - model serving, integration in ecosystems like Hadoop, etc.


Actually, Tensorflow is huge in the data science community, but PyTorch is taking over ML research. TF is last year's cool thing. That's one reason why fast.ai just adopted Pytorch for their courses. Tensorflow is surprisingly low-level and needs libraries like Keras to be used easily. The field of Python ML tools moves fast...


I was curious about their implementation since PyTorch and Caffe2 semantics are very different. Unfortuantly, the authors write:

> Currently, our tracer works with many common neural networks, but not some of the more advanced programs in PyTorch such as those with dynamic flow control. Over time, we will enhance ONNX and the tracer to support these programs, so that developers can leverage full flexibility of PyTorch with the high-performance robust deployment capabilities of Caffe2.

It is useful, of course. But it's rare for contemporary models to not use dynamic flow. In fact, PyTorch is popular because it encourages this dynamism.


Great move by Facebook to look beyond Caffe's legacy prototext file format which has become somewhat standard in computer vision, and unite Pytorch and Caffe2. Unfortunately there are limitations to the neural network logic that can be represented in configuration files, especially when dealing with dynamic networks. Most networks used in vision are static so that's where I expect this will add the most value. My only wish is that Caffe2 followed Pytorch's interface. After spending 5 minutes with Pytorch it's pretty clear that they got the interface design right.

https://news.ycombinator.com/item?id=15193054
