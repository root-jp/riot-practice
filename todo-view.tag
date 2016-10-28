<todo-view>
	<style scoped>
		div.card-panel {
			word-break: break-all;
			height: 120px;
		}
	</style>

	<div class"row">
		INPUTタブとVIEWタブは別々のカスタムタグだが、タグ間でデータの共有をしている。
	</div>
	<ul class="row">
		<li each={ todoList } class="col s12 m6 l4">
			<div class="card-panel { done ? 'blue-grey darken-1' : 'teal' } ">
				<span class="white-text">{ note }</span>
			</div>
		</li>
	</ul>
</todo-view>