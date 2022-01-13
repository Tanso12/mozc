github上のmozc-2.23.2815を集約､ut辞書とupstreamの辞書を取り込む｡(まだ)
各辞書のライセンスは以下｡なお､Windows上での使用を想定している｡
mozcdic ut https://osdn.net/users/utuhiro/pf/utuhiro/files/
alt-cannadic    GPL-2.0 https://ja.osdn.net/projects/alt-cannadic/wiki/FrontPage
edict2  CC-BY-SA 3.0    http://www.edrdg.org/jmdict/edict.html
skkdic  GPL-2.0-or-later    http://openlab.ring.gr.jp/skk/wiki/wiki.cgi?page=SKK%BC%AD%BD%F1
sudachidict Apache-2.0  https://github.com/WorksApplications/SudachiDict
chimei  public domain  http://www.post.japanpost.jp/zipcode/dl/readme.html
jawiki-articles CC-BY-SA 3.0    https://ja.wikipedia.org/wiki/Wikipedia:%E3%82%A6%E3%82%A3%E3%82%AD%E3%83%9A%E3%83%87%E3%82%A3%E3%82%A2%E3%82%92%E4%BA%8C%E6%AC%A1%E5%88%A9%E7%94%A8%E3%81%99%E3%82%8B
jinmei-ut   Apache-2.0  http://linuxplayers.g1.xrea.com/mozc-ut.html
neologd Apache-2.0  https://github.com/neologd/mecab-ipadic-neologd
jawiki-titles  CC-BY-SA 3.0 https://ja.wikipedia.org/wiki/Wikipedia:%E3%82%A6%E3%82%A3%E3%82%AD%E3%83%9A%E3%83%87%E3%82%A3%E3%82%A2%E3%82%92%E4%BA%8C%E6%AC%A1%E5%88%A9%E7%94%A8%E3%81%99%E3%82%8B
mozc    BSD-3-Clause    https://github.com/google/mozc
---
恐らく､最新のdepot_toolsではビルドできない｡また､Python2とMSVC2015､Qt､Ninjaが必要である｡
各commitは其々の作者が諸権利を有する｡また､本Repository自体が有する著作権は元のライセンスと互換性がある範囲で放棄する｡
mozc-2.23.2815一覧(オリジナルのママForkされているものは無視)
https://github.com/Keruspe/mozc
https://github.com/Polynomdivision/mozc
https://github.com/Ladicle/mozc
https://github.com/ywata/mozc

令和対応済み､Python2とMSVC2015､Qt5.9.9､Ninja10.10.2にてビルド確認｡但し､プロパティ等がエラーで開けない｡
→qwindows.dllをMozc/platformsに入れることで解決｡
更に､Python2とMSVC2015､Qt5.6.3､Ninja10.10.2でも確認｡
[Mozc - a Japanese Input Method Editor designed for multi-platform](https://github.com/google/mozc)
===================================

Copyright 2010-2018, Google Inc.

Mozc is a Japanese Input Method Editor (IME) designed for multi-platform such as
Android OS, Apple OS X, Chromium OS, GNU/Linux and Microsoft Windows.  This
OpenSource project originates from
[Google Japanese Input](http://www.google.com/intl/ja/ime/).

Build Status
------------

|Android + OS X + Linux + NaCl |Windows |
|:----------------------------:|:------:|
[![Build Status](https://travis-ci.org/google/mozc.svg?branch=master)](https://travis-ci.org/google/mozc) |[![Build status](https://ci.appveyor.com/api/projects/status/1rvmtp7f80jv7ehf/branch/master?svg=true)](https://ci.appveyor.com/project/google/mozc/branch/master) |

What's Mozc?
------------
For historical reasons, the project name *Mozc* has two different meanings:

1. Internal code name of Google Japanese Input that is still commonly used
   inside Google.
2. Project name to release a subset of Google Japanese Input in the form of
   source code under OSS license without any warranty nor user support.

In this repository, *Mozc* means the second definition unless otherwise noted.

Detailed differences between Google Japanese Input and Mozc are described in [About Branding](docs/about_branding.md).

Build Instructions
------------------

* [How to build Mozc in Docker](docs/build_mozc_in_docker.md): Android, NaCl, and Linux desktop builds.
* [How to build Mozc in OS X](docs/build_mozc_in_osx.md): OS X build.
* [How to build Mozc in Windows](docs/build_mozc_in_windows.md): Windows build.

Release Plan
------------

tl;dr. **There is no stable version.**

As described in [About Branding](docs/about_branding.md) page, Google does
not promise any official QA for OSS Mozc project.  Because of this,
Mozc does not have a concept of *Stable Release*.  Instead we change version
number every time when we introduce non-trivial change.  If you are
interested in packaging Mozc source code, or developing your own products
based on Mozc, feel free to pick up any version.  They should be equally
stable (or equally unstable) in terms of no official QA process.

[Release History](docs/release_history.md) page may have additional
information and useful links about recent changes.

License
-------

All Mozc code written by Google is released under
[The BSD 3-Clause License](http://opensource.org/licenses/BSD-3-Clause).
For thrid party code under [src/third_party](src/third_party) directory,
see each sub directory to find the copyright notice.  Note also that
outside [src/third_party](src/third_party) following directories contain
thrid party code.

### [src/data/dictionary_oss/](src/data/dictionary_oss)

Mixed.
See [src/data/dictionary_oss/README.txt](src/data/dictionary_oss/README.txt)

### [src/data/test/dictionary/](src/data/test/dictionary)

The same to [src/data/dictionary_oss/](src/data/dictionary_oss).
See [src/data/dictionary_oss/README.txt](src/data/dictionary_oss/README.txt)

### [src/data/test/stress_test/](src/data/test/stress_test)

Public Domain.  See the comment in
[src/data/test/stress_test/sentences.txt](src/data/test/stress_test/sentences.txt)

### [src/data/unicode/](src/data/unicode)

UNICODE, INC. LICENSE AGREEMENT.
See each file header for details.
