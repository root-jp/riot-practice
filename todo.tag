<todo>
	<style scoped>
		#todo-tabs {
			margin-bottom: 20px;
		}
	</style>

	<ul id="todo-tabs" class="tabs">
		<li class="tab"><a href="#todo-input">Input</a><li>
		<li class="tab"><a href="#todo-view">View</a><li>
	</ul>
	<article id="todo-input"><todo-input name="todoInput" /></article>
	<article id="todo-view"><todo-view name="todoView" /></article>

	<script>
		this.on("mount", function() {
			$('#todo-tabs').tabs();
		})

		this.on("addToDo checkToDo removeDoneToDo", function(eventName, todoList) {
			this.tags.todoView.update({ todoList: todoList});
		})
	</script>
</todo>