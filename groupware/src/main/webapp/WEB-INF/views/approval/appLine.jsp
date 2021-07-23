<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Sol Company</title>
<!-- 2 load the theme CSS file -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
</head>
<body>
	<!-- 3 setup a container element -->
	<div id="jstree">
		<!-- in this example the tree is populated from inline HTML -->
		<ul>
			<li>
				Sol Company
				<ul>
					<li id="child_node_1">관리팀</li>
					<li id="child_node_2">비서팀</li>
					<li id="child_node_3">
						영업팀
						<ul>
							<li>1팀</li>
							<li>2팀</li>
						</ul>
					</li>
					<li id="child_node_4">인사팀</li>
					<li id="child_node_5">총무팀</li>
				</ul>
			</li>
		</ul>
	</div>

	<!-- 4 include the jQuery library -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>

	<!-- 5 include the minified jstree source -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

	<script>
		$ (function () {
			// 6 create an instance when the DOM is ready
			$ ('#jstree').jstree ({
				"plugins" : [
					"wholerow"
				]
			});
			// 7 bind to events triggered on the tree
			$ ('#jstree').on ("changed.jstree", function (e, data) {
				console.log (data.selected);
			});
			// 8 interact with the tree - either way is OK
			$ ('button').on ('click', function () {
				$ ('#jstree').jstree (true).select_node ('child_node_1');
				$ ('#jstree').jstree ('select_node', 'child_node_1');
				$.jstree.reference ('#jstree').select_node ('child_node_1');
			});
		});
	</script>
</body>
</html>