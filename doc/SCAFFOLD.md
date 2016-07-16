```shell
$ mix phoenix.gen.html Test tests locale category name
$ mix phoenix.gen.html Question questions test_id:references:tests text:text
$ mix phoenix.gen.html Answer answers question_id:references:questions text:text correct:boolean
$ mix phoenix.gen.html Participation results test_id:references:tests valuation:float mark
$ mix phoenix.gen.model Response responses participation_id:references:participations question_id:references:questions question_text:string
$ mix phoenix.gen.model Opinion opinions response_id:references:responses answer_id:references:answers answer_text:string answer_correct:boolean agree:boolean
```
