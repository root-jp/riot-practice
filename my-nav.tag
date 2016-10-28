<my-nav>
	<style scoped>
		nav.top-nav {
			box-shadow: none;
			height: 122px;
		}

		nav.top-nav a.page-title {
		    font-size: 48px;
		    line-height: 122px;
		}

		ul.side-nav.fixed li.logo {
			margin-top: 32px;
			text-align: center;
		}

		#logo-container {
			height: 90px;
			margin-bottom: 32px;
		}

		#logo-container img {
			width: 180px;
		}

		ul.side-nav.fixed li.logo:hover, ul.side-nav.fixed li.logo #logo-container:hover {
			background-color: transparent;
		}

		@media only screen and (max-width : 992px) {
			nav .nav-wrapper {
				text-align: center;
			}

			nav .nav-wrapper a.page-title {
			    font-size: 36px;
			}

			a.button-collapse.top-nav.full {
				line-height: 122px;
			}

			a.button-collapse.top-nav {
				color: #fff;
				font-size: 36px;
				position: absolute;
				text-align: center;
				top: 0;
				width: 48px;
				z-index: 2;
			}

			a.button-collapse.top-nav i {
				font-size: 32px;
			}
		}
	</style>

	<nav class="top-nav">
		<div class="container">
			<div class="nav-wrapper">
				<a class="page-title">{ pageTitle }</a>
			</div>
		</div>
	</nav>
	<div class="container">
		<a href="#" data-activates="nav-mobile" class="button-collapse top-nav full hide-on-large-only">
			<i class="material-icons">menu</i>
		</a>
	</div>
	<ul id="nav-mobile" class="side-nav fixed">
		<li class="logo">
			<a id="logo-container" href="#Home" class="brand-logo">
				<img src="http://riotjs.com/img/logo/riot240x.png" />
			</a>
		</li>
		<li>
			<a href="#ToDo" class="waves-effect waves-teal" >ToDo</a>
		</li>
		<li>
			<a href="#Route1" class="waves-effect waves-teal" >Route1</a>
		</li>
		<li>
			<a href="#Route2" class="waves-effect waves-teal" >Route2</a>
		</li>
	</ul>

	<script>
		var _this = this;

		this.on('mount', function() {
			location.hash = "Home";
			$(".button-collapse").sideNav();
		})

		riot.route(function(tagName) {
			_this.update({ pageTitle: tagName })
			riot.mount("#content", tagName.toLowerCase());
		})

		riot.route("(Home)", function(tagName) {
			_this.update({ pageTitle: tagName })
			var homeTag = riot.tag(tagName, "<span style='font-size: 1.2rem;line-height: 2;'>Riot.jsを学習します。<br/>色々試すために、あえて無駄なこともします。</span>");
			riot.mount("#content", homeTag);
		})

		riot.route("Route*", function(tagName) {
			_this.update({ pageTitle: "Route" + tagName })
			riot.mount("#content", "route".toLowerCase(), {
				message: "Routing Test" + tagName + "."
			});
		})

		riot.route.start(true);

	</script>
</my-nav>

