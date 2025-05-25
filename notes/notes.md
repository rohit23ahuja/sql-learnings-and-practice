24/5/2025
select * from customer order by first_name --> in this query postgres does the evaluation in this order from --> select --> order by
columns being used in order by clause should in select clause to be used.


25/5/2025
order of evaluation - from -> where -> select -> order by
in postgres, column aliases defined in select clause cannot be used in where clause.

AND is a logical operator that combines two boolean expressions. boolean expressions evaluate to true or false or null.
sql three valued logic unlike many other languages that only use true/false. NULL adds an extra layer of complexity.
TRUE AND anything -> result depends on the other value.
FALSE AND anything -> always FALSE.
NULL AND TRUE -> NULL (unknown)
NULL AND FALSE -> FALSE
NULL AND NULL -> NULL
result of AND operator can be true, false or null.

In the database world, NULL means missing information or not applicable. NULL is not a value, therefore, you cannot compare it with other values like numbers or strings.
