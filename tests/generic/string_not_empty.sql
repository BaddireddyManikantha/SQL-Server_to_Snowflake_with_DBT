{% test string_not_empty(model,column_name)%}
select {{column_name}} from {{model}}
where {{column_name}} is null