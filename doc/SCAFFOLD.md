```shell
$ mix phoenix.gen.html Testing testings locale grade name
$ mix phoenix.gen.html Question questions testing_id:integer text:text
$ mix phoenix.gen.html Answer answers question_id:integer text:text correct:boolean
$ mix phoenix.gen.html Result results testing_id:integer valuation:float mark
```
