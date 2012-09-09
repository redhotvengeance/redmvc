# RedMVC

A lightweight MVC framework for ActionScript 3.

-----------------------------------------------

> This project has been moved from Google Code to its new home, here on GitHub.

-----------------------------------------------

RedMVC is a relatively non-opinionated, practically invisible Model-View-Controller framework ActionScript 3. It is well suited for a wide variety of projects, whether small microsite, diverse web app, or iterative AIR app.

## Getting Started

RedMVC is essentially a framework woven from helper utilities. It expects you to bring your own model (with VO's), view (with components), and controller (with commands). RedMVC provides interfaces for each of these elements so they can take advantage of the functionality the framework provides.

The fastest way to get started is by taking a look at the [baseproject](https://github.com/redhotvengeance/redmvc/tree/master/examples/baseproject) in the [examples](https://github.com/redhotvengeance/redmvc/tree/master/examples) folder.

## ApplicationManager

The `ApplicationManager` manages each aspect of the application. Your model, view, and controller should be passed to the `ApplicationManger` instance upon initialization. Once initialized, each MVC component will be accessible via their designated managers:

- Model: via the `DataManager`
- View: via the `StageManager`
- Controller: via the `CommandManager`

These managers make it easy to grab a reference to an application component:

```as3
var view:View = StageManager.getInstance().view as View;
```

## Commands

RedMVC brings with it a sophisticated command system to allow for easy command execution from virtually any area of the project.

Command execution is available via the `ApplicationManager`:

```as3
var applicationManager:ApplicationManager = ApplicationManager.getInstance();
applicationManager.executeCommand(new CommandEvent(<command classname>, <optional object of parameters>));
```

The command classes themselves should be written with an `execute` method, which should except a `parameters` object:

```as3
public function execute(parameters:Object):void
{
  <command tasks>
}
```

## Contribute

1. Fork
2. Create
3. Code
4. Push
5. Submit
6. Yay!

## License

(The MIT License)

Copyright (c) 2012 Ian Lollar

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
