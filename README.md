TJLLazyProperties
=================

Automatically generate lazy getters for object-type properties. Takes all of the properties of a class and generates getters in such a manner as: 
 ```
-(id)object {
  if(!_object) {
    _object = [[Object alloc]init];
  }
  return _object;
}
 ```

Actual practical applications may be limited, as implementing these methods is not to much boilerplate, but it is interesting none the less. Feel free to take it and mess around with it, or submit a pull request if you want to improve or change something. Generator methods are implemented in a superclass, and classes that want to have this behavior should inherit from `TJLLazyProperties`.

<h2>Installation</h2>
<hr>
the prefered method is [Cocoapods](http://www.cocoapods.org), just put `pod 'TJLLazyProperties', '1.0.0'` into your podfile. If you don't want to use cocoapods, just grab the files in the Source folder, drop them into your project and then `#import "TJLLazyProperties.h"` and have the class you wish to have this behavior inherit from `TJLLazyProperties`.

<h1>License</h1>
If you use TJLLazyProperties and you like it, feel free to let me know, <terry@ploverproductions.com>. If you have any issue or want to make improvements, submit a pull request.<br><br>

The MIT License (MIT)
Copyright (c) 2014 Terry Lewis II

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
<br><br>
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
<br><br>
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
