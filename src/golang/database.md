`rows, err = db.Query("SELECT name FROM foo ORDER BY $1", "gophers")`

http://stackoverflow.com/questions/13621242/go-and-sql-parameters


```go
stmt, err := db.Prepare("SELECT * FROM awesome_table WHERE id=$1 AND other_field IN ($2, $3)")
rows, err := stmt.Query(10,"this","that")
```

http://stackoverflow.com/questions/20271123/how-to-execute-an-in-lookup-in-sql-using-golang
