```shell
$ mix phoenix.gen.html Testing testings locale category name
$ mix phoenix.gen.html Question questions testing_id:references:testings text:text
$ mix phoenix.gen.html Answer answers question_id:references:questions text:text correct:boolean
$ mix phoenix.gen.html Result results testing_id:references:testings valuation:float mark
$ mix phoenix.gen.html Reply replies result_id:references:results question_id:references:questions
$ mix phoenix.gen.html Tick ticks question_id:references:questions answer_id:references:answers
```
