libr.wiki
=========
**WikipediaAPI**

インストール
------------
	% git clone git://github.com/omegatakuma/wiki-lib.git
	% cd wiki-lib
	% make

	gosh> (use libr.wiki)
	#<undef>

使い方
-------
`wiki-get [word] [option]`
+ 第1引数に検索ワード(必須)
+ 第2引数にオプション(任意)

オプション
----------
`wiki-get [word] title`
+ titleを指定するとタイトルをリストで返す。

`wiki-get [word] body`
+ bodyを指定すると内容をリストで返す。

`wiki-get [word] id`
+ idを指定するとidをリストで返す。

`wiki-get [word] url`
+ urlを指定するとURLをリストで返す。
