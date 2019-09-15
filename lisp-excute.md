### lisp笔记

#### 脚本运行

core文件就是一个环境镜像文件，它的作用就是解决脚本的依赖，提供一个运行时环境包，含了当时运行时刻所有状态，我们可以先加载所有的必须条件后，用`sb-ext:save-lisp-and-die`生成出的镜像文件。

```lisp
(ql:quickload "") ;安装依赖包
(sb-ext:save-lisp-and-die "core" :executable t) ;生成可执行文件
```

运行lisp脚本

```lisp
sbcl --core core --script *.lisp ;运行脚本
```

#### asdf包管理

```lisp
(require :asdf)
(load "*.asd")
(asdf :load-system "") ; 加载模块
```

