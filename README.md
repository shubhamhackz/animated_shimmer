# Animated Shimmer

[![pub package](https://img.shields.io/pub/v/shimmer_animation.svg)](https://pub.dev/packages/shimmer_animation)
![Libraries.io dependency status for latest release](https://img.shields.io/librariesio/release/pub/shimmer_animation)
![License](https://img.shields.io/github/license/maddyb99/shimmer_animation)

_**Supports Null Safety**_

A simple & lightweight widget to display an animated shimmer effect.

Making a skeleton of a widget with shimmer effect while loading data from server or any other source is a common task that can be easily done with AnimatedShimmer widget.
AnimatedShimmer is a simple yet very useful Widget that developers can use it to create an awesome animated shimmer effect for any widget skeleton loading.

## Examples

An example can be found in the example directory of this repository.

More examples will be added soon!

### Loading List 

<img  height="400" src="https://github.com/shubhamhackz/animated_shimmer/blob/main/files/shimmer.gif?raw=true"> 

## How to use

Add `animated_shimmer` to `pubspec.yaml` of your project:

```yaml
dependencies:
  animated_shimmer: ^1.0.0
```

Import it in your Dart code:

```dart
import 'package:animated_shimmer/animated_shimmer.dart';
```

Declare `AnimatedShimmer` widget with required `height` and `width`:

```dart
  AnimatedShimmer(
    height: 10,
    width: 120,
  ),
```

A number of parameters can be passed to customise the look and feel of this animation:

```dart
  AnimatedShimmer(
    height: 10,
    width: 120,
    borderRadius: const BorderRadius.all(Radius.circular(16)),
    delayInMilliSeconds: Duration(milliseconds: index * 500),
  ),
```

To create round `AnimaiedShimmer` : 
```dart
  AnimatedShimmer.round(
    size: 50,
  ),
```


### Parameters:

 - @required _**height**_ : accepts a _**double**_ to set height of the shimmer effect
 - @required _**width**_ : accepts a _**double**_ to set width of the shimmer effect
 - _**startColor**_ : accepts a _**Color**_ and sets the start color of the shimmer effect from which animation will start
 - _**endColor**_ : accepts a _**Color**_ and sets the end color of the shimmer effect to which animation will end
 - _**borderRadius**_ : accepts a _**borderRadius**_ and sets the border radius of the animated shimmer widget
 - _**delayInMilliSeconds**_ : accepts a _Duration_ that would be the delay in starting the animation. Default value is _Duration(milliseconds: 0)_

A detailed API Reference can be found on pub.dev

## License

```
MIT License

Copyright (c) 2022 Shubham Soni

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

