+++
categories = ["security", "bug", "development", "testing"]
tags = ["security", "bug", "development", "testing", ""]
date = "2017-10-17"
title = "Exploding Image"
type = "article"
+++

On my last summer intern, I was assigned to a bug fixing job. It seems not a big deal at first. Only fixing timeout while uploading image. But, when I try to add timeout to 1 min, still got a timeout. Up to 5 min, didn't fix yet. Even, for 30 min timeout, no improvement. Then, I asked ops team to check the debug log. And, kaboom!! We got a sawtooth memory pattern and some RuntimeErrorException leftover.

{{< figure src="https://plumbr.eu/wp-content/uploads/2016/02/java-memory-usage-example.png" title="Sawtooth footprint" >}}

Surely, there is something wrong. I tried to figure out how image preprocess work. We used [imgscalr](https://github.com/rkalla/imgscalr) back then. Their site claimed that it is (up until this post made) the fastest Java image scaling library ever. I ran a few test against [large](https://i.pinimg.com/originals/ed/9f/8a/ed9f8acd065cf7d19584f0984648e31f.jpg) [images](https://farm4.staticflickr.com/3182/2893346171_11a4df8533_o.jpg), and even a [corrupted image](http://media.rhizome.org/blog/3942/14.jpg). And then, I realized something bad. **The only pre-preprocessing job we done was checking image size.** If size of the image didn't exceess few MB, then crop, rescale. But, what if some huge images with only monotonic colors appear like this?

{{< figure src="http://cphmade.org/wordpress/wp-content/uploads/2016/05/FM_201_1500_White.jpg" title="It's a trap!" >}}

If you could guess what happened here, you may want to skip this part below.

## Image compression

Let's review a bit about our sight first. We got image of our surrounding by receiving light emitted and/or reflected by anothers through our eyes. Then, our eye lenses focus the light toward the retina. Our retina contains million light receptor nerves --[cone and rod cells](https://en.wikipedia.org/wiki/Layer_of_rods_and_cones). Every discrete signal come to the cone and rod cells, then merged and percepted by our brain to make a single, continous perception of image. Thanks to it, actually we could see a single line by connecting even only a few dots. 

And then, monitor was invented. Based on the fact above, we started to make a discrete grids contain light with certain color to simulate a sight. Every square in the grid (later called as pixel), contains combination of 3 or 4 colors combined (sRGB or CMYK). Now, we could receive sufficient light to be percepted as an image.

We could just save this raw grid to, for example a 2D array. But, this representation doesn't suit at all for storage. If we want to save let's say 1024 * 720 image, we need about 1024 * 720 * 4 = 2949120 pixel bytes or about 2.6 MB. Back then, when average disk capacity only about 1 GB, it could only contain 350 images with such resolution. Way too little! Then, how come we could store videos with thousand frames?

Thats how image compression plays a role. Image compression helps us eliminate the information redundancy from pixels. There are various algorithm developed for compress an image. What we usually called image format, most of it tied with a certain compression method. For example [JFIF/JPEG](https://en.wikipedia.org/wiki/JPEG) format which performs [lossy compression](https://en.wikipedia.org/wiki/Lossy_compression) and widely known for it's [tiny ratio](https://cloudinary.com/blog/why_jpeg_is_like_a_photocopier).

## Workaround

After knowing how image save as a compressed format, you may have guessed what the image did to the preprocessor. Yup, given those nearly uniform pics uncompressed, it could take a lot --and I really mean [a lot](https://www.bamsoftware.com/hacks/deflate.html)-- of space. And, unless your Java heap set to several giga and EC2 instance could afford those space too, your system will definitely crash.

One of simple trick to get rid of this is read metadata of height and width separately. After we are really sure the pics don't excess our limit, load the content using whichever lib that suits. It should be enough for now. But, you know, what really drive us to keep moving forward are problem. I'm looking forward for it.
