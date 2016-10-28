<todo-input>
	<style scoped>
		#todo-list .done {
			text-decoration: line-through;
			background-color: #bdbdbd;
		}

		#todo-list.row .col {
			padding: 0;
		}

		#todo-list input[type="checkbox"] + label {
			position: relative;
			top: 3px;
		}

		#todo-list li {
			transition: background-color .5s;
		}

		.secondary-content {
			color: #26a69a;
			position: absolute;
			right: 20px;
		}
	</style>

	<div class="row">
		<form class="col s12">
			<div class="input-field col s8 m8 offset-m1 l10">
				<i class="material-icons prefix">event_note</i>
				<input type="text" id="note" class="validate" length="40" required onkeyup={ input } />
				<label for="note" data-error="wrong" data-success="right">Note</label>
			</div>
			<div class="input-field col s1 m1 l1">
				<button class="waves-effect waves-light btn" disabled={ !existsNote } onclick={ add }>add</button>
			</div>
		</form>
	</div>

	<span if={ todoList.length }>
		<div class="row">
			<div class="input-field col s12 m11 offset-m1">
				<a class="waves-effect waves-light btn" onclick={ removeDone } disabled={ todoList.filter(onlyDone).length == 0 }>done</a>
				<span style="vertical-align: bottom;">
					［&thinsp;{ todoList.filter(onlyDone).length }&ensp;/&ensp;{ todoList.length }&thinsp;］
				</span>
			</div>
		</div>

		<div id="todo-list" class="row">
			<ul class="collection col s12 m10 offset-m1">
				<li each={ todo, i in todoList } class="collection-item truncate {done:todo.done}">
					<input type="checkbox" class="filled-in" id="item-{ i + 1 }" onchange={ check } />
					<label for="item-{ i + 1 }">&thinsp;</label>
					{ todo.note }
					<a href="#!" class="secondary-content" onclick={ edit }>
						<i class="material-icons">edit</i>
					</a>
				</li>
			</ul>
		</div>
	</span>

	<script>
		this.todoList = [];

		input(ev) {
			var inputLength = ev.target.value.length;
			this.existsNote = inputLength >= 1 && inputLength <= 40;

		}

		add(ev) {
			this.todoList.push({ note: this.note.value });
			this.note.value = "";
			this.existsNote = false;
			this.parent.trigger("addToDo", this.todoList);
		}

		edit(ev) {
			Materialize.toast('Not implemented.', 3000);
		}

		check(ev) {
			var todo = ev.item.todo;
			todo.done = !todo.done;
			this.parent.trigger("checkToDo", this.todoList);
		}

	    onlyDone(todo) {
			return todo.done
		}

	    removeDone() {
			this.todoList = this.todoList.filter(function(todo) {
				return !todo.done;
			})
			this.parent.trigger("removeDoneToDo", this.todoList);
	    }

		this.on('mount', function() {
			$("#note").characterCounter();
			todoViewTag = this.parent.todoView;
		})
	</script>
</todo-input>