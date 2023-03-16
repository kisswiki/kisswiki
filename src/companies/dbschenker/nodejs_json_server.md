```javascript
const express = require("express");
const app = express();
const cors = require("cors");
app.use(cors()); // for all routes, can be set for individual routes

let nextId = 1;
let todos = [];

function addTodo(text) {
  const id = nextId;
  todos = [
    ...todos,
    {
      id,
      text,
      done: false,
    },
  ];
  nextId++;
  return id;
}

app.use(express.json());

app.get("/api/todos", (req, res) => res.status(200).json(todos));

app.post("/api/todo", (req, res, next) => {
  if (!req.body || !req.body.text) {
    return next({ status: 400, message: "text field is required" });
  }
  const id = addTodo(req.body.text);
  res.status(200).json({ id, success: true });
});

app.get("/api/todo/:id", (req, res) => {
  const id = parseInt(req.params.id, 10);
  const result = todos.find((todo) => todo.id === id);
  if (!result) {
    return next({ status: 404, message: "not found" });
  }
  res.status(200).json(result);
});

app.put("/api/todo/:id", (req, res) => {
  const id = parseInt(req.params.id, 10);
  const todo = todos.find((todo) => todo.id === id);
  if (!todo) {
    return next({ status: 404, message: "not found" });
  }
  updatedTodo = Object.assign({}, todo, req.body);
  todos = todos.map((doc) => {
    if (doc.id === id) {
      return updatedTodo;
    }
    return doc;
  });
  res.status(200).json({ success: true });
});

app.use((err, req, res, next) => {
  res.status(err.status).json(err);
});

app.listen(3000, () => console.log("Example app listening on port 3000!"));
```

- https://gist.github.com/colinskow/30ce0bf290db9b642ca456a15342f788
- https://www.geeksforgeeks.org/creating-a-simple-json-based-api-using-node-js/
- https://expressjs.com/en/resources/middleware/cors.html
