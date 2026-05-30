# PatrikZeros Clip Editor
#### ⭐️ Star the repo if you like it!
#### A simple, yet competent browser based video editor with local rendering.

 ## 📖 How to use

* Click **Open Video** and choose your video file.
* Choose whether to remove silence:

  * Click **Analyze Silence** to detect silent parts.
  * Click **Apply jump cuts as one clip** to remove the detected silence.
  * Or click **Skip Silence Removal** to keep the full video and continue editing.
* Adjust the main crop and composition:

  * Use the crop ratio buttons such as **16:9**, **4:3**, **9:16**, or **144:175** which complements 9:16 very well when using PIP!
  * Drag the crop box directly on the video preview for precise positioning.
  * Use the **Render Preview** to position the final composition.
* Add Picture in Picture if needed:

  * Enable **PIP mode** for the selected clip.
  * Choose the PIP source crop.
  * Drag and resize the PIP layer in the Render Preview.
* Edit the timeline:

  * Press **S** or click **Split at cursor** to split clips.
  * Drag clips to reorder them.
  * Use the merge buttons on clips to join neighboring clips.
* Render the final video:

  * Choose the render size, quality/speed preset, and CRF or bitrate mode.
  * Click **Render** to open render settings.
  * Use **Render in browser** for direct WebAssembly rendering, or copy the generated FFmpeg command and run it locally.


## 🖥️ Preview

<img src="/preview-images/main.jpg" alt="Main editor preview" height="420">

<img src="/preview-images/silence.jpg" alt="Silence detection preview" height="420">

<img src="/preview-images/render.jpg" alt="Render preview" height="720">

- It even estimates the final video size! <em>(When using Constant Bitrate)</em>


## 💬 Reasonings
  I sometimes need to make quick clips where I just need to remove silence, a few cuts, a simple crop and occasionally PIP - this is something that allows me to do it anytime anywhere.

## 📖 How it works

Stack: Javascript + WASM FFmpeg.

## 🍀 Supporters

**[!["Buy Me A Ramen"](https://raw.githubusercontent.com/patrikzudel/patrikzudel/main/ramen.png)](https://www.buymeacoffee.com/patrikzero)**

> If you like this project and would like to support me, feel free to buy me a ramen! 🍜🍜🍜

> Or **Paypal:**

**[!["Buy Me A Ramen"](https://raw.githubusercontent.com/patrikzudel/patrikzudel/main/ramenpaypal.png)](https://ko-fi.com/patrikzudel)**

💻❤🍲 by [Patrik Žúdel](https://twitter.com/PatrikZero)
