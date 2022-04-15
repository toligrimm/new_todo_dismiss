create table 'todolist'(
    'todo_id' numeric int, 'todo_name' text, 'todo_status' text)
)


insert into todolist(todo_id, todo_name, todo_status)
values (3, 'work', 'do')

select * from todolist