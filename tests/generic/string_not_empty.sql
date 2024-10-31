{% test string_not_empty(model,column_name)%}
select {{column_name}} from 
{{model}} where {{column_nane}} is test_not_null()
{% endtest %}